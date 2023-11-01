with createDate as (select *
        from generate_series('2022-01-01'::timestamp,'2022-01-10', '1 day') as missing_date),
     t1 as (select visit_date
    from person_visits
    where person_id = 1 or person_id = 2)
select missing_date::date
from createDate
left join t1 as dateFromPerson
on createDate.missing_date = dateFromPerson.visit_date
where visit_date isnull
order by missing_date

