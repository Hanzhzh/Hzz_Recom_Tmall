--MaxCompute SQL
--********************************************************************--
create table if not exists user_pay_sample_feature_join_gbdt(
    user_id string,
    brand_id string,
    label bigint,
    bizdate string,
    rnd double,

    click_item_num_3d bigint,
    click_brand_num_3d bigint,
    click_seller_num_3d bigint,
    click_cate1_num_3d bigint,
    click_cate2_num_3d bigint,
    click_cnt_days_3d bigint,
    click_item_num_7d bigint,
    click_brand_num_7d bigint,
    click_seller_num_7d bigint,
    click_cate1_num_7d bigint,
    click_cate2_num_7d bigint,
    click_cnt_days_7d bigint,
    click_item_num_15d bigint,
    click_brand_num_15d bigint,
    click_seller_num_15d bigint,
    click_cate1_num_15d bigint,
    click_cate2_num_15d bigint,
    click_cnt_days_15d bigint,
    click_item_num_30d bigint,
    click_brand_num_30d bigint,
    click_seller_num_30d bigint,
    click_cate1_num_30d bigint,
    click_cate2_num_30d bigint,
    click_cnt_days_30d bigint,
    click_item_num_60d bigint,
    click_brand_num_60d bigint,
    click_seller_num_60d bigint,
    click_cate1_num_60d bigint,
    click_cate2_num_60d bigint,
    click_cnt_days_60d bigint,
    click_item_num_90d bigint,
    click_brand_num_90d bigint,
    click_seller_num_90d bigint,
    click_cate1_num_90d bigint,
    click_cate2_num_90d bigint,
    click_cnt_days_90d bigint,

    collect_item_num_3d bigint,
    collect_brand_num_3d bigint,
    collect_seller_num_3d bigint,
    collect_cate1_num_3d bigint,
    collect_cate2_num_3d bigint,
    collect_item_num_7d bigint,
    collect_brand_num_7d bigint,
    collect_seller_num_7d bigint,
    collect_cate1_num_7d bigint,
    collect_cate2_num_7d bigint,
    collect_item_num_15d bigint,
    collect_brand_num_15d bigint,
    collect_seller_num_15d bigint,
    collect_cate1_num_15d bigint,
    collect_cate2_num_15d bigint,
    collect_item_num_30d bigint,
    collect_brand_num_30d bigint,
    collect_seller_num_30d bigint,
    collect_cate1_num_30d bigint,
    collect_cate2_num_30d bigint,
    collect_item_num_60d bigint,
    collect_brand_num_60d bigint,
    collect_seller_num_60d bigint,
    collect_cate1_num_60d bigint,
    collect_cate2_num_60d bigint,
    collect_item_num_90d bigint,
    collect_brand_num_90d bigint,
    collect_seller_num_90d bigint,
    collect_cate1_num_90d bigint,
    collect_cate2_num_90d bigint,

    cart_item_num_3d bigint,
    cart_brand_num_3d bigint,
    cart_seller_num_3d bigint,
    cart_cate1_num_3d bigint,
    cart_cate2_num_3d bigint,
    cart_item_num_7d bigint,
    cart_brand_num_7d bigint,
    cart_seller_num_7d bigint,
    cart_cate1_num_7d bigint,
    cart_cate2_num_7d bigint,
    cart_item_num_15d bigint,
    cart_brand_num_15d bigint,
    cart_seller_num_15d bigint,
    cart_cate1_num_15d bigint,
    cart_cate2_num_15d bigint,
    cart_item_num_30d bigint,
    cart_brand_num_30d bigint,
    cart_seller_num_30d bigint,
    cart_cate1_num_30d bigint,
    cart_cate2_num_30d bigint,
    cart_item_num_60d bigint,
    cart_brand_num_60d bigint,
    cart_seller_num_60d bigint,
    cart_cate1_num_60d bigint,
    cart_cate2_num_60d bigint,
    cart_item_num_90d bigint,
    cart_brand_num_90d bigint,
    cart_seller_num_90d bigint,
    cart_cate1_num_90d bigint,
    cart_cate2_num_90d bigint,

    pay_item_num_3d bigint,
    pay_brand_num_3d bigint,
    pay_seller_num_3d bigint,
    pay_cate1_num_3d bigint,
    pay_cate2_num_3d bigint,
    pay_item_num_7d bigint,
    pay_brand_num_7d bigint,
    pay_seller_num_7d bigint,
    pay_cate1_num_7d bigint,
    pay_cate2_num_7d bigint,
    pay_item_num_15d bigint,
    pay_brand_num_15d bigint,
    pay_seller_num_15d bigint,
    pay_cate1_num_15d bigint,
    pay_cate2_num_15d bigint,
    pay_item_num_30d bigint,
    pay_brand_num_30d bigint,
    pay_seller_num_30d bigint,
    pay_cate1_num_30d bigint,
    pay_cate2_num_30d bigint,
    pay_item_num_60d bigint,
    pay_brand_num_60d bigint,
    pay_seller_num_60d bigint,
    pay_cate1_num_60d bigint,
    pay_cate2_num_60d bigint,
    pay_item_num_90d bigint,
    pay_brand_num_90d bigint,
    pay_seller_num_90d bigint,
    pay_cate1_num_90d bigint,
    pay_cate2_num_90d bigint,

    brand_click_num bigint,
    brand_collect_num bigint,
    brand_cart_num bigint,
    brand_alipay_num bigint,

    cb_click_item_90d bigint,
    cb_click_item_60d bigint,
    cb_click_item_30d bigint,
    cb_click_item_15d bigint,
    cb_click_item_7d bigint,
    cb_click_item_3d bigint,
    cb_click_item_1d bigint,
    cb_click_num_90d bigint,
    cb_click_num_60d bigint,
    cb_click_num_30d bigint,
    cb_click_num_15d bigint,
    cb_click_num_7d bigint,
    cb_click_num_3d bigint,
    cb_click_num_1d bigint,
    cb_click_day_90d bigint,
    cb_click_day_60d bigint,
    cb_click_day_30d bigint,
    cb_click_day_15d bigint,
    cb_click_day_7d bigint,
    cb_click_day_3d bigint,
    cb_click_day_1d bigint,
    cb_collect_item_90d bigint,
    cb_collect_item_60d bigint,
    cb_collect_item_30d bigint,
    cb_collect_item_15d bigint,
    cb_collect_item_7d bigint,
    cb_collect_item_3d bigint,
    cb_collect_item_1d bigint,
    cb_cart_item_90d bigint,
    cb_cart_item_60d bigint,
    cb_cart_item_30d bigint,
    cb_cart_item_15d bigint,
    cb_cart_item_7d bigint,
    cb_cart_item_3d bigint,
    cb_cart_item_1d bigint,
    cb_cart_num_90d bigint,
    cb_cart_num_60d bigint,
    cb_cart_num_30d bigint,
    cb_cart_num_15d bigint,
    cb_cart_num_7d bigint,
    cb_cart_num_3d bigint,
    cb_cart_num_1d bigint,
    cb_pay_item_90d bigint,
    cb_pay_item_60d bigint,
    cb_pay_item_30d bigint,
    cb_pay_item_15d bigint,
    cb_pay_item_7d bigint,
    cb_pay_item_3d bigint,
    cb_pay_item_1d bigint,
    cb_pay_num_90d bigint,
    cb_pay_num_60d bigint,
    cb_pay_num_30d bigint,
    cb_pay_num_15d bigint,
    cb_pay_num_7d bigint,
    cb_pay_num_3d bigint,
    cb_pay_num_1d bigint,

    c2_click_item_90d bigint,
    c2_click_item_60d bigint,
    c2_click_item_30d bigint,
    c2_click_item_15d bigint,
    c2_click_item_7d bigint,
    c2_click_item_3d bigint,
    c2_click_item_1d bigint,
    c2_click_num_90d bigint,
    c2_click_num_60d bigint,
    c2_click_num_30d bigint,
    c2_click_num_15d bigint,
    c2_click_num_7d bigint,
    c2_click_num_3d bigint,
    c2_click_num_1d bigint,
    c2_click_day_90d bigint,
    c2_click_day_60d bigint,
    c2_click_day_30d bigint,
    c2_click_day_15d bigint,
    c2_click_day_7d bigint,
    c2_click_day_3d bigint,
    c2_click_day_1d bigint,
    c2_collect_item_90d bigint,
    c2_collect_item_60d bigint,
    c2_collect_item_30d bigint,
    c2_collect_item_15d bigint,
    c2_collect_item_7d bigint,
    c2_collect_item_3d bigint,
    c2_collect_item_1d bigint,
    c2_cart_item_90d bigint,
    c2_cart_item_60d bigint,
    c2_cart_item_30d bigint,
    c2_cart_item_15d bigint,
    c2_cart_item_7d bigint,
    c2_cart_item_3d bigint,
    c2_cart_item_1d bigint,
    c2_cart_num_90d bigint,
    c2_cart_num_60d bigint,
    c2_cart_num_30d bigint,
    c2_cart_num_15d bigint,
    c2_cart_num_7d bigint,
    c2_cart_num_3d bigint,
    c2_cart_num_1d bigint,
    c2_pay_item_90d bigint,
    c2_pay_item_60d bigint,
    c2_pay_item_30d bigint,
    c2_pay_item_15d bigint,
    c2_pay_item_7d bigint,
    c2_pay_item_3d bigint,
    c2_pay_item_1d bigint,
    c2_pay_num_90d bigint,
    c2_pay_num_60d bigint,
    c2_pay_num_30d bigint,
    c2_pay_num_15d bigint,
    c2_pay_num_7d bigint,
    c2_pay_num_3d bigint,
    c2_pay_num_1d bigint
)partitioned by (ds string) lifecycle 60;


