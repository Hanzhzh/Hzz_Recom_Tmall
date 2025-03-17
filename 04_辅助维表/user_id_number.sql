--@exclude_input=user_item_beh_log
--MaxCompute SQL
--********************************************************************--
create table if not exists user_id_number(
    user_id string, 
    number bigint
)lifecycle 60;

-- 生成一个用户 ID 到随机编号的映射表, 用于构建正负样本
insert overwrite table user_id_number
select user_id, row_number() over(order by rnd desc) as number
from
(
    select user_id, rand() as rnd
    from
    (
        select distinct user_id
        from rec_tmall_log
    )t1
)t1
;

