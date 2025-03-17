--MaxCompute SQL
--********************************************************************--
create table if not exists rec_tmall_log (
    item_id string,
    user_id string,
    action string,
    vtime string
)LIFECYCLE 90;

--select * from user_item_beh_log limit 10;
