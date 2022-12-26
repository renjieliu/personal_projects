--create  table meal (item nvarchar(200), category nvarchar(200))

--go

--delete from meal where item = N'韭菜蛋饼'

; with a as
(
select top 10 n = ROW_NUMBER() over (order by CHECKSUM(NEWID()) ), * from meal where category = N'荤菜'
union all
select * from a 
where NEWID() is null 
)
, b as 
(
select top 10 n = ROW_NUMBER() over (order by (select NULL) ), * from meal where category = N'素菜'
)
, c as 
(
    select top 5 n = ROW_NUMBER() over (order by (select NULL) ), * from meal where category = N'汤'
), d as 
(
select groups = '1', Monday = mo.item, Tuesday = tu.item, Wednesday = we.item, Thursday = th.item, Friday = fr.item
from 
( select rn = ROW_NUMBER() over (order by newid()) ,  * from a where n in (1, 2) ) mo 
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from a where n in (3, 4) ) tu on mo.rn = tu.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from a where n in (5, 6) ) we on tu.rn = we.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from a where n in (7, 8) ) th on we.rn = th.rn
inner  join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from a where n in (9, 10) ) fr on th.rn = fr.rn

union all 
 
select groups = '2', Monday = mo.item, Tuesday = tu.item, Wednesday = we.item, Thursday = th.item, Friday = fr.item
from 
( select rn = ROW_NUMBER() over (order by newid()) ,  * from b where n in (1, 2) ) mo 
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from b where n in (3, 4) ) tu on mo.rn = tu.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from b where n in (5, 6) ) we on tu.rn = we.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from b where n in (7, 8) ) th on we.rn = th.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from b where n in (9, 10) ) fr on th.rn = fr.rn

union all 

select groups = '3', Monday = mo.item, Tuesday = tu.item, Wednesday = we.item, Thursday = th.item, Friday = fr.item
from 
( select rn = ROW_NUMBER() over (order by newid()) ,  * from c where n in (1) ) mo 
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from c where n in (2) ) tu on mo.rn = tu.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from c where n in (3) ) we on tu.rn = we.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from c where n in (4) ) th on we.rn = th.rn
inner join ( select rn = ROW_NUMBER() over (order by newid()) ,  * from c where n in (5) ) fr on th.rn = fr.rn

)
select 
Monday
, Tuesday
, Wednesday
, Thursday
, Friday
from d 
order by groups




