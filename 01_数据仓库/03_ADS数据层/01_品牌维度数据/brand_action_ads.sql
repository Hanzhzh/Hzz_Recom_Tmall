--@exclude_input=rec_tmall_alipay_dw
--@exclude_input=rec_tmall_cart_dw
--@exclude_input=rec_tmall_collect_dw
--@exclude_input=rec_tmall_click_dw
--MaxCompute SQL
--********************************************************************--
create table if not exists brand_action_ads(
    brand_id string, 
    click_num bigint,
    collect_num bigint,
    cart_num bigint,
    alipay_num bigint
)partitioned by (ds string) lifecycle 60;

insert overwrite table brand_action_ads partition (ds=${bizdate})
select 
    t1.brand_id, 
    t1.click_num,
    if (t2.collect_num is null, 0, t2.collect_num),
    if (t3.cart_num is null, 0, t3.cart_num),
    if (t4.alipay_num is null, 0, t4.alipay_num)
from (
    select 
        brand_id, 
        count(distinct user_id) as click_num 
    from 
        rec_tmall_click_dw
    where ds<=${bizdate} and ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -60, 'dd'), 'yyyymmdd')
    group by brand_id
)t1 left join(
    select 
        brand_id, 
        count(distinct user_id) as collect_num 
    from 
        rec_tmall_collect_dw
    where ds<=${bizdate} and ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -60, 'dd'), 'yyyymmdd')
    group by brand_id
)t2 on t1.brand_id=t2.brand_id left join(
    select 
        brand_id, 
        count(distinct user_id) as cart_num 
    from 
        rec_tmall_cart_dw
    where ds<=${bizdate} and ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -60, 'dd'), 'yyyymmdd')
    group by brand_id
)t3 on t1.brand_id=t3.brand_id left join(
    select 
        brand_id, 
        count(distinct user_id) as  alipay_num 
    from 
        rec_tmall_alipay_dw
    where ds<=${bizdate} and ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -60, 'dd'), 'yyyymmdd')
    group by brand_id
)t4 on t1.brand_id=t4.brand_id;

