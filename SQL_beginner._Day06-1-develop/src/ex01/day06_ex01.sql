with discountTable as (select po.person_id, pizzeria_id,  case
         when (COUNT(m.pizzeria_id) = 1) then 10.5
         when (COUNT(m.pizzeria_id) = 2) then 22
         else 30
         end as discount
         from person_order po
             join menu m on menu_id =m.id
        group by  po.person_id, pizzeria_id
    order by 1)

insert into person_discounts (id, person_id, pizzeria_id, discount)

select ROW_NUMBER() over () as id,
       discountTable.person_id,
       discountTable.pizzeria_id,
       discountTable.discount
from discountTable;
