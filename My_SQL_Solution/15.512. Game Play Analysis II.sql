select
player_id,
device_id
from activity 
where (player_id , event_date) IN 
(select 
player_id,
min(event_date) as dates
from activity 
group by 1)
