# 1st way 
  with cte as
(
select 
*,
max(salary) over(partition by departmentId order by salary DESC) as rnk
from employee
)
select
d1.name as Department,
c1.name as Employee,
c1.salary as Salary
from cte as c1 
join department as d1 
    on c1.departmentId = d1.id
where c1.rnk = c1.salary
-- -----------------------------------------------------------
# 2nd way 
select
d1.name as Department,
c1.name as Employee,
c1.salary as Salary
from employee as c1 
join department as d1 
    on c1.departmentId = d1.id
where (c1.departmentId, c1.salary) In (select departmentId , max(salary) from employee group by departmentId)
