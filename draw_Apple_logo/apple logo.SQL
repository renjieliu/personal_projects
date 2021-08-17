--basic

drop table if exists #t
drop table if exists #grid

declare @step decimal(38,5) = 0.1
declare @start decimal(38,5) = 8.0
declare @end decimal(38,5) = 15.0



;
with r as (
select n = @start
union all 
select cast(n+@step as decimal(38,5))
from r 
where n+@step <= @end
)
, c as 
(select n = @start
union all 
select cast(n+@step as decimal(38,5)) from c
where n+@step <= @end 
)select rn = r.n, cn = c.n into #grid from r, c


;
with r as (
select n = @start
union all 
select cast(n+@step as decimal(38,5))
from r 
where n+@step <= @end
)
, c as 
(select n = @start
union all 
select cast(n+@step as decimal(38,5)) from c
where n+@step <= @end 
), staging1 as (
select rn = r.n, cn = c.n
, symbol = case when power(r.n-10, 2)+ power(c.n-10, 2) < 4 then '*' else null end 
from r, c 
)
, staging2 as (
select rn = r.n, cn = c.n
, symbol = case when power(r.n-13, 2)+ power(c.n-10, 2) < 4 then '*' else null end 
from r, c 
)
select t = 'staging1', * into #t from staging1  
union all 
select t = 'staging2', * from staging2
option(maxrecursion 0)


create index idx_t on #t(t)


--select rn,  STRING_AGG(symbol, ' ') within group(order by cn)  
--from (
--select rn, cn, symbol from #t where t = 'staging1' ) t
--group by rn
--order by 1
--option(maxrecursion 0)


--select rn,  STRING_AGG(symbol, ' ') within group(order by cn)  
--from (
--select rn, cn, symbol from #t where t = 'staging2' ) t
--group by rn
--order by 1
--option(maxrecursion 0)
go 

with staging as
(
	select distinct grid.rn , grid.cn , symbol = isnull(t.symbol, ' ')-- coalesce(t1.symbol, t2.symbol, ' ')
	from #grid grid 
	left outer join 
	(
		--select t1.rn, t1.cn, t1.symbol from 
			(select rn, cn, symbol from #t where t = 'staging1' and symbol='*') 
				intersect
			(select rn, cn, symbol from #t where t = 'staging2' and symbol='*')  
	) t on grid.rn = t.rn and grid.cn = t.cn 
)

select rn,  STRING_AGG(symbol, ' ') within group(order by cn)   
from staging
group by rn
order by 1 










