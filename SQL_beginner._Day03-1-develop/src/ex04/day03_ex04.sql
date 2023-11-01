with male as (select p.name as pizzeria_name
    from person_order
    join person on person_order.person_id = person.id and gender='male'
        join menu on person_order.menu_id = menu.id
    join pizzeria p on menu.pizzeria_id = p.id),
    female as (select p.name as pizzeria_name
    from person_order
    join person on person_order.person_id = person.id and gender='female'
       join menu on person_order.menu_id = menu.id
    join pizzeria p on menu.pizzeria_id = p.id)
(select pizzeria_name
from male
except
select pizzeria_name
from female)
union
(select  pizzeria_name
from female
except
select pizzeria_name
from male)
order by pizzeria_name;
