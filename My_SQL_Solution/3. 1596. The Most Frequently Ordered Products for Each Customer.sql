
with cte as 
(
select
customer_id,
product_id,
count(*) as num_order
from orders
group  by 1, 2
order by 1, 2 
)
, cte2 as
(
select 
*,
first_value(num_order) over(partition by customer_id order by num_order DESC) as most_frequent_order
from cte    
)

select 
customer_id,
p.product_id,
p.product_name
from cte2 as c1
left join products as p
    on p.product_id = c1.product_id 
where c1.num_order = c1.most_frequent_order
