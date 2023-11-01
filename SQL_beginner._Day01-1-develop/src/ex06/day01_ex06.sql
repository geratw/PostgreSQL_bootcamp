select  order_date, (select name from person where person_order.person_id = person.id) as person_name
from person_order
INTERSECT
select visit_date, (select name from person where person_visits.person_id = person.id) as person_name
from person_visits
order by order_date, person_name desc