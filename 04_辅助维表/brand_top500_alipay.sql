--MaxCompute SQL
--********************************************************************--
create table if not exists brand_top500_alipay
(
    brand_id string, 
    alipay_user_num bigint
)lifecycle 60;

insert overwrite table brand_top500_alipay
select 
    brand_id,
    alipay_user_num
from
(
    select 
        brand_id,
        count(distinct user_id) as alipay_user_num
    from 
        rec_tmall_alipay_dw
    where 
        ds<=${bizdate} 
        and ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -30, 'dd'), 'yyyymmdd')
        and brand_id is not null
    group by brand_id
)t1
order by alipay_user_num 
desc limit 500;
