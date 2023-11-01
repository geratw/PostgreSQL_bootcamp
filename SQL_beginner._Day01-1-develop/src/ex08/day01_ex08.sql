SELECT order_date, name || ' (age:' || age || ')' as person_information
FROM person_order
NATURAL JOIN (select id as person_id, name, age from person) as pr
order by order_date, person_information