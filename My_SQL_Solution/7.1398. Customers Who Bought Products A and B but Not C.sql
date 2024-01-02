
with cte as
(
select 
o.customer_id, o.product_name, c.customer_name
from orders as o
join customers as c
    on o.customer_id = c.customer_id
)

select 
customer_id, customer_name
from cte
where product_name In ('A', 'B') and customer_id not in (select customer_id from orders where product_name = "c")
group by 1, 2 
having count(distinct product_name) = 2
order by 1
