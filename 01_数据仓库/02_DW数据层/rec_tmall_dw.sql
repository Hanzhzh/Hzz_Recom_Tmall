--MaxCompute SQL
--********************************************************************--

--用户点击行为
create table if not exists rec_tmall_click_dw(
    user_id string comment '用户id',
    item_id string comment '商品id',
    brand_id string comment '品牌id',
    seller_id string comment '商家id',
    cate1 string comment '类目1_id',
    cate2 string comment '类目2_id',
    op_time string comment '点击时间'
)partitioned by (ds string comment '日期分区')
lifecycle 60
;

--添加购物车行为
create table if not exists rec_tmall_cart_dw(
    user_id string comment '用户id',
    item_id string comment '商品id',
    brand_id string comment '品牌id',
    seller_id string comment '商家id',
    cate1 string comment '类目1_id',
    cate2 string comment '类目2_id',
    op_time string comment '点击时间'
)partitioned by (ds string comment '日期分区')
lifecycle 60;

--收藏行为
create table if not exists rec_tmall_collect_dw(
    user_id string comment '用户id',
    item_id string comment '商品id',
    brand_id string comment '品牌id',
    seller_id string comment '商家id',
    cate1 string comment '类目1_id',
    cate2 string comment '类目2_id',
    op_time string comment '点击时间'
)partitioned by (ds string comment '日期分区')
lifecycle 60;

--购买行为
create table if not exists rec_tmall_alipay_dw(
    user_id string comment '用户id',
    item_id string comment '商品id',
    brand_id string comment '品牌id',
    seller_id string comment '商家id',
    cate1 string comment '类目1_id',
    cate2 string comment '类目2_id',
    op_time string comment '点击时间'
)partitioned by (ds string comment '日期分区')
lifecycle 60;

insert overwrite table rec_tmall_click_dw partition (ds)
select t1.user_id, t2.item_id, t2.brand_id, t2.seller_id, t2.cate1, t2.cate2, t1.vtime, t1.ds
from
(
    select 
        user_id, 
        item_id, 
        vtime, 
        to_char(to_date(vtime, 'yyyy-mm-dd hh:mi:ss'), 'yyyymmdd') as ds
    from 
        rec_tmall_log
    where 
        action = 'click'
) t1 
join
(
    select
        item_id,
        brand_id,
        seller_id,
        split_part(category, '-', 1) as cate1,
        split_part(category, '-', 2) as cate2
    from
        rec_tmall_product
) t2 
on t1.item_id = t2.item_id;

insert overwrite table rec_tmall_cart_dw partition (ds)
select t1.user_id, t2.item_id, t2.brand_id, t2.seller_id, t2.cate1, t2.cate2, t1.vtime, t1.ds
from(
    select 
        user_id, 
        item_id, 
        vtime, 
        to_char(to_date(vtime, 'yyyy-mm-dd hh:mi:ss'), 'yyyymmdd') as ds
    from 
        rec_tmall_log
    where 
        action = 'cart'
) t1 
join(
    select
        item_id,
        brand_id,
        seller_id,
        split_part(category, '-', 1) as cate1,
        split_part(category, '-', 2) as cate2
    from
        rec_tmall_product
) t2 
on t1.item_id = t2.item_id;

insert overwrite table rec_tmall_collect_dw partition (ds)
select t1.user_id, t2.item_id, t2.brand_id, t2.seller_id, t2.cate1, t2.cate2, t1.vtime, t1.ds
from(
    select 
        user_id, 
        item_id, 
        vtime, 
        to_char(to_date(vtime, 'yyyy-mm-dd hh:mi:ss'), 'yyyymmdd') as ds
    from 
        rec_tmall_log
    where 
        action = 'collect'
) t1 
join(
    select
        item_id,
        brand_id,
        seller_id,
        split_part(category, '-', 1) as cate1,
        split_part(category, '-', 2) as cate2
    from
        rec_tmall_product
) t2 
on t1.item_id = t2.item_id;

insert overwrite table rec_tmall_alipay_dw partition (ds)
select t1.user_id, t2.item_id, t2.brand_id, t2.seller_id, t2.cate1, t2.cate2, t1.vtime, t1.ds
from(
    select 
        user_id, 
        item_id, 
        vtime, 
        to_char(to_date(vtime, 'yyyy-mm-dd hh:mi:ss'), 'yyyymmdd') as ds
    from 
        rec_tmall_log
    where 
        action = 'alipay'
) t1 
join(
    select
        item_id,
        brand_id,
        seller_id,
        split_part(category, '-', 1) as cate1,
        split_part(category, '-', 2) as cate2
    from
        rec_tmall_product
) t2 
on t1.item_id = t2.item_id;

-- SELECT * from rec_tmall_alipay_dw where ds = '20130701' limit 10;

-- select t1.user_id, t1.brand_id
-- from (
--     select brand_id, user_id, item_id 
--     from rec_tmall_collect_dw
--     where ds BETWEEN '20130701' and '20130930'
-- )t1
-- join(
--     select brand_id, user_id, item_id 
--     FROM rec_tmall_alipay_dw
--     where ds BETWEEN '20130701' and '20130930'
-- )t2 
-- on t1.user_id = t2.user_id 
-- and t1.item_id = t2.item_id 
-- limit 10;


