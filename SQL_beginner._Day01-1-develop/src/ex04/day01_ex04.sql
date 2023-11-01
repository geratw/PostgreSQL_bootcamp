SELECT person_id from person_order where order_date = '2022-01-07'
EXCEPT all
SELECT person_id from person_visits WHERE visit_date = '2022-01-07'

