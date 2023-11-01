SELECT distinct name, rating
FROM pizzeria
left join person_visits
on person_visits.pizzeria_id = pizzeria.id
where person_visits.pizzeria_id isnull


