select COALESCE(name, '-') as person_name, visit_date, COALESCE(pizzeria_name, '-')
from person
full join (select person_id, pizzeria_id, visit_date
    from person_visits
    where visit_date between '2022-01-01' and '2022-01-03') as q
    on person_id = person.id
full join (select name as pizzeria_name, id
    from pizzeria) as pizzeria
    on pizzeria_id = pizzeria.id
order by person_name, visit_date, pizzeria_name