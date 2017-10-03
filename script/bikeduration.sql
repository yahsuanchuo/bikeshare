with a as (select (duration/60) as duration 
           from biketrips)

select (duration/5)*5 || '-' || (duration/5)*5+5 as range, count(*)
from  a
where duration < '180'
group by duration/5
order by duration/5
