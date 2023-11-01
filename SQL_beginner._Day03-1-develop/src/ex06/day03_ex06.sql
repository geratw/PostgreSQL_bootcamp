select p1.pizza_name, p.name as pizzeria_name_1, p4.name as pizzeria_name_2, p1.price
from menu p1
join menu p2 on p1.pizza_name = p2.pizza_name and p1.id > p2.id and p1.price = p2.price
join pizzeria p on p.id = p1.pizzeria_id
join pizzeria p4 on p4.id = p2.pizzeria_id
order by pizza_name;

