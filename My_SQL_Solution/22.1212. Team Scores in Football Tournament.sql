# Write your MySQL query statement below

select 
t.team_id, t.team_name,
sum(case 
    when t.team_id = m.host_team and m.host_goals> m.guest_goals then 3 
    when t.team_id = m.guest_team and m.guest_goals> m.host_goals then 3
    when t.team_id = m.host_team and  m.host_goals = m.guest_goals then 1 
    when t.team_id = m.guest_team and  m.host_goals = m.guest_goals then 1 
    else 0  end) as num_points
from teams as t 
left join matches as m 
on t.team_id in (m.host_team, m.guest_team)
# on t.team_id = m.host_team or t.team_id = m.guest_team
group by 1, 2
order by 3 DESC , 1
