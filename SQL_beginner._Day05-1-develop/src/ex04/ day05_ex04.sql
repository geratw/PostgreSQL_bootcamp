CREATE UNIQUE INDEX idx_menu_unique on menu(pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
select *
from menu
where id = 4;