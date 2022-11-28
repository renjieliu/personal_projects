--create  table meal (item nvarchar(200), category nvarchar(200))

--go 

--delete from meal where item = N'韭菜蛋饼'

; with a as (
select * from meal where category = N'荤菜'
)
, b as 
(
select * from meal where category = N'素菜'
)
, c as 
(select * from meal where category = N'汤'
), d as 
(
select groups = '1', Monday = mo.item, Tuesday = tu.item, Wednesday = we.item, Thursday = th.item, Friday = fr.item
from 
( select rn = ROW_NUMBER() over (order by newid()) ,  * from a ) mo 
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from a) tu on mo.rn = tu.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from a) we on tu.rn = we.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from a) th on we.rn = th.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from a) fr on th.rn = fr.rn
where mo.rn <= 2

union all 

select groups = '2', Monday = mo.item, Tuesday = tu.item, Wednesday = we.item, Thursday = th.item, Friday = fr.item
from 
( select rn = ROW_NUMBER() over (order by newid()) ,  * from b ) mo 
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from b) tu on mo.rn = tu.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from b) we on tu.rn = we.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from b) th on we.rn = th.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from b) fr on th.rn = fr.rn
where mo.rn <= 2

union all 

select groups = '3', Monday = mo.item, Tuesday = tu.item, Wednesday = we.item, Thursday = th.item, Friday = fr.item
from 
( select rn = ROW_NUMBER() over (order by newid()) ,  * from c ) mo 
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from c) tu on mo.rn = tu.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from c) we on tu.rn = we.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from c) th on we.rn = th.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from c) fr on th.rn = fr.rn
where mo.rn <= 1
)
select 
Monday
, Tuesday
, Wednesday
, Thursday
, Friday
from d 
order by groups




