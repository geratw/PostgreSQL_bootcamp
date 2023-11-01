with pizza_menu as (select pizza_name,pizzeria_id, price
    from menu
    where pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza')
select pizza_name, name as pizzeria_name, price
from pizza_menu
join (select id, name
    from pizzeria) as pizz_name
on pizza_menu.pizzeria_id = pizz_name.id
order by pizza_name, name
