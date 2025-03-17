--MaxCompute SQL
--********************************************************************--
CREATE  TABLE if NOT EXISTS user_click_cate2_seq_feature(
    user_id STRING 
    ,cate2_seq STRING
)PARTITIONED BY (ds STRING) LIFECYCLE 60;

INSERT OVERWRITE TABLE user_click_cate2_seq_feature PARTITION(ds='${bizdate}')
--将每一个用户点击的类别用‘，’放在一起
SELECT user_id, WM_CONCAT(',', cate2) as cate2_seq
from
(
    SELECT user_id, concat('c_', cate2) as cate2
    from
    (
        -- 对每个用户内的各个类别记录，根据最新点击日期 ds 倒序排序，为每一行分配一个行号,筛选每个用户的最新的50点击记录
        SELECT user_id, cate2, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY ds DESC) AS number
        FROM
        (
            -- 按用户和类别分组，提取出每个用户对某一类别的最新点击日期
            SELECT user_id, cate2, MAX(ds) as ds
            from rec_tmall_click_dw
            where ds<='${bizdate}' and ds>=TO_CHAR(DATEADD(TO_DATE('${bizdate}','yyyymmdd'),-30,'dd'),'yyyymmdd') and cate2 IS NOT NULL
            GROUP BY user_id, cate2
        )t1
    )t1 where number<=50
)t1 group by user_id;


CREATE  TABLE if NOT EXISTS user_collect_cate2_seq_feature(
    user_id STRING 
    ,cate2_seq STRING
)PARTITIONED BY (ds STRING) LIFECYCLE 60;

INSERT OVERWRITE TABLE user_collect_cate2_seq_feature PARTITION(ds='${bizdate}')
SELECT user_id, WM_CONCAT(',', cate2) as cate2_seq
from(
    SELECT user_id, concat('c_', cate2) AS cate2
    from(
        SELECT user_id, cate2, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY ds DESC) AS number
        FROM(
            SELECT user_id, cate2, MAX(ds) as ds
            from rec_tmall_collect_dw
            where ds<='${bizdate}' and ds>=TO_CHAR(DATEADD(TO_DATE('${bizdate}','yyyymmdd'),-30,'dd'),'yyyymmdd')
            and cate2 IS NOT NULL
            GROUP BY user_id, cate2
        )t1
    )t1 where number<=50
)t1 group by user_id;


CREATE  TABLE if NOT EXISTS user_alipay_cate2_seq_feature(
    user_id STRING 
    ,cate2_seq STRING
)PARTITIONED BY (ds STRING) LIFECYCLE 60;

INSERT OVERWRITE TABLE user_alipay_cate2_seq_feature PARTITION(ds='${bizdate}')
SELECT user_id, WM_CONCAT(',', cate2) as cate2_seq
from(
    SELECT user_id, concat('c_', cate2) AS cate2    
    from(
        SELECT user_id, cate2, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY ds DESC) AS number
        FROM(
            SELECT user_id, cate2, MAX(ds) as ds
            from rec_tmall_alipay_dw
            where ds<='${bizdate}' and ds>=TO_CHAR(DATEADD(TO_DATE('${bizdate}','yyyymmdd'),-30,'dd'),'yyyymmdd')
            and cate2 IS NOT NULL
            GROUP BY user_id, cate2
        )t1
    )t1 where number<=50
)t1 group by user_id;


-- SELECT * FROM user_click_cate_seq_feature where ds='20130701' limit 100;

