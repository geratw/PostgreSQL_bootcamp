with t1 as (select name, id
    from person
    where (address = 'Moscow' or address = 'Samara') and gender = 'male'),
     t2 as (select pizza_name, id
         from menu
         where pizza_name = 'mushroom pizza' or pizza_name ='pepperoni pizza')
select name
from person_order
join t1 on person_id = t1.id
join t2 on t2.id = person_order.menu_id
order by name desc