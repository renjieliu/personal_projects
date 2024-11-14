--select DrawDate = cast(DrawDate as date),N1,N2, N3, N4, N5, PowerBall , Multiplier  
--into #t from powerball
--drop table powerball;
--select * into powerball from #t; 

--step 1. pick up a powerball
select powerball
, last_drawdate = max(DrawDate)
, times = count(DrawDate) from powerball
--where DrawDate >= '2015-10-04' -- powerball rules changed from 2015-10-04
group by powerball
order by 3 desc 
--order by 2 desc 


--step 2. check the 5 numbers

--check the numbers
;with base as (
select * from powerball 
--where DrawDate >= '2015-10-04' 
) , temp as (
select drawdate, num = min(N1) from base
group by drawdate
union all
select drawdate, num = min(N2) from base
group by drawdate
union all
select drawdate, num = min(N3) from base
group by drawdate
union all
select drawdate, num = min(N4) from base
group by drawdate
union all
select drawdate, num = min(N5) from base
group by drawdate
) 
select num
, last_time = max(DrawDate)
, times = count(DrawDate)
, total_times = (select count(distinct drawdate) from temp)
from temp 
group by num 
--order by 2 desc 
order by 3 desc 
 
drop table temp; 
;with base as (
select * from powerball 
--where DrawDate >= '2015-10-04' 
)  
select drawdate, num = min(N1) 
into temp 
from base
group by drawdate
union all
select drawdate, num = min(N2) from base
group by drawdate
union all
select drawdate, num = min(N3) from base
group by drawdate
union all
select drawdate, num = min(N4) from base
group by drawdate
union all
select drawdate, num = min(N5) from base
group by drawdate
  

--select * from temp 


 
create table #together (n1 int , n2 int, dates date , cnt int)

truncate table #together
set nocount on
declare @n1 int = 1
while @n1 < 69
begin
	declare @n2 int 
	set @n2 = 1
	while @n2 < 70
	begin
	insert into #together 
	select @n1, @n2, p2.DrawDate, count(p2.DrawDate) over() from temp p1 left outer join temp p2 
	on p1.DrawDate = p2.DrawDate 
	where p1.num = @n1 and p2.num = @n2 

	set @n2 = @n2+1
	end 
	set @n1 = @n1+1 

end

 
select * from #together
where n1 <> n2  and n1 = 25
order by 4 desc , 3 desc,  1 , 2  


 
select * from #together
where n1 <> n2 
and n1 = 49
order by 4 desc , 3 desc,  1 , 2  

 
go 

--drop table together3
 
create table together3 (n1 int , n2 int,  n3 int, dates date , cnt int)

truncate table together3

set nocount on
declare @n1 int = 1
while @n1 < 70
begin
	declare @n2 int 
	set @n2 = @n1+1
	while @n2 < 70
	begin
		declare @n3 int 
		set @n3 = @n2+1
		while @n3 < 70
		begin

			insert into together3
			select @n1, @n2, @n3, p1.DrawDate, count(p3.DrawDate) over() 
			from temp p1 
			left outer join temp p2 on p1.DrawDate = p2.DrawDate 
			left outer join temp p3 on p1.DrawDate = p3.DrawDate 
			where p1.num = @n1 and p2.num = @n2 and p3.num = @n3 
						
			set @n3 = @n3+1
		end

	set @n2 = @n2+1
	end 
set @n1 = @n1+1 
end


select * from together3
order by cnt desc, n1, dates desc  


--select * into together2 from #together 
--select * into together3 from #together3


go



--select n1, n2, n3, n4,  count(distinct DrawDate) from powerball 
--group by n1, n2, n3, n4 with rollup
--order by 5 desc , 1 desc 


--delete from together2
--where n1 = n2 

--delete from together3
--where n1=n2 or n2=n3 or n1=n3
  
select * from together3 
order by 5 desc  , 4 desc 


