
select 
c.name as country
from person as p
left join Country as c
    on substr(p.phone_number, 1,3) = c.country_code
# we can use left, right , substr
left join calls as ca
    on p.id IN (ca.caller_id, ca.callee_id)        
group by c.name
having avg(duration) > (select avg(duration)from calls )
