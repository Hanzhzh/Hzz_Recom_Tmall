--@exclude_input=brand_top2_cate2
--@exclude_input=rec_tmall_alipay_dw
--@exclude_input=brand_top2_cate2
--@exclude_input=rec_tmall_cart_dw
--@exclude_input=brand_top2_cate2
--@exclude_input=rec_tmall_collect_dw
--@exclude_input=brand_top2_cate2
--@exclude_input=rec_tmall_click_dw
--MaxCompute SQL
--********************************************************************--
create table if not exists user_cate2_cross_action_ads(
    user_id string,
    brand_id string,

    click_item_90d bigint,
    click_item_60d bigint,
    click_item_30d bigint,
    click_item_15d bigint,
    click_item_7d bigint,
    click_item_3d bigint,
    click_item_1d bigint,

    click_num_90d bigint,
    click_num_60d bigint,
    click_num_30d bigint,
    click_num_15d bigint,
    click_num_7d bigint,
    click_num_3d bigint,
    click_num_1d bigint,

    click_day_90d bigint,
    click_day_60d bigint,
    click_day_30d bigint,
    click_day_15d bigint,
    click_day_7d bigint,
    click_day_3d bigint,
    click_day_1d bigint,

    collect_item_90d bigint,
    collect_item_60d bigint,
    collect_item_30d bigint,
    collect_item_15d bigint,
    collect_item_7d bigint,
    collect_item_3d bigint,
    collect_item_1d bigint,

    cart_item_90d bigint,
    cart_item_60d bigint,
    cart_item_30d bigint,
    cart_item_15d bigint,
    cart_item_7d bigint,
    cart_item_3d bigint,
    cart_item_1d bigint,

    cart_num_90d bigint,
    cart_num_60d bigint,
    cart_num_30d bigint,
    cart_num_15d bigint,
    cart_num_7d bigint,
    cart_num_3d bigint,
    cart_num_1d bigint,

    pay_item_90d bigint,
    pay_item_60d bigint,
    pay_item_30d bigint,
    pay_item_15d bigint,
    pay_item_7d bigint,
    pay_item_3d bigint,
    pay_item_1d bigint,

    pay_num_90d bigint,
    pay_num_60d bigint,
    pay_num_30d bigint,
    pay_num_15d bigint,
    pay_num_7d bigint,
    pay_num_3d bigint,
    pay_num_1d bigint
)partitioned by (ds string) lifecycle 60;

set odps.sql.mapper.split.size=16;
insert overwrite table user_cate2_cross_action_ads partition (ds=${bizdate})
select
    t1.user_id,
    t1.brand_id,

    click_item_90d,
    click_item_60d,
    click_item_30d,
    click_item_15d,
    click_item_7d,
    click_item_3d,
    click_item_1d,

    click_num_90d,
    click_num_60d,
    click_num_30d,
    click_num_15d,
    click_num_7d,
    click_num_3d,
    click_num_1d,

    click_day_90d,
    click_day_60d,
    click_day_30d,
    click_day_15d,
    click_day_7d,
    click_day_3d,
    click_day_1d,

    if(collect_item_90d is null, 0, collect_item_90d),
    if(collect_item_60d is null, 0, collect_item_60d),
    if(collect_item_30d is null, 0, collect_item_30d),
    if(collect_item_15d is null, 0, collect_item_15d),
    if(collect_item_7d is null, 0, collect_item_7d),
    if(collect_item_3d is null, 0, collect_item_3d),
    if(collect_item_1d is null, 0, collect_item_1d),

    if(cart_item_90d is null, 0, cart_item_90d),
    if(cart_item_60d is null, 0, cart_item_60d),
    if(cart_item_30d is null, 0, cart_item_30d),
    if(cart_item_15d is null, 0, cart_item_15d),
    if(cart_item_7d is null, 0, cart_item_7d),
    if(cart_item_3d is null, 0, cart_item_3d),
    if(cart_item_1d is null, 0, cart_item_1d),

    if(cart_num_90d is null, 0, cart_num_90d),
    if(cart_num_60d is null, 0, cart_num_60d),
    if(cart_num_30d is null, 0, cart_num_30d),
    if(cart_num_15d is null, 0, cart_num_15d),
    if(cart_num_7d is null, 0, cart_num_7d),
    if(cart_num_3d is null, 0, cart_num_3d),
    if(cart_num_1d is null, 0, cart_num_1d),

    if(pay_item_90d is null, 0, pay_item_90d),
    if(pay_item_60d is null, 0, pay_item_60d),
    if(pay_item_30d is null, 0, pay_item_30d),
    if(pay_item_15d is null, 0, pay_item_15d),
    if(pay_item_7d is null, 0, pay_item_7d),
    if(pay_item_3d is null, 0, pay_item_3d),
    if(pay_item_1d is null, 0, pay_item_1d),

    if(pay_num_90d is null, 0, pay_num_90d),
    if(pay_num_60d is null, 0, pay_num_60d),
    if(pay_num_30d is null, 0, pay_num_30d),
    if(pay_num_15d is null, 0, pay_num_15d),
    if(pay_num_7d is null, 0, pay_num_7d),
    if(pay_num_3d is null, 0, pay_num_3d),
    if(pay_num_1d is null, 0, pay_num_1d)

