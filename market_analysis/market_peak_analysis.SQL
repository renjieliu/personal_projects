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
tick
,dateofWeek = DATENAME(dw, fd.date)
,fd.date
,OpenPrice = case when fd.fillDate = fd.date then s.closePrice else s.OpenPrice end
,ClosePrice = s.ClosePrice
into #cleanData
from #fillDate fd
left outer join #base s
on case when fd.fillDate = fd.date then fd.date else fd.filldate end = s.date

;

create index idx_tick_date on #cleanData(date)

--select * from #cleanData

drop table if exists #stg 

select 
rn = ROW_NUMBER() over (partition by c1.tick order by date)
,peak = case when ClosePrice = max(ClosePrice) over(partition by tick order by date rows between unbounded preceding and current row )
			 then 1 
		     else 0 
	    end 
,* 
into #stg
from #cleanData c1


create index idx_peak_rn on #stg(peak, rn)

drop table if exists #market_peak

select nxtPeak = c2.date
, c1.*
into #market_peak
from #stg c1 
left outer join #stg c2 
on c1.tick = c2.tick and c2.peak = 1 and c2.rn > c1.rn
and not exists (select * from #stg c3 where c3.tick = c1.tick and c3.peak = 1 and c3.rn > c1.rn and c3.rn < c2.rn)


; with cte as (
select 
*
,min_price_between = (select min(ClosePrice) from #market_peak m2 where m2.date between m1.date and m1.nxtPeak)
,min_price_between_on_date = (select min(date) from #market_peak m where m.date between m1.date and m1.nxtPeak and m.ClosePrice =  (select min(ClosePrice) from #market_peak m2 where m2.date between m1.date and m1.nxtPeak))
,drop_percentage = (select min(ClosePrice) from #market_peak m2 where m2.date between m1.date and m1.nxtPeak)/ClosePrice - 1
from #market_peak m1
)
select days_to_lowest = datediff(day, date, min_price_between_on_date),
next_peak_price = (select ClosePrice from cte c2  where c2.tick  = c1.tick and date = c1.nxtPeak)
, next_peak_price_gain_percentage = (select ClosePrice from cte c2  where c2.tick  = c1.tick and date = c1.nxtPeak) / ClosePrice - 1
, peak_diff = datediff(day, date, nxtPeak) + 1 
, *
from cte c1
where dateofWeek not in ('Saturday', 'Sunday')
and date >= '2019-01-01'
and drop_percentage < 0
order by drop_percentage desc


