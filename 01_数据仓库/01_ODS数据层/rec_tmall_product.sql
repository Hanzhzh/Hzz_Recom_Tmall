--MaxCompute SQL
--odps sql 
--********************************************************************--
create table if not exists rec_tmall_product (
    item_id string,
    title string,
    pict_url string,
    category string,
    brand_id string,
    seller_id string
)LIFECYCLE 90;

--select category, count(*) from item_dim group by category limit 5;
