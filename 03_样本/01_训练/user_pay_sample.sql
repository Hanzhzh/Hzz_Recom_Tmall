--@exclude_input=brand_top500_alipay
--@exclude_input=user_pay_sample_pos
--@exclude_input=user_id_number
--@exclude_input=user_pay_sample_pos
--@exclude_input=rec_tmall_alipay_dw
--MaxCompute SQL
--********************************************************************--

--用户在top500品牌中购买的品牌 作为正样本
create table if not exists user_pay_sample_pos (
    user_id string,
    brand_id string
)PARTITIONED By (ds STRING) LIFECYCLE 60;

INSERT OVERWRITE TABLE user_pay_sample_pos PARTITION(ds=${bizdate})
select t1.user_id, t1.brand_id
from 
(
    select user_id, brand_id
    from rec_tmall_alipay_dw
    where ds > '${bizdate}' and ds <= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'),7, 'dd'),'yyyymmdd')
    group by user_id, brand_id
)t1 
join 
(
    select brand_id
    from brand_top500_alipay_num
)t2 
on t1.brand_id=t2.brand_id
;


create table if not exists user_pay_sample (
    user_id string,
    brand_id string,
    label bigint
)PARTITIONED By (ds STRING) LIFECYCLE 60;

/*
1.对每一个正样本随机生成10个负样本的id
2.将负样本的id与user_id_number中真正样本匹配，确定负样本的user_id ,brand_id
3.将负样本中的正样本去重，并将负样本的 user_id, brand_id,label=0 插入到user_pay_sample表中
4.继续union all所有的正样本 user_id, brand_id,label=1 插入到user_pay_sample表中
*/
INSERT OVERWRITE TABLE user_pay_sample PARTITION(ds=${bizdate})
select t1.neg_user_id as user_id, t1.brand_id, 0 as label
from 
(
    select DISTINCT t1.brand_id, t2.user_id as neg_user_id
    from 
    (
        select TRANS_ARRAY(2, ',', user_id, brand_id, rand_neg) as (user_id, brand_id, rand_neg)
        from 
        (
            select user_id ,brand_id, 
            --生成10个0~1千万的数字，利用数字来挑选负样本
            concat
            (
                cast(rand()*10000000 as bigint),',',
                cast(rand()*10000000 as bigint),',',
                cast(rand()*10000000 as bigint),',',
                cast(rand()*10000000 as bigint),',',
                cast(rand()*10000000 as bigint),',',
                cast(rand()*10000000 as bigint),',',
                cast(rand()*10000000 as bigint),',',
                cast(rand()*10000000 as bigint),',',
                cast(rand()*10000000 as bigint),',',
                cast(rand()*10000000 as bigint)
            ) as rand_neg
            from user_pay_sample_pos
            where ds = '${bizdate}'
        )t
    )t1 
    join 
    (
        select user_id, number
        from user_id_number
    )t2 
    on t1.rand_neg=t2.number
)t1 
left anti join 
(
    select user_id, brand_id
    from user_pay_sample_pos
    where ds = '${bizdate}'
)t2 
on t1.neg_user_id=t2.user_id and t1.brand_id=t2.brand_id

union all

select user_id, brand_id, 1 as label
from user_pay_sample_pos
where ds = '${bizdate}'
;

-- SELECT * FROM user_pay_sample where ds='20130701' limit 100;

