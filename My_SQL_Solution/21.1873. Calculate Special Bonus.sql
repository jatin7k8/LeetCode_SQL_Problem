-- 1st method
select 
employee_id,
case when upper(name) like "M%" then 0 
when mod(employee_id ,2) = 0 then 0 
else salary end as bonus
from employees
order by 1

-- 2nd method
with cte as
(select 
*
from employees
where name not like "M%" and employee_id%2 !=0)
select 
e.employee_id,
coalesce(c.salary, 0) as bonus 
from employees as e
left join cte as c 
    on e.employee_id = c.employee_id
order by 1
