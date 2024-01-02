# 1st way using window function rank()

with cte as
(
select 
*,
rank() over(partition by student_id order by grade DESC, course_id ASC) as rnk
from Enrollments
)

select 
student_id,
course_id,
grade
from cte 
where rnk = 1
order by 1
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 2nd way but mor logical approch 
with cte as
(
select 
*,
max(grade) over(partition by student_id order by student_id) as max_grade
from Enrollments
)

select 
student_id,
min(course_id) as course_id,
grade
from cte
where grade = max_grade
group by 1 
order by 1
