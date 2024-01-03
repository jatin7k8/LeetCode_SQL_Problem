# 1st way 
SELECT
    IF(from_id < to_id, from_id, to_id) AS person1,
    IF(from_id < to_id, to_id, from_id) AS person2,
    COUNT(*) AS call_count,
    SUM(duration) AS total_duration
FROM Calls
GROUP BY 1, 2;

# 2nd way 
select

case when from_id < to_id then from_id else to_id end as person1,
case when from_id < to_id then to_id else from_id end as person2,
count(*) as call_count,
sum(duration) as total_duration
from Calls
group by 1, 2 

# 3rd way LEAST() AND GREATEST() 
select
LEAST(from_id, to_id) as person1,
Greatest(from_id, to_id) as person2,
count(*) as call_count,
sum(duration) as total_duration
from Calls
group by 1, 2 
