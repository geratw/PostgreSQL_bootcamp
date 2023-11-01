with girl as (select name, id
        from person
        where gender = 'female'),
     t2 as (select id
        from menu
        where id in (select person_id
            from person_order
            inner join menu on person_order.menu_id = menu.id
            where pizza_name = 'pepperoni pizza') and
        id in (select person_id
            from person_order
            inner join menu on person_order.menu_id = menu.id
            where pizza_name = 'cheese pizza'))
select name
from person_order
join girl on person_id = girl.id
join t2 on menu_id = t2.id
order by name;
