-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

with newB as (select b.user_id as b_ui, b.money, b.updated, c.name as c_name, c.updated as c_updated
            from balance b
            join currency c
                on b.currency_id = c.id),
     t1 as (select newB.b_ui as id, c_name, money, updated, max(updated - c_updated) as timeScale
            from newB
            where updated - c_updated < '0 days'
            group by id, c_name, money, updated),
     t2 as (select newB.b_ui as id, c_name, money, updated, min(updated - c_updated) as timeScale
            from newB
            where updated - c_updated > '0 days'
            group by id, c_name, money, updated),
     date as (select t1.id, t1.c_name, t1.money, t1.updated, coalesce(t2.timeScale, t1.timeScale) dateDifference
            from t2
            full join t1
                on t2.id = t1.id and t2.c_name = t1.c_name and t2.money = t1.money and t2.updated = t1.updated),
     joins as (select coalesce(u.name, 'not defined') as name,
            coalesce(u.lastname, 'not defined') as lastname,
            date.c_name as currency_name,
            (date.money * cu.rate_to_usd) AS currency_in_usd
            from date
            left join "user" u
                on date.id = u.id
            left join currency cu
                on date.dateDifference = (date.updated - cu.updated) and date.c_name = cu.name)
select *
from joins
order by name desc , lastname, currency_name;
