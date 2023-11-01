select pizza_name, price, name as pizzeria_name
from menu
join pizzeria p on p.id = menu.pizzeria_id
where menu.id not in (select menu_id
    from person_order)
order by pizza_name,price