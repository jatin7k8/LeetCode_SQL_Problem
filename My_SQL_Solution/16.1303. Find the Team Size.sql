# Write your MySQL query statement below
with cte as
(
select 
team_id,
count(*) as team_size 
from employee
group by 1
)

select 
e.employee_id,
c1.team_size
from cte as c1 
left join employee as e 
    on c1.team_id = e.team_id
