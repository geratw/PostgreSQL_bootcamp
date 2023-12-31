select p.name, count(person_id) as count_of_orders,round(avg(m.price),2) as average_price, max(m.price) as max_price, min(m.price) as min_price
from person_order
join menu m on m.id = person_order.menu_id
join pizzeria p on p.id = m.pizzeria_id
group by p.name
order by name