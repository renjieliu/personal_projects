
select MegaBall, count(*) over (partition by MegaBall), *  from lottery 
order by 2 desc 


select distinct MegaBall  from lottery 
order by 1 desc 


select MegaBall, count(*) over (partition by MegaBall), *  from lottery 
order by 2,1, 3 desc

--Megaball frequency
select 
MegaBall
,latest = max(Date) 
,cnt_2019 = sum(case when year(date)= 2019 then 1 else 0 end )
,cnt_2018 = sum(case when year(date)= 2018 then 1 else 0 end )
,cnt_2017 = sum(case when year(date)= 2017 then 1 else 0 end )
,cnt_2016 = sum(case when year(date)= 2016 then 1 else 0 end )
,cnt_2015 = sum(case when year(date)= 2015 then 1 else 0 end )
,cnt_2014 = sum(case when year(date)= 2014 then 1 else 0 end )
,cnt_2013 = sum(case when year(date)= 2013 then 1 else 0 end )
,cnt_2012 = sum(case when year(date)= 2012 then 1 else 0 end )
,cnt_2011 = sum(case when year(date)= 2011 then 1 else 0 end )
,cnt_2010 = sum(case when year(date)= 2010 then 1 else 0 end )
,cnt_2009 = sum(case when year(date)= 2009 then 1 else 0 end )
,cnt_2008 = sum(case when year(date)= 2008 then 1 else 0 end )
,cnt_2007 = sum(case when year(date)= 2007 then 1 else 0 end )
from lottery 
group by MegaBall 
order by 2 desc 




select * from lottery
order by 1 desc 


--break number
;
with cte as 
(select date, numbers= ltrim(right(numbers ,len(numbers)-2)), curr =cast(left(Numbers,2 ) as varchar(max))  from lottery
union all 
select
 Date
,numbers = ltrim(right(numbers ,len(numbers)-2))
,curr = cast(left(cte.numbers,2 ) as varchar(max))
from cte 
where len(numbers)> 0
), result as (
select * from cte 
),tmp as (
select result.date, lottery.Numbers, lottery.MegaBall, result.curr from result inner join lottery
on result.Date = lottery.Date
)
select distinct
curr
, Numbers
, Date
, previous_appear = lag(date,1) over (partition by curr order by date )
, date_diff = datediff(day, 
						lag(date,1) over (partition by curr order by date )
						,max(date) over (partition by curr order by date )
					  )
, cnt = count(1) over (partition by curr)
,cnt_2019 = sum(case when year(date)= 2019 then 1 else 0 end )  over (partition by curr)
,cnt_2018 = sum(case when year(date)= 2018 then 1 else 0 end )  over (partition by curr)
,cnt_2017 = sum(case when year(date)= 2017 then 1 else 0 end )  over (partition by curr)
,cnt_2016 = sum(case when year(date)= 2016 then 1 else 0 end )  over (partition by curr)
,cnt_2015 = sum(case when year(date)= 2015 then 1 else 0 end )  over (partition by curr)
,cnt_2014 = sum(case when year(date)= 2014 then 1 else 0 end )  over (partition by curr)
,cnt_2013 = sum(case when year(date)= 2013 then 1 else 0 end )  over (partition by curr)
,cnt_2012 = sum(case when year(date)= 2012 then 1 else 0 end )  over (partition by curr)
,cnt_2011 = sum(case when year(date)= 2011 then 1 else 0 end )  over (partition by curr)
,cnt_2010 = sum(case when year(date)= 2010 then 1 else 0 end )  over (partition by curr)
,cnt_2009 = sum(case when year(date)= 2009 then 1 else 0 end )  over (partition by curr)
,cnt_2008 = sum(case when year(date)= 2008 then 1 else 0 end )  over (partition by curr)
,cnt_2007 = sum(case when year(date)= 2007 then 1 else 0 end )  over (partition by curr)
from tmp
order by cnt_2019 desc 


select distinct
MegaBall
, Date
, previous_appear = lag(date,1) over (partition by MegaBall order by date )
, date_diff = datediff(day, 
						lag(date,1) over (partition by MegaBall order by date )
						,max(date) over (partition by MegaBall order by date )
					  )
, cnt = count(1) over (partition by MegaBall)
from lottery
order by 3 desc 