from(
    select 
        user_id
        ,brand_id
        --日期符合就取item_id值，否则取null
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -90, 'dd'), 'yyyymmdd'), item_id, null)) as click_item_90d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -60, 'dd'), 'yyyymmdd'), item_id, null)) as click_item_60d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -30, 'dd'), 'yyyymmdd'), item_id, null)) as click_item_30d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -15, 'dd'), 'yyyymmdd'), item_id, null)) as click_item_15d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -7, 'dd'), 'yyyymmdd'), item_id, null)) as click_item_7d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -3, 'dd'), 'yyyymmdd'), item_id, null)) as click_item_3d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -1, 'dd'), 'yyyymmdd'), item_id, null)) as click_item_1d

        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -90, 'dd'), 'yyyymmdd'), 1, 0)) as click_num_90d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -60, 'dd'), 'yyyymmdd'), 1, 0)) as click_num_60d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -30, 'dd'), 'yyyymmdd'), 1, 0)) as click_num_30d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -15, 'dd'), 'yyyymmdd'), 1, 0)) as click_num_15d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -7, 'dd'), 'yyyymmdd'), 1, 0)) as click_num_7d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -3, 'dd'), 'yyyymmdd'), 1, 0)) as click_num_3d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -1, 'dd'), 'yyyymmdd'), 1, 0)) as click_num_1d

        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -90, 'dd'), 'yyyymmdd'), ds, null)) as click_day_90d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -60, 'dd'), 'yyyymmdd'), ds, null)) as click_day_60d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -30, 'dd'), 'yyyymmdd'), ds, null)) as click_day_30d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -15, 'dd'), 'yyyymmdd'), ds, null)) as click_day_15d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -7, 'dd'), 'yyyymmdd'), ds, null)) as click_day_7d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -3, 'dd'), 'yyyymmdd'), ds, null)) as click_day_3d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -1, 'dd'), 'yyyymmdd'), ds, null)) as click_day_1d

    from
    (
        --提取top500的品牌的交叉行为，减少计算量
        select t1.user_id, t1.ds, t2.brand_id, t1.item_id
        from
        (
            select user_id, cate2, item_id, ds
            from rec_tmall_click_dw
            where 
                ds<=${bizdate} 
                and ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -90, 'dd'), 'yyyymmdd')
                and brand_id is not null
        )t1 
        join
        (
            select brand_id, cate2
            from  brand_top2_cate2
        )t2 
        on t1.cate2=t2.cate2
    )t1
    --统计用户与品牌的交互行为
    group by user_id, brand_id
    )t1

    left join

    (
    --收藏特征（注意前一行不要用分号";",因为表格数据还没有填完）
    select 
        user_id
        ,brand_id
        --日期符合就取item_id值，否则取null
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -90, 'dd'), 'yyyymmdd'), item_id, null)) as collect_item_90d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -60, 'dd'), 'yyyymmdd'), item_id, null)) as collect_item_60d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -30, 'dd'), 'yyyymmdd'), item_id, null)) as collect_item_30d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -15, 'dd'), 'yyyymmdd'), item_id, null)) as collect_item_15d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -7, 'dd'), 'yyyymmdd'), item_id, null)) as collect_item_7d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -3, 'dd'), 'yyyymmdd'), item_id, null)) as collect_item_3d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -1, 'dd'), 'yyyymmdd'), item_id, null)) as collect_item_1d

    from
    (
        --提取top500的品牌的交叉行为，减少计算量
        select t1.user_id, t2.brand_id, t1.item_id, t1.ds
        from
        (
            select user_id, cate2, item_id, ds
            from rec_tmall_collect_dw
            where 
                ds<=${bizdate} 
                and ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -90, 'dd'), 'yyyymmdd')
                and brand_id is not null
        )t1 
        join
        (
            select brand_id, cate2
            from  brand_top2_cate2
        )t2 
        on t1.cate2=t2.cate2
    )t1
    --统计用户与品牌的交互行为
    group by user_id, brand_id
    )t2
    on t1.brand_id=t2.brand_id and t1.user_id=t2.user_id

    left join

    (
    --加购行为
    select 
        user_id
        ,brand_id
        --日期符合就取item_id值，否则取null
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -90, 'dd'), 'yyyymmdd'), item_id, null)) as cart_item_90d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -60, 'dd'), 'yyyymmdd'), item_id, null)) as cart_item_60d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -30, 'dd'), 'yyyymmdd'), item_id, null)) as cart_item_30d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -15, 'dd'), 'yyyymmdd'), item_id, null)) as cart_item_15d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -7, 'dd'), 'yyyymmdd'), item_id, null)) as cart_item_7d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -3, 'dd'), 'yyyymmdd'), item_id, null)) as cart_item_3d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -1, 'dd'), 'yyyymmdd'), item_id, null)) as cart_item_1d

        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -90, 'dd'), 'yyyymmdd'), 1, 0)) as cart_num_90d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -60, 'dd'), 'yyyymmdd'), 1, 0)) as cart_num_60d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -30, 'dd'), 'yyyymmdd'), 1, 0)) as cart_num_30d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -15, 'dd'), 'yyyymmdd'), 1, 0)) as cart_num_15d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -7, 'dd'), 'yyyymmdd'), 1, 0)) as cart_num_7d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -3, 'dd'), 'yyyymmdd'), 1, 0)) as cart_num_3d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -1, 'dd'), 'yyyymmdd'), 1, 0)) as cart_num_1d

    from
    (
        --提取top500的品牌的交叉行为，减少计算量
        select t1.user_id, t2.brand_id, t1.item_id, t1.ds
        from
        (
            select user_id, cate2, item_id, ds
            from rec_tmall_cart_dw
            where 
                ds<=${bizdate} 
                and ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -90, 'dd'), 'yyyymmdd')
                and brand_id is not null
        )t1 
        join
        (
            select brand_id, cate2
            from  brand_top2_cate2
        )t2 
        on t1.cate2=t2.cate2
    )t1
    --统计用户与品牌的交互行为
    group by user_id, brand_id
    )t3
    on t3.brand_id=t1.brand_id and t3.user_id=t1.user_id

    left join

    (
    --购买特征
    select 
        user_id
        ,brand_id
        --日期符合就取item_id值，否则取null
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -90, 'dd'), 'yyyymmdd'), item_id, null)) as pay_item_90d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -60, 'dd'), 'yyyymmdd'), item_id, null)) as pay_item_60d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -30, 'dd'), 'yyyymmdd'), item_id, null)) as pay_item_30d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -15, 'dd'), 'yyyymmdd'), item_id, null)) as pay_item_15d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -7, 'dd'), 'yyyymmdd'), item_id, null)) as pay_item_7d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -3, 'dd'), 'yyyymmdd'), item_id, null)) as pay_item_3d
        ,count(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -1, 'dd'), 'yyyymmdd'), item_id, null)) as pay_item_1d

        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -90, 'dd'), 'yyyymmdd'), 1, 0)) as pay_num_90d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -60, 'dd'), 'yyyymmdd'), 1, 0)) as pay_num_60d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -30, 'dd'), 'yyyymmdd'), 1, 0)) as pay_num_30d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -15, 'dd'), 'yyyymmdd'), 1, 0)) as pay_num_15d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -7, 'dd'), 'yyyymmdd'), 1, 0)) as pay_num_7d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -3, 'dd'), 'yyyymmdd'), 1, 0)) as pay_num_3d
        ,sum(distinct if(ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -1, 'dd'), 'yyyymmdd'), 1, 0)) as pay_num_1d

    from
    (
        --提取top500的品牌的交叉行为，减少计算量
        select t1.user_id, t2.brand_id, t1.item_id, t1.ds
        from
        (
            select user_id, cate2, item_id, ds
            from rec_tmall_alipay_dw
            where 
                ds<=${bizdate} 
                and ds>= to_char(dateadd(to_date(${bizdate}, 'yyyymmdd'), -90, 'dd'), 'yyyymmdd')
                and brand_id is not null
        )t1 
        join
        (
            select brand_id, cate2
            from  brand_top2_cate2
        )t2 
        on t1.cate2=t2.cate2
    )t1
    --统计用户与品牌的交互行为
    group by user_id, brand_id
    )t4
    on t4.brand_id=t1.brand_id and t4.user_id=t1.user_id
;






-- select * from user_brand_cate2_cross_beh_feature_ads where ds=20130708 limit 10;

