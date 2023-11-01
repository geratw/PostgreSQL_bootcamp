UPDATE menu
SET price = (select price from menu where pizza_name='greek pizza') * 0.9
where pizza_name = 'greek pizza'