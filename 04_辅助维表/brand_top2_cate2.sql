--MaxCompute SQL
--********************************************************************--
create table if not exists brand_top2_cate2 (
    brand_id string,
    cate2 string
)lifecycle 60;

/*
从最近 30 天内的购买数据中，
为每个在“品牌榜单”（brand_top500_alipay）中的品牌选出支付用户数最多的两个二级类目（cate2），
并将结果写入目标表 brand_top2_cate2
*/
insert overwrite table brand_top2_cate2
select brand_id, cate2
from (
    select brand_id, cate2, ROW_NUMBER() OVER(PARTITION BY brand_id ORDER BY num desc) AS number
    from (
        select t1.brand_id, t1.cate2, count(distinct user_id) as num
        from (
            select user_id, ds, brand_id, cate2
            from rec_tmall_alipay_dw
            where ds<${bizdate} and ds>=to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'),-30, 'dd'),'yyyymmdd')
        )t1 join (
            select brand_id
            from brand_top500_alipay
        )t2 on t1.brand_id=t2.brand_id
        group by t1.cate2, t1.brand_id
    )t1
)t1 where number <=2;



