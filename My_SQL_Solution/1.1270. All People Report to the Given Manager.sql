# Write your MySQL query statement below

select 
e1.employee_id
from Employees as e1 
left join Employees as e2 
    on e1.manager_id = e2.employee_id
left join Employees as e3
    on e2.manager_id = e3.employee_id
where e3.manager_id = 1 and e1.employee_id <> e1.manager_id
