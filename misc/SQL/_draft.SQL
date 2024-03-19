select count(*) from webTracker


select top 100 * from webTracker; 

select total_1 = count(*)  from stock_before_revise;


--select * into stock_before_revise from stock_20230407 


select max([Date]) from market 
where tick = 'GOOG'



select 'A' + char(13) + 'B'

go


select * from robinhood_stock_orders
where tick = 'JD' and AveragePrice > 28 
order by cast(trade_Date as date) desc 

go 

-- Cathay Pacific available Seat

declare @currPE date = '2023-05-25' -- first available Premium Economy
declare @currE date = '2023-06-02' -- first available Economy 
declare @bookDate date = '2023-07-10'

select 
Today = cast(GETDATE() as date)
, currPE_Availability = @currPE
, days_diff_PE =  DATEDIFF(day, GETDATE(), @currPE)
, currE_Availability = @currE
, days_diff_E = DATEDIFF(day, GETDATE(), @currE)
, bookDate = @bookDate
, projected_PE = dateadd(day, DATEDIFF(day, GETDATE(), @currPE), @bookDate)
, projected_E = dateadd(day, DATEDIFF(day, GETDATE(), @currE), @bookDate)



go






select '*'
waitfor delay '00:00:00.500'
select '@'
waitfor delay '00:00:00.100'
go
 





print '*'
waitfor delay '00:00:00.100'
print '@'
waitfor delay '00:00:00.100'
go 
 
print '*'
waitfor delay '00:00:00.100'
print '@'
waitfor delay '00:00:00.100'
go 


select datediff(day, '2023-04-30', '2023-10-31')

select dateadd(day, 180, '2023-04-30')

select dateadd(day, 180, GETDATE())


select back_to_us = DATEDIFF(day, '2023-06-18', GETDATE()), to_be = DATEDIFF(day, GETDATE(), '2023-10-05')

select dateadd(day, datediff(day, '2023-06-18', GETDATE()), GETDATE())





-----


drop table if exists #base 

select 
* into #base
from (values(1), (2), (3), (4)) t(id)


with one as (
select 
b1 = b1.id
, b2 = b2.id
, b3 = b3.id
, b4 = b4.id 
from #base b1 , #base b2 , #base b3 , #base b4 
where b1.id != b2.id 
and b1.id!= b3.id 
and b1.id!=b4.id
and b2.id!= b3.id
and b2.id!=b4.id
and b3.id!=b4.id 
and b1.id = 1 
) 
, two as 
(select 
b1 = b1.id
, b2 = b2.id
, b3 = b3.id
, b4 = b4.id 
from #base b1 , #base b2 , #base b3 , #base b4 
where b1.id != b2.id 
and b1.id!= b3.id 
and b1.id!=b4.id
and b2.id!= b3.id
and b2.id!=b4.id
and b3.id!=b4.id 
and b1.id = 2 
)
, three as
(
select 
b1 = b1.id
, b2 = b2.id
, b3 = b3.id
, b4 = b4.id 
from #base b1 , #base b2 , #base b3 , #base b4 
where b1.id != b2.id 
and b1.id!= b3.id 
and b1.id!=b4.id
and b2.id!= b3.id
and b2.id!=b4.id
and b3.id!=b4.id 
and b1.id = 3 
)
, four as
(
select 
b1 = b1.id
, b2 = b2.id
, b3 = b3.id
, b4 = b4.id 
from #base b1 , #base b2 , #base b3 , #base b4 
where b1.id != b2.id 
and b1.id!= b3.id 
and b1.id!=b4.id
and b2.id!= b3.id
and b2.id!=b4.id
and b3.id!=b4.id 
and b1.id = 4 
)
select * from one, two, three, four

go 


drop table if exists #base 

select 
* into #base
from (values(1), (2), (3), (4)) t(id)



; 
with one as (
select 
rn = ROW_NUMBER() over(order by b1.id, b2.id, b3.id, b4.id)
, b1 = b1.id
, b2 = b2.id
, b3 = b3.id
, b4 = b4.id 
from #base b1, #base b2 , #base b3 , #base b4 
where b1.id != b2.id 
and b1.id!= b3.id 
and b1.id!=b4.id
and b2.id!= b3.id
and b2.id!=b4.id
and b3.id!=b4.id 
)
, cte as (
select rn, b1, b2, b3, b4, gn = rn, lvl = 1 from one 
where rn = 1 
union all 
select one.rn, one.b1, one.b2, one.b3, one.b4, cte.gn, cte.lvl + 1   from cte inner join one
on  one.rn > cte.rn 
and one.b1 != cte.b1
and one.b2 != cte.b2 
and one.b3 != cte.b3
and one.b4 != cte.b4
), rpt as (
select  
rn = ROW_NUMBER() over (order by c1.b1)
, lvl1_1 =   c1.b1
, lvl1_2 = c1.b2
, lvl1_3 = c1.b3
, lvl1_4 = c1.b4
, lvl2_1 = c2.b1
, lvl2_2 = c2.b2
, lvl2_3 = c2.b3
, lvl2_4 = c2.b4
, lvl3_1 = c3.b1
, lvl3_2 = c3.b2
, lvl3_3 = c3.b3
, lvl3_4 = c3.b4
, lvl4_1 = c4.b1
, lvl4_2 = c4.b2
, lvl4_3 = c4.b3
, lvl4_4 = c4.b4
from 
(select * from cte where lvl = 1) c1 
, (select * from cte where lvl = 2) c2
, (select * from cte where lvl = 3) c3
, (select * from cte where lvl = 4) c4
where c1.lvl = 1 and c2.lvl = 2 and c3.lvl = 3 and c4.lvl = 4
and c1.b1 + c2.b1 + c3.b1 + c4.b1  = 10 
and c1.b2 + c2.b2 + c3.b2 + c4.b2  = 10 
and c1.b3 + c2.b3 + c3.b3 + c4.b3  = 10 
and c1.b4 + c2.b4 + c3.b4 + c4.b4  = 10 
group by 
c1.b1
, c1.b2
, c1.b3
, c1.b4
, c2.b1
, c2.b2
, c2.b3
, c2.b4
, c3.b1
, c3.b2
, c3.b3
, c3.b4
, c4.b1
, c4.b2
, c4.b3
, c4.b4

) 
select 
rn
, lvl1_1  
, lvl1_2  
, lvl1_3  
, lvl1_4  
from rpt 
union all 
select 
rn
, lvl2_1  
, lvl2_2  
, lvl2_3  
, lvl2_4  
from rpt 
union all 
select 
rn
, lvl3_1  
, lvl3_2  
, lvl3_3  
, lvl3_4  
from rpt 
union all 
select 
rn
, lvl4_1  
, lvl4_2  
, lvl4_3  
, lvl4_4  
from rpt 
order by 1 



select datediff(day, '2008-05-16', '2023-10-03')/365.0





select (41-1) % 3 * 3 + ((41-1)/27) * 27  



