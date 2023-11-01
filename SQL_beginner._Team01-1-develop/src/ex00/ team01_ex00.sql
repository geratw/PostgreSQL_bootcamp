with  t1 as (select coalesce(us.name, 'not defined') as name,
            coalesce(us.lastname, 'not defined') as lastname,
            b.type,
            SUM(b.money) as volume,
            currency_id
            from "user" as us
            full join  balance b
                on us.id = b.user_id
            group by  name, lastname, b.type, b.currency_id),
      t2 as (select t1.name,
            lastname,
            type,
            volume,
            coalesce(c.name, 'not defined') as currency_name,
            currency_id
            from t1
            full join  currency c
                on t1.currency_id = c.id
            group by  t1.name, lastname, t1.type, t1.currency_id, t1.volume, c.name),
      max_date as (select id, max(updated) AS lastdate
            FROM currency
            group by id),
      rate_usd as (select rate_to_usd as last_rate_to_usd, ma.id
            from max_date ma
            JOIN currency c
                ON ma.lastdate = c.updated AND ma.id = c.id),
      finishTable as (select *, coalesce(volume * ra.last_rate_to_usd, volume) as total_volume_in_usd
            from t2
            full join  rate_usd ra
                on ra.id = t2.currency_id)

select finishTable.name, lastname, type, volume, currency_name, coalesce(last_rate_to_usd,1) as last_rate_to_usd, total_volume_in_usd
from finishTable
order by name desc, lastname, type;



