select  order_date, person_id
from person_order
INTERSECT
select visit_date, person_id
    from person_visits
order by order_date asc, person_id desc