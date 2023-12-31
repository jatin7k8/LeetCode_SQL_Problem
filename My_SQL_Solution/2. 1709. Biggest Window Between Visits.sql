# Write your MySQL query statement below
with cte as
(
select 
*,
lead(visit_date,1,'2021-1-1') over(partition by user_id  order by visit_date) as next_date,
datediff(lead(visit_date,1,'2021-1-1') over(partition by user_id  order by visit_date), visit_date ) as date_diff
from UserVisits 
)
select 
user_id,
max(date_diff) as biggest_window
from cte
group by 1


