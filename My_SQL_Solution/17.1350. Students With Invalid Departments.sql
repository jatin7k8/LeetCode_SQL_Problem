# Write your MySQL query statement below

select 
s.id,
s.name
from departments as d 
right join students as s 
    on d.id = s.department_id
where d.name is null