insert overwrite table user_pay_sample_feature_join_gbdt partition (ds=${bizdate})
select
    t1.user_id
    ,t1.brand_id
    ,t1.label
    ,t1.ds 
    ,RAND() as rnd

    ,if(t2.item_num_3d is null, 0, t2.item_num_3d)
    ,if(t2.brand_num_3d is null, 0, t2.brand_num_3d)
    ,if(t2.seller_num_3d is null, 0, t2.seller_num_3d)
    ,if(t2.cate1_num_3d is null, 0, t2.cate1_num_3d)
    ,if(t2.cate2_num_3d is null, 0, t2.cate2_num_3d)
    ,if(t2.cnt_days_3d is null, 0, t2.cnt_days_3d)
    ,if(t2.item_num_7d is null, 0, t2.item_num_7d)
    ,if(t2.brand_num_7d is null, 0, t2.brand_num_7d)
    ,if(t2.seller_num_7d is null, 0, t2.seller_num_7d)
    ,if(t2.cate1_num_7d is null, 0, t2.cate1_num_7d)
    ,if(t2.cate2_num_7d is null, 0, t2.cate2_num_7d)
    ,if(t2.cnt_days_7d is null, 0, t2.cnt_days_7d)
    ,if(t2.item_num_15d is null, 0, t2.item_num_15d)
    ,if(t2.brand_num_15d is null, 0, t2.brand_num_15d)
    ,if(t2.seller_num_15d is null, 0, t2.seller_num_15d)
    ,if(t2.cate1_num_15d is null, 0, t2.cate1_num_15d)
    ,if(t2.cate2_num_15d is null, 0, t2.cate2_num_15d)
    ,if(t2.cnt_days_15d is null, 0, t2.cnt_days_15d)
    ,if(t2.item_num_30d is null, 0, t2.item_num_30d)
    ,if(t2.brand_num_30d is null, 0, t2.brand_num_30d)
    ,if(t2.seller_num_30d is null, 0, t2.seller_num_30d)
    ,if(t2.cate1_num_30d is null, 0, t2.cate1_num_30d)
    ,if(t2.cate2_num_30d is null, 0, t2.cate2_num_30d)
    ,if(t2.cnt_days_30d is null, 0, t2.cnt_days_30d)
    ,if(t2.item_num_60d is null, 0, t2.item_num_60d)
    ,if(t2.brand_num_60d is null, 0, t2.brand_num_60d)
    ,if(t2.seller_num_60d is null, 0, t2.seller_num_60d)
    ,if(t2.cate1_num_60d is null, 0, t2.cate1_num_60d)
    ,if(t2.cate2_num_60d is null, 0, t2.cate2_num_60d)
    ,if(t2.cnt_days_60d is null, 0, t2.cnt_days_60d)
    ,if(t2.item_num_90d is null, 0, t2.item_num_90d)
    ,if(t2.brand_num_90d is null, 0, t2.brand_num_90d)
    ,if(t2.seller_num_90d is null, 0, t2.seller_num_90d)
    ,if(t2.cate1_num_90d is null, 0, t2.cate1_num_90d)
    ,if(t2.cate2_num_90d is null, 0, t2.cate2_num_90d)
    ,if(t2.cnt_days_90d is null, 0, t2.cnt_days_90d)

    ,if(t3.item_num_3d is null, 0, t3.item_num_3d)
    ,if(t3.brand_num_3d is null, 0, t3.brand_num_3d)
    ,if(t3.seller_num_3d is null, 0, t3.seller_num_3d)
    ,if(t3.cate1_num_3d is null, 0, t3.cate1_num_3d)
    ,if(t3.cate2_num_3d is null, 0, t3.cate2_num_3d)
    ,if(t3.item_num_7d is null, 0, t3.item_num_7d)
    ,if(t3.brand_num_7d is null, 0, t3.brand_num_7d)
    ,if(t3.seller_num_7d is null, 0, t3.seller_num_7d)
    ,if(t3.cate1_num_7d is null, 0, t3.cate1_num_7d)
    ,if(t3.cate2_num_7d is null, 0, t3.cate2_num_7d)
    ,if(t3.item_num_15d is null, 0, t3.item_num_15d)
    ,if(t3.brand_num_15d is null, 0, t3.brand_num_15d)
    ,if(t3.seller_num_15d is null, 0, t3.seller_num_15d)
    ,if(t3.cate1_num_15d is null, 0, t3.cate1_num_15d)
    ,if(t3.cate2_num_15d is null, 0, t3.cate2_num_15d)
    ,if(t3.item_num_30d is null, 0, t3.item_num_30d)
    ,if(t3.brand_num_30d is null, 0, t3.brand_num_30d)
    ,if(t3.seller_num_30d is null, 0, t3.seller_num_30d)
    ,if(t3.cate1_num_30d is null, 0, t3.cate1_num_30d)
    ,if(t3.cate2_num_30d is null, 0, t3.cate2_num_30d)
    ,if(t3.item_num_60d is null, 0, t3.item_num_60d)
    ,if(t3.brand_num_60d is null, 0, t3.brand_num_60d)
    ,if(t3.seller_num_60d is null, 0, t3.seller_num_60d)
    ,if(t3.cate1_num_60d is null, 0, t3.cate1_num_60d)
    ,if(t3.cate2_num_60d is null, 0, t3.cate2_num_60d)
    ,if(t3.item_num_90d is null, 0, t3.item_num_90d)
    ,if(t3.brand_num_90d is null, 0, t3.brand_num_90d)
    ,if(t3.seller_num_90d is null, 0, t3.seller_num_90d)
    ,if(t3.cate1_num_90d is null, 0, t3.cate1_num_90d)
    ,if(t3.cate2_num_90d is null, 0, t3.cate2_num_90d)

    ,if(t4.item_num_3d is null, 0, t4.item_num_3d)
    ,if(t4.brand_num_3d is null, 0, t4.brand_num_3d)
    ,if(t4.seller_num_3d is null, 0, t4.seller_num_3d)
    ,if(t4.cate1_num_3d is null, 0, t4.cate1_num_3d)
    ,if(t4.cate2_num_3d is null, 0, t4.cate2_num_3d)
    ,if(t4.item_num_7d is null, 0, t4.item_num_7d)
    ,if(t4.brand_num_7d is null, 0, t4.brand_num_7d)
    ,if(t4.seller_num_7d is null, 0, t4.seller_num_7d)
    ,if(t4.cate1_num_7d is null, 0, t4.cate1_num_7d)
    ,if(t4.cate2_num_7d is null, 0, t4.cate2_num_7d)
    ,if(t4.item_num_15d is null, 0, t4.item_num_15d)
    ,if(t4.brand_num_15d is null, 0, t4.brand_num_15d)
    ,if(t4.seller_num_15d is null, 0, t4.seller_num_15d)
    ,if(t4.cate1_num_15d is null, 0, t4.cate1_num_15d)
    ,if(t4.cate2_num_15d is null, 0, t4.cate2_num_15d)
    ,if(t4.item_num_30d is null, 0, t4.item_num_30d)
    ,if(t4.brand_num_30d is null, 0, t4.brand_num_30d)
    ,if(t4.seller_num_30d is null, 0, t4.seller_num_30d)
    ,if(t4.cate1_num_30d is null, 0, t4.cate1_num_30d)
    ,if(t4.cate2_num_30d is null, 0, t4.cate2_num_30d)
    ,if(t4.item_num_60d is null, 0, t4.item_num_60d)
    ,if(t4.brand_num_60d is null, 0, t4.brand_num_60d)
    ,if(t4.seller_num_60d is null, 0, t4.seller_num_60d)
    ,if(t4.cate1_num_60d is null, 0, t4.cate1_num_60d)
    ,if(t4.cate2_num_60d is null, 0, t4.cate2_num_60d)
    ,if(t4.item_num_90d is null, 0, t4.item_num_90d)
    ,if(t4.brand_num_90d is null, 0, t4.brand_num_90d)
    ,if(t4.seller_num_90d is null, 0, t4.seller_num_90d)
    ,if(t4.cate1_num_90d is null, 0, t4.cate1_num_90d)
    ,if(t4.cate2_num_90d is null, 0, t4.cate2_num_90d)

    ,if(t5.item_num_3d is null, 0, t5.item_num_3d)
    ,if(t5.brand_num_3d is null, 0, t5.brand_num_3d)
    ,if(t5.seller_num_3d is null, 0, t5.seller_num_3d)
    ,if(t5.cate1_num_3d is null, 0, t5.cate1_num_3d)
    ,if(t5.cate2_num_3d is null, 0, t5.cate2_num_3d)
    ,if(t5.item_num_7d is null, 0, t5.item_num_7d)
    ,if(t5.brand_num_7d is null, 0, t5.brand_num_7d)
    ,if(t5.seller_num_7d is null, 0, t5.seller_num_7d)
    ,if(t5.cate1_num_7d is null, 0, t5.cate1_num_7d)
    ,if(t5.cate2_num_7d is null, 0, t5.cate2_num_7d)
    ,if(t5.item_num_15d is null, 0, t5.item_num_15d)
    ,if(t5.brand_num_15d is null, 0, t5.brand_num_15d)
    ,if(t5.seller_num_15d is null, 0, t5.seller_num_15d)
    ,if(t5.cate1_num_15d is null, 0, t5.cate1_num_15d)
    ,if(t5.cate2_num_15d is null, 0, t5.cate2_num_15d)
    ,if(t5.item_num_30d is null, 0, t5.item_num_30d)
    ,if(t5.brand_num_30d is null, 0, t5.brand_num_30d)
    ,if(t5.seller_num_30d is null, 0, t5.seller_num_30d)
    ,if(t5.cate1_num_30d is null, 0, t5.cate1_num_30d)
    ,if(t5.cate2_num_30d is null, 0, t5.cate2_num_30d)
    ,if(t5.item_num_60d is null, 0, t5.item_num_60d)
    ,if(t5.brand_num_60d is null, 0, t5.brand_num_60d)
    ,if(t5.seller_num_60d is null, 0, t5.seller_num_60d)
    ,if(t5.cate1_num_60d is null, 0, t5.cate1_num_60d)
    ,if(t5.cate2_num_60d is null, 0, t5.cate2_num_60d)
    ,if(t5.item_num_90d is null, 0, t5.item_num_90d)
    ,if(t5.brand_num_90d is null, 0, t5.brand_num_90d)
    ,if(t5.seller_num_90d is null, 0, t5.seller_num_90d)
    ,if(t5.cate1_num_90d is null, 0, t5.cate1_num_90d)
    ,if(t5.cate2_num_90d is null, 0, t5.cate2_num_90d)

    ,if(t6.click_num is null, 0, t6.click_num)
    ,if(t6.collect_num is null, 0, t6.collect_num)
    ,if(t6.cart_num is null, 0, t6.cart_num)
    ,if(t6.alipay_num is null, 0, t6.alipay_num)

    ,if(t7.click_item_90d is null, 0, t7.click_item_90d)
    ,if(t7.click_item_60d is null, 0, t7.click_item_60d)
    ,if(t7.click_item_30d is null, 0, t7.click_item_30d)
    ,if(t7.click_item_15d is null, 0, t7.click_item_15d)
    ,if(t7.click_item_7d is null, 0, t7.click_item_7d)
    ,if(t7.click_item_3d is null, 0, t7.click_item_3d)
    ,if(t7.click_item_1d is null, 0, t7.click_item_1d)
    ,if(t7.click_num_90d is null, 0, t7.click_num_90d)
    ,if(t7.click_num_60d is null, 0, t7.click_num_60d)
    ,if(t7.click_num_30d is null, 0, t7.click_num_30d)
    ,if(t7.click_num_15d is null, 0, t7.click_num_15d)
    ,if(t7.click_num_7d is null, 0, t7.click_num_7d)
    ,if(t7.click_num_3d is null, 0, t7.click_num_3d)
    ,if(t7.click_num_1d is null, 0, t7.click_num_1d)
    ,if(t7.click_day_90d is null, 0, t7.click_day_90d)
    ,if(t7.click_day_60d is null, 0, t7.click_day_60d)
    ,if(t7.click_day_30d is null, 0, t7.click_day_30d)
    ,if(t7.click_day_15d is null, 0, t7.click_day_15d)
    ,if(t7.click_day_7d is null, 0, t7.click_day_7d)
    ,if(t7.click_day_3d is null, 0, t7.click_day_3d)
    ,if(t7.click_day_1d is null, 0, t7.click_day_1d)
    ,if(t7.collect_item_90d is null, 0, t7.collect_item_90d)
    ,if(t7.collect_item_60d is null, 0, t7.collect_item_60d)
    ,if(t7.collect_item_30d is null, 0, t7.collect_item_30d)
    ,if(t7.collect_item_15d is null, 0, t7.collect_item_15d)
    ,if(t7.collect_item_7d is null, 0, t7.collect_item_7d)
    ,if(t7.collect_item_3d is null, 0, t7.collect_item_3d)
    ,if(t7.collect_item_1d is null, 0, t7.collect_item_1d)
    ,if(t7.cart_item_90d is null, 0, t7.cart_item_90d)
    ,if(t7.cart_item_60d is null, 0, t7.cart_item_60d)
    ,if(t7.cart_item_30d is null, 0, t7.cart_item_30d)
    ,if(t7.cart_item_15d is null, 0, t7.cart_item_15d)
    ,if(t7.cart_item_7d is null, 0, t7.cart_item_7d)
    ,if(t7.cart_item_3d is null, 0, t7.cart_item_3d)
    ,if(t7.cart_item_1d is null, 0, t7.cart_item_1d)
    ,if(t7.cart_num_90d is null, 0, t7.cart_num_90d)
    ,if(t7.cart_num_60d is null, 0, t7.cart_num_60d)
    ,if(t7.cart_num_30d is null, 0, t7.cart_num_30d)
    ,if(t7.cart_num_15d is null, 0, t7.cart_num_15d)
    ,if(t7.cart_num_7d is null, 0, t7.cart_num_7d)
    ,if(t7.cart_num_3d is null, 0, t7.cart_num_3d)
    ,if(t7.cart_num_1d is null, 0, t7.cart_num_1d)
    ,if(t7.pay_item_90d is null, 0, t7.pay_item_90d)
    ,if(t7.pay_item_60d is null, 0, t7.pay_item_60d)
    ,if(t7.pay_item_30d is null, 0, t7.pay_item_30d)
    ,if(t7.pay_item_15d is null, 0, t7.pay_item_15d)
    ,if(t7.pay_item_7d is null, 0, t7.pay_item_7d)
    ,if(t7.pay_item_3d is null, 0, t7.pay_item_3d)
    ,if(t7.pay_item_1d is null, 0, t7.pay_item_1d)
    ,if(t7.pay_num_90d is null, 0, t7.pay_num_90d)
    ,if(t7.pay_num_60d is null, 0, t7.pay_num_60d)
    ,if(t7.pay_num_30d is null, 0, t7.pay_num_30d)
    ,if(t7.pay_num_15d is null, 0, t7.pay_num_15d)
    ,if(t7.pay_num_7d is null, 0, t7.pay_num_7d)
    ,if(t7.pay_num_3d is null, 0, t7.pay_num_3d)
    ,if(t7.pay_num_1d is null, 0, t7.pay_num_1d)

    ,if(t8.click_item_90d is null, 0, t8.click_item_90d)
    ,if(t8.click_item_60d is null, 0, t8.click_item_60d)
    ,if(t8.click_item_30d is null, 0, t8.click_item_30d)
    ,if(t8.click_item_15d is null, 0, t8.click_item_15d)
    ,if(t8.click_item_7d is null, 0, t8.click_item_7d)
    ,if(t8.click_item_3d is null, 0, t8.click_item_3d)
    ,if(t8.click_item_1d is null, 0, t8.click_item_1d)
    ,if(t8.click_num_90d is null, 0, t8.click_num_90d)
    ,if(t8.click_num_60d is null, 0, t8.click_num_60d)
    ,if(t8.click_num_30d is null, 0, t8.click_num_30d)
    ,if(t8.click_num_15d is null, 0, t8.click_num_15d)
    ,if(t8.click_num_7d is null, 0, t8.click_num_7d)
    ,if(t8.click_num_3d is null, 0, t8.click_num_3d)
    ,if(t8.click_num_1d is null, 0, t8.click_num_1d)
    ,if(t8.click_day_90d is null, 0, t8.click_day_90d)
    ,if(t8.click_day_60d is null, 0, t8.click_day_60d)
    ,if(t8.click_day_30d is null, 0, t8.click_day_30d)
    ,if(t8.click_day_15d is null, 0, t8.click_day_15d)
    ,if(t8.click_day_7d is null, 0, t8.click_day_7d)
    ,if(t8.click_day_3d is null, 0, t8.click_day_3d)
    ,if(t8.click_day_1d is null, 0, t8.click_day_1d)
    ,if(t8.collect_item_90d is null, 0, t8.collect_item_90d)
    ,if(t8.collect_item_60d is null, 0, t8.collect_item_60d)
    ,if(t8.collect_item_30d is null, 0, t8.collect_item_30d)
    ,if(t8.collect_item_15d is null, 0, t8.collect_item_15d)
    ,if(t8.collect_item_7d is null, 0, t8.collect_item_7d)
    ,if(t8.collect_item_3d is null, 0, t8.collect_item_3d)
    ,if(t8.collect_item_1d is null, 0, t8.collect_item_1d)
    ,if(t8.cart_item_90d is null, 0, t8.cart_item_90d)
    ,if(t8.cart_item_60d is null, 0, t8.cart_item_60d)
    ,if(t8.cart_item_30d is null, 0, t8.cart_item_30d)
    ,if(t8.cart_item_15d is null, 0, t8.cart_item_15d)
    ,if(t8.cart_item_7d is null, 0, t8.cart_item_7d)
    ,if(t8.cart_item_3d is null, 0, t8.cart_item_3d)
    ,if(t8.cart_item_1d is null, 0, t8.cart_item_1d)
    ,if(t8.cart_num_90d is null, 0, t8.cart_num_90d)
    ,if(t8.cart_num_60d is null, 0, t8.cart_num_60d)
    ,if(t8.cart_num_30d is null, 0, t8.cart_num_30d)
    ,if(t8.cart_num_15d is null, 0, t8.cart_num_15d)
    ,if(t8.cart_num_7d is null, 0, t8.cart_num_7d)
    ,if(t8.cart_num_3d is null, 0, t8.cart_num_3d)
    ,if(t8.cart_num_1d is null, 0, t8.cart_num_1d)
    ,if(t8.pay_item_90d is null, 0, t8.pay_item_90d)
    ,if(t8.pay_item_60d is null, 0, t8.pay_item_60d)
    ,if(t8.pay_item_30d is null, 0, t8.pay_item_30d)
    ,if(t8.pay_item_15d is null, 0, t8.pay_item_15d)
    ,if(t8.pay_item_7d is null, 0, t8.pay_item_7d)
    ,if(t8.pay_item_3d is null, 0, t8.pay_item_3d)
    ,if(t8.pay_item_1d is null, 0, t8.pay_item_1d)
    ,if(t8.pay_num_90d is null, 0, t8.pay_num_90d)
    ,if(t8.pay_num_60d is null, 0, t8.pay_num_60d)
    ,if(t8.pay_num_30d is null, 0, t8.pay_num_30d)
    ,if(t8.pay_num_15d is null, 0, t8.pay_num_15d)
    ,if(t8.pay_num_7d is null, 0, t8.pay_num_7d)
    ,if(t8.pay_num_3d is null, 0, t8.pay_num_3d)
    ,if(t8.pay_num_1d is null, 0, t8.pay_num_1d)
