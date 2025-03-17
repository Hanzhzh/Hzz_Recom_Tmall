--MaxCompute SQL
--********************************************************************--
create table if not exists user_pay_sample_feature_seq (
    feature string ,
    number bigint
)LIFECYCLE 90;

/*
通过提取不同的特征数据 (feature)，将其去重并排序。
使用 ROW_NUMBER() 给每个 feature 生成一个唯一编号 number。
示例：
uc2_pay_num_7d_5	5322
uc2_pay_num_90d_0	5323
uc2_pay_num_90d_1	5324
uc2_pay_num_90d_2	5325
uc2_pay_num_90d_3	5326
uc2_pay_num_90d_4	5327
uc2_pay_num_90d_5	5328
uc2_pay_num_90d_6	5329
ucart_brand_num_15d_0	5330
ucart_brand_num_15d_1	5331
ucart_brand_num_15d_2	5332
ucart_brand_num_15d_3	5333
ucart_brand_num_15d_4	5334
ucart_brand_num_15d_5	5335
有了这个编号，我用一个n维的向量来表示一个编号，进行一一映射
*/

insert OVERWRITE TABLE user_pay_sample_feature_seq
select feature, ROW_NUMBER() OVER(ORDER BY feature) AS number
from (
    select DISTINCT feature
    from (
        select target_brand_id as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
        union all
        select trans_array(0,',',clk_brand_seq) as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
        union all
        select trans_array(0,',',clt_brand_seq) as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
        union all
        select trans_array(0,',',pay_brand_seq) as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
        union all
        select trans_array(0,',',clk_cate_seq) as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
        union all
        select trans_array(0,',',clt_cate_seq) as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
        union all
        select trans_array(0,',',pay_cate_seq) as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
        union all
        select trans_array(0,',',user_click_feature) as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
        union all
        select trans_array(0,',',user_clt_feature) as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
        union all
        select trans_array(0,',',user_cart_feature) as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
        union all
        select trans_array(0,',',user_pay_feature) as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
        union all
        select trans_array(0,',',brand_stat_feature) as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
        union all
        select trans_array(0,',',user_cate2_cross_feature) as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
        union all
        select trans_array(0,',',user_brand_cross_feature) as (feature)
        from user_pay_sample_feature_join_dnn
        where ds>='20130701' and ds<='20130916'
    )t1
)t1
;


-- select * FROM user_pay_sample_feature_seq;
-- SELECT 
--     COUNT(t.trans_array) AS t_count
-- FROM user_pay_sample_feature_join_dnn
-- LATERAL VIEW trans_array(0,',',clk_brand_seq) t AS trans_array
-- WHERE ds = '20130701';
-- select * from user_pay_sample_feature_seq where number = 11000;

