; with base as (
 select  * from ( values (1),(2),(3),(4),(5),(6),(7),(8),(9)) t(id)
), balls as (
select 
 top 70 --how many in total
  n = ROW_NUMBER() over(order by a.id)
from base a, base b
 ) , 
ball_1 as (
select 
top 5 -- pick the first N numbers 
n from balls order by newid()
), 
ball_2 as
(
select 
top 1 -- how many power balls to be picked
n 
from balls where n <= 20 -- how many for the power balls
order by NEWID()
)
Select
 'Lottery combo ' = 
(select string_agg( iif(n < 10, '0' , '') + cast(n as varchar) , ' ' )  within group ( order by n ) from ball_1 )
+ ' + ' + 
(select string_agg(iif(n < 10, '0' , '') + cast(n as varchar) , ' ' )  within group ( order by n ) from ball_2)
 
