select name
from  pizzeria
where not EXISTS (SELECT pizzeria_id  FROM person_visits WHERE pizzeria_id = pizzeria.id);

SELECT name
FROM pizzeria
WHERE id not IN (SELECT pizzeria_id  FROM person_visits);