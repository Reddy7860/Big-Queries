-- Fetch the bdaily buy and sell timestamps of the signals

select *
from 
(
select Client_id,Execution_Date,producttype,tradingsymbol,averageprice as buy_price,quantity,lotsize,updatetime,
rank() over(partition by Client_id,Execution_Date,tradingsymbol order by updatetime asc) as rnk,
LEAD(price) over(partition by Client_id,Execution_Date,tradingsymbol order by updatetime asc) as sell_price,
LEAD(updatetime) over(partition by Client_id,Execution_Date,tradingsymbol order by updatetime asc) as sell_timestamp
from order_data
where status= 'complete'
and Execution_Date = '2022-11-04'
and Client_id = 'J95213'
) t
where sell_timestamp is not null
