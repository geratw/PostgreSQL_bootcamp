
SELECT pizza_name FROM menu
INTERSECT
SELECT pizza_name FROM menu
order by pizza_name desc