from(
    select user_id, brand_id, label, ds
    from user_pay_sample
    where ds=${bizdate}
)t1 left join(
    select *
    from user_click_ads
    where ds=${bizdate}
)t2 on t1.user_id=t2.user_id and t1.ds=t2.ds
left join(
    select *
    from user_collect_ads
    where ds=${bizdate}
)t3 on t1.user_id=t3.user_id and t1.ds=t3.ds
left join(
    select *
    from user_cart_ads
    where ds=${bizdate}
)t4 on t1.user_id=t4.user_id and t1.ds=t4.ds
left join(
    select *
    from user_alipay_ads
    where ds=${bizdate}
)t5 on t1.user_id=t5.user_id and t1.ds=t5.ds
left join(
    select *
    from brand_action_ads
    where ds=${bizdate}
)t6 on t1.brand_id=t6.brand_id and t1.ds=t6.ds
left join(
    select *
    from user_brand_cross_action_ads
    where ds=${bizdate}
)t7 on t1.user_id=t7.user_id and t1.brand_id=t7.brand_id and t1.ds=t7.ds
left join(
    select *
    from user_cate2_cross_action_ads
    where ds=${bizdate}
)t8 on t1.user_id=t8.user_id and t1.brand_id=t8.brand_id and t1.ds=t8.ds
where (t2.cnt_days_90d is not null or t2.cate1_num_90d is not null 
    or t3.item_num_90d is not null or t4.item_num_90d is not null 
    or t5.item_num_90d is not null or t7.click_item_90d is not null 
    or t8.click_item_90d is not null)
;


-- select t1.brand_id, count(*)
-- from (
--         select *
--         from user_pay_sample_feature_join 
--         where ds>='20130701' and ds<='20130916'
--     )t1 join (
--         --b47686 韩都衣舍
--         --b56508 三星手机
--         --b62063 诺基亚
--         --b78739 LILY
--         select 'b47686' as brand_id
--         union all
--         select 'b56508' as brand_id
--         union all
--         select 'b62063' as brand_id
--         union all
--         select 'b78739' as brand_id

--     )t2 on t1.brand_id = t2.brand_id
-- GROUP BY t1.brand_id



