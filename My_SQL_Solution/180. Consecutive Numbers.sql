# solution 1st 
Select 
Distinct l1.num as  ConsecutiveNums
From logs as l1, logs as l2 , logs as l3 
Where l2.id - l1.id = 1  and l1.num = l2.num and l3.id - l2.id  = 1 and l2.num = l3.num


# solution 2nd
select 
distinct l1.num as ConsecutiveNums

from logs as l1 
join logs as l2 
    ON l1.num = l2.num 
    and l1.id = l2.id+ 1
# above code for two consecutive numbers
join logs as l3 
    on l1.num = l3.num 
    and l1.id = l3.id+2 
  
# solution 3rd
Select 
Distinct num as ConsecutiveNums 
From logs
Where (id+1, num) in (select * from logs ) and (id+2, num) in (select * from logs)





