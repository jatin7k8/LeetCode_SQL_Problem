with cte as
(
select 
log_id,
row_number() over(order by log_id) as continus_range,
log_id - row_number() over(order by log_id)  as diff
from Logs
)

select 
start_id,
end_id
from 
(
select 
diff,
min(log_id) as start_id,
max(log_id) as end_id
from cte 
group by 1
) as t
