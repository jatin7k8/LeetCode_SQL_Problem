

with yearly_orders as 
(
    select
    year(order_date) as years,
    customer_id,
    sum(price) as revenue
    from orders
    group by 1, 2
)
, cte2 as
(
select
prev_year.customer_id,
prev_year.years,
case when prev_year.revenue < next_year.revenue then 1 else 0 end inc_rev_flag
from yearly_orders AS prev_year
left join yearly_orders as next_year
    on prev_year.customer_id = next_year.customer_id and prev_year.years+1 =  next_year.years
)
, cte3 as 
(
select
customer_id,
count(distinct years) as  years ,
sum( inc_rev_flag) as inc_rev_sum
from cte2
group by 1
)

select 
customer_id
from cte3
where years = 1 or inc_rev_sum = years- 1


