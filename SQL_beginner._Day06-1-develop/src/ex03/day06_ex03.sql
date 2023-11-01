create unique index idx_person_discounts_unique on person_discounts(person_id, pizzeria_id);

set ENABLE_SEQSCAN to off;

EXPLAIN ANALYZE
select *
from person_discounts
where person_id = 1
  and pizzeria_id = 4;