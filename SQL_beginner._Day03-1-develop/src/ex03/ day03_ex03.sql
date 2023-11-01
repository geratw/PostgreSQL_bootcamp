with male as (select p.name as pizzeria_name
    from person_visits
    join person on person_visits.person_id = person.id and gender='male'
    join pizzeria p on person_visits.pizzeria_id = p.id),
    female as (select p.name as pizzeria_name
    from person_visits
    join person on person_visits.person_id = person.id and gender='female'
    join pizzeria p on person_visits.pizzeria_id = p.id)
(select pizzeria_name
from male
except all
select pizzeria_name
from female)
union
(select  pizzeria_name
from female
except all
select pizzeria_name
from male)
order by pizzeria_name;
