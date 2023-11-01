select pizza_name,pizzeria_name
from person_order
join (select name, id
        from person) as person
on person.id = person_order.person_id
join (select id, pizzeria_id, pizza_name
        from menu) as menu
on menu.id = menu_id
join (select id, name as pizzeria_name
        from pizzeria) as pizzeria
on pizzeria.id = menu.pizzeria_id
where person.name = 'Denis' or person.name = 'Anna'
order by pizza_name, pizzeria_name
