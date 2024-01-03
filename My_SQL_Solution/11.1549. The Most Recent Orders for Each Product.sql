# 1st way 
with cte  as
(
select 
*,
rank() over(partition by product_id order by order_date DESC) as rnk
from orders
)

select 
p.product_name,
p.product_id,
c.order_id,
c.order_date
from cte as c
join products as p
    on c.product_id = p.product_id
where rnk = 1
order by 1, 2, 3

-- -----------------------------------------------------------------------------------------------
# 2nd way 
with cte  as
(
select 
*,
max(order_date) over(partition by product_id) as recent_date
from orders
)

select 
p.product_name,
p.product_id,
c.order_id,
c.order_date
from cte as c
join products as p
    on c.product_id = p.product_id
where recent_date = order_date
order by 1, 2, 3
