drop table if exists megamillion_20220804;

select * into megamillion_20220804 from megamillion 


select * from megamillion 
order by 1 desc 


truncate table megamillion 


select MegaBall, cnt = count(*) over (partition by MegaBall), *  from megamillion 
order by 2 desc 


select distinct MegaBall  from megamillion 
order by 1 desc 


select MegaBall, cnt = count(*) over (partition by MegaBall), *  from megamillion 
order by 2,1, 3 desc



--Megaball distribution 

drop table if exists #megaball_dist

select 
MegaBall
,latest = max(Date) 
,total = count(*)
,cnt_2022 = count(distinct case when year(date)= 2022 then date else null end )
,cnt_2021 = count(distinct case when year(date)= 2021 then date else null end )
,cnt_2020 = count(distinct case when year(date)= 2020 then date else null end )
,cnt_2019 = count(distinct case when year(date)= 2019 then date else null end )
,cnt_2018 = count(distinct case when year(date)= 2018 then date else null end )
,cnt_2017 = count(distinct case when year(date)= 2017 then date else null end )
,cnt_2016 = count(distinct case when year(date)= 2016 then date else null end )
,cnt_2015 = count(distinct case when year(date)= 2015 then date else null end )
,cnt_2014 = count(distinct case when year(date)= 2014 then date else null end )
,cnt_2013 = count(distinct case when year(date)= 2013 then date else null end )
,cnt_2012 = count(distinct case when year(date)= 2012 then date else null end )
,cnt_2011 = count(distinct case when year(date)= 2011 then date else null end )
,cnt_2010 = count(distinct case when year(date)= 2010 then date else null end )
,cnt_2009 = count(distinct case when year(date)= 2009 then date else null end )
,cnt_2008 = count(distinct case when year(date)= 2008 then date else null end )
,cnt_2007 = count(distinct case when year(date)= 2007 then date else null end )
into #megaball_dist
from megamillion 
group by MegaBall 
order by 3 desc 

--Occurrence of the meagaball drawn in 2022
select distinct MegaBall, total, cnt_2022 from #megaball_dist
order by 3 desc 




--select * from megamillion
--order by 1 desc 


--break number


drop table if exists #numbers_base; 

;
with cte as 
(select date, numbers= ltrim(right(numbers ,len(numbers)-2)), num =cast(left(Numbers,2 ) as varchar(500))  from megamillion
union all 
select
 Date
,numbers = ltrim(right(numbers ,len(numbers)-2))
,num = cast(left(cte.numbers,2 ) as varchar(500))
from cte 
where len(numbers)> 0
), result as (
select * from cte 
),tmp as (
select result.date, megamillion.Numbers, megamillion.MegaBall, result.num from result inner join megamillion
on result.Date = megamillion.Date
)
select * into #numbers_base from tmp 


create index idx_num on #numbers_base(num)



--create table number_dist, for each number's distribution across years
drop table if exists #number_dist

select distinct
num
, Numbers
, Date
, previous_appear = lag(date,1) over (partition by num order by date )
, date_diff = datediff(day, 
						lag(date,1) over (partition by num order by date )
						,max(date) over (partition by num order by date )
					  )
,total = count(1) over (partition by num)
,cnt_2022 = cast(sum(case when year(date)= 2022 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2021 = cast(sum(case when year(date)= 2021 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2020 = cast(sum(case when year(date)= 2020 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2019 = cast(sum(case when year(date)= 2019 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2018 = cast(sum(case when year(date)= 2018 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2017 = cast(sum(case when year(date)= 2017 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2016 = cast(sum(case when year(date)= 2016 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2015 = cast(sum(case when year(date)= 2015 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2014 = cast(sum(case when year(date)= 2014 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2013 = cast(sum(case when year(date)= 2013 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2012 = cast(sum(case when year(date)= 2012 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2011 = cast(sum(case when year(date)= 2011 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2010 = cast(sum(case when year(date)= 2010 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2009 = cast(sum(case when year(date)= 2009 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2008 = cast(sum(case when year(date)= 2008 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
,cnt_2007 = cast(sum(case when year(date)= 2007 then 1 else 0 end ) over (partition by num)/4.0 as decimal(10,2))
into #number_dist
from #numbers_base
order by total desc, date desc 


--select cnt = count(*) from megamillion 
--where year(date) = 2022

--select * from #numbers_base
--order by num , date desc

select distinct num, cnt_2022, total from #number_dist 
order by 2 desc 


select distinct
MegaBall
, Date
, previous_appear = lag(date,1) over (partition by MegaBall order by date )
, date_diff = datediff(day, 
						lag(date,1) over (partition by MegaBall order by date )
						,max(date) over (partition by MegaBall order by date )
					  )
, cnt = count(1) over (partition by MegaBall)
from megamillion
order by 3 desc 




-- select count(*) from megamillion_all_combination

-- begin
-- select top 100 * from megamillion_all_combination
-- order by NEWID();
-- end 

-- create index idx_n1 on megamillion_all_combination(n1)

-- ;

-- select top 1 * from megamillion_all_combination tablesample (0.1 percent)

-- select top 100 n,  * from megamillion_all_combination tablesample SYSTEM (0.1 percent);



