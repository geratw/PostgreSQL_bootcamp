select  pizza_name, price, p2.name as pizzeria_name, visit_date
from person_visits
inner join person p on p.id = person_visits.person_id and p.name='Kate'
inner join  person_order pv on p.id = pv.person_id
inner join pizzeria p2 on p2.id = person_visits.pizzeria_id
inner join menu m on p2.id = m.pizzeria_id
where price >= 800 and price <= 1000
order by pizza_name, price, pizzeria_name, visit_date