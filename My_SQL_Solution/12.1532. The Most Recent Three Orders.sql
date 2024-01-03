

select 
c1.name as customer_name,
c1.customer_id,
t.order_id,
t.order_date
from Customers as c1
join 
(
select 
*,
dense_rank() over(partition by customer_id  order by order_date DESC) as rnk
from orders
order by customer_id, order_id
) as t 
on  t.customer_id = c1.customer_id
where t.rnk <= 3
order by 1, 2, 4 DESC
