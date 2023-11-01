with orders as (select p.name
    from person_order
    join person on person_order.person_id = person.id and name='Andrey'
    join menu on person_order.menu_id = menu.id
    join pizzeria p on menu.pizzeria_id = p.id),
    visited as (select p.name
    from person_visits
    join person on person_visits.person_id = person.id and name='Andrey'
    join pizzeria p on person_visits.pizzeria_id = p.id)
select *
from visited
except
select *
from orders
