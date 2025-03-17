--MaxCompute SQL
--********************************************************************--
CREATE  TABLE if NOT EXISTS user_click_brand_seq_feature(
    user_id STRING 
    ,brand_id_seq STRING
)PARTITIONED BY (ds STRING) LIFECYCLE 60;

/*
生成用户在过去 30 天内点击的品牌序列，并按照时间倒序排序，最终按用户 ID 进行聚合，将用户点击过的品牌 ID 连接成一个按时间排序的序列
*/
INSERT OVERWRITE TABLE user_click_brand_seq_feature PARTITION(ds='${bizdate}')
SELECT user_id, WM_CONCAT(',', brand_id) as brand_id_seq
from(
    SELECT user_id, brand_id
    from
    (
        --为每个用户按照点击日期排序（每个用户都是１~n排序），每个用户限制最多 50 条记录，　由于MAX(ds) as ds也就是限制50个品牌
        SELECT user_id, brand_id, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY ds DESC) AS number
        FROM(
            SELECT t1.user_id, t1.brand_id, t1.ds
            from(
                --获取过去 30 天用户点击品牌的最近一次点击日期
                SELECT user_id, brand_id, MAX(ds) as ds
                from rec_tmall_click_dw 
                where ds<='${bizdate}' 
                    and ds>=TO_CHAR(DATEADD(TO_DATE('${bizdate}','yyyymmdd'),-30,'dd'),'yyyymmdd') 
                    and brand_id IS NOT NULL
                GROUP BY user_id, brand_id
            --仅保留出现在 brand_top1w_alipay 表中的品牌
            )t1 JOIN (
                SELECT brand_id
                from brand_top1w_alipay
            )t2 on t1.brand_id=t2.brand_id
        )t1
    )t1 where number<=50
)t1 group by user_id;


CREATE  TABLE if NOT EXISTS user_collect_brand_seq_feature(
    user_id STRING 
    ,brand_id_seq STRING
)PARTITIONED BY (ds STRING) LIFECYCLE 60;

INSERT OVERWRITE TABLE user_collect_brand_seq_feature PARTITION(ds='${bizdate}')
SELECT user_id, WM_CONCAT(',', brand_id) as brand_id_seq
from(
    SELECT user_id, brand_id
    from(
        SELECT user_id, brand_id, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY ds DESC) AS number
        FROM(
            SELECT t1.user_id, t1.brand_id, t1.ds
            from(
                SELECT user_id, brand_id, MAX(ds) as ds
                from rec_tmall_collect_dw
                where ds<='${bizdate}' and ds>=TO_CHAR(DATEADD(TO_DATE('${bizdate}','yyyymmdd'),-30,'dd'),'yyyymmdd')
                and brand_id IS NOT NULL
                GROUP BY user_id, brand_id
            )t1 JOIN (
                SELECT brand_id
                from brand_top1w_alipay
            )t2 on t1.brand_id=t2.brand_id
        )t1
    )t1 where number<=50
)t1 group by user_id;


CREATE  TABLE if NOT EXISTS user_alipay_brand_seq_feature(
    user_id STRING 
    ,brand_id_seq STRING
)PARTITIONED BY (ds STRING) LIFECYCLE 60;

INSERT OVERWRITE TABLE user_alipay_brand_seq_feature PARTITION(ds='${bizdate}')
SELECT user_id, WM_CONCAT(',', brand_id) as brand_id_seq
from(
    SELECT user_id, brand_id
    from(
        SELECT user_id, brand_id, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY ds DESC) AS number
        FROM(
            SELECT t1.user_id, t1.brand_id, t1.ds
            from(
                SELECT user_id, brand_id, MAX(ds) as ds
                from rec_tmall_alipay_dw
                where ds<='${bizdate}' and ds>=TO_CHAR(DATEADD(TO_DATE('${bizdate}','yyyymmdd'),-30,'dd'),'yyyymmdd')
                and brand_id IS NOT NULL
                GROUP BY user_id, brand_id
            )t1 JOIN (
                SELECT brand_id
                from brand_top1w_alipay
            )t2 on t1.brand_id=t2.brand_id
        )t1
    )t1 where number<=50
)t1 group by user_id;


-- SELECT * FROM user_click_brand_seq_feature where ds='20130701' limit 100;
