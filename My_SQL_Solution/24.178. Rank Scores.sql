with cte as 
(
select 
*,
rank() over(partition by continent order by profits DESC) as rnk
from forbes_global_2010_2014)

select company, profits
from cte
limit 3
