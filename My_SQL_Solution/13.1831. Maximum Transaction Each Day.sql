# Write your MySQL query statement below

with cte as
(
select 
*,
rank() over(partition by day order by amount DESC) as rnk 
from Transactions
)
select
transaction_id
from cte 
where rnk = 1
order by 1
 
