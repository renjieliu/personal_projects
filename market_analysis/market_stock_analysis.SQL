/* -- create the raw data table
select tick = cast('SPY' as varchar(200)),  * into market from spy where 1=0

alter table market alter column volume bigint

insert into market
select tick = 'SPY',  * from spy

insert into market
select tick = 'GSPC', * from GSPC 

*/


drop table if exists #landing

select 
tick
,Date
,OpenPrice = cast(OpenPrice as decimal(10,5))
,HighPrice = cast(HighPrice as decimal(10,5))
,LowPrice = cast(LowPrice as decimal(10,5))
,ClosePrice = cast(ClosePrice as decimal(10,5))
,Adj_Close = cast(Adj_Close as decimal(10,5))
,Volume = cast(Volume as decimal(38,5))
,Insert_Date
into #landing from market m
where tick = 'SPY' 
and ISNUMERIC(OpenPrice)= 1 

create index idx_InsertDate on #landing(Insert_Date)

drop table if exists #base

select * 
into #base 
from #landing t 
where not exists (select * from #landing t1 where t1.Insert_Date > t.Insert_Date)


create index idx_date on #base(date) 

declare @startDate date = (select min(date) from #base )
declare @endDate date = (select max(date) from #base)


drop table if exists #dates
;

--to fill in the market close date, put the open price as the previous market close price 
;with cte as
(select date = @startDate
union all 
select dateadd(day,1, date) from cte
where date < @endDate
)
select distinct date into #dates
from cte 
option (maxrecursion 0)


drop table if exists #fillDate; 

select 
d.date
, fillDate = case when s.date is null then (select max(s2.date) from #base s2 where s2.date < d.date) 
				  else s.date 
			 end
into #fillDate 
from #dates d 
left outer join #base s 
on d.date = s.Date 
order by 1,2 

drop table if exists #cleanData 
select 
dateofWeek = DATENAME(dw, fd.date)
,fd.date
,OpenPrice = case when fd.fillDate = fd.date then s.closePrice else s.OpenPrice end
,ClosePrice = s.ClosePrice
into #cleanData
from #fillDate fd
left outer join #base s
on case when fd.fillDate = fd.date then fd.date else fd.filldate end = s.date


;
declare @year int = 20
declare @maxDate date = (select date = max(date) from #cleanData)

select APY = power(c2.OpenPrice/c1.OpenPrice ,1.0/@year )-1, 
c1.*
,delimiter =  '<<When taking out at:>>'
,c2.* from #cleanData c1 left outer join #cleanData c2
on 
case when DATEADD(year, @year, c1.date) > @maxDate
     then @maxDate
	 else DATEADD(year, @year, c1.date)
end = c2.date
where c1.date < dateadd(year, -@year, @maxDate)
order by 1 asc 
