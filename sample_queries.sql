with main_table as 
(
SELECT *,cast(substr(Datetime,1,length(Datetime)-7) as datetime) as newDate FROM `reddy000-c898c.Titania_Dataset.futures_options_signals` 
)
select *
from main_table 
where newDate >= cast('2022-11-03' as date)
and Stock = 'Nifty'
order by newDate asc
