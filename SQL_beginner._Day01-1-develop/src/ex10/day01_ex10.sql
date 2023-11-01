
SELECT person.name AS person_name, pizza_name, pizzeria.name AS pizzeria_name
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order ON menu.id = person_order.menu_id
INNER JOIN person ON person.id = person_order.person_id
ORDER BY person_name, pizza_name, pizzeria_name