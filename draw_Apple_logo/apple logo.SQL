--basic

drop table if exists #t

declare @step decimal(38,5) = 1.0
;
with r as (
select n = cast(1.0 as decimal(38,5))
union all 
select cast(n+@step as decimal(38,5))
from r 
where n+1 <= 50
)
, c as 
(select n = cast(1.0 as decimal(38,5))
union all 
select cast(n+@step as decimal(38,5)) from c
where n+@step <= 50 
), staging1 as (
select rn = r.n, cn = c.n
, symbol = case when power(r.n-10, 2)+ power(c.n-10, 2) < 64 then '*' else ' ' end 
from r, c 
)
, staging2 as (
select rn = r.n, cn = c.n
, symbol = case when power(r.n-20, 2)+ power(c.n-10, 2) < 64 then '*' else ' ' end 
from r, c 
)
select t = 'staging1', * into #t from staging1  
union all 
select t = 'staging2', * from staging2
option(maxrecursion 0)


create index idx_t on #t(t)


select rn,  STRING_AGG(symbol, ' ') within group(order by cn)  
from (
select rn, cn, symbol from #t where t = 'staging1' ) t
group by rn
order by 1
option(maxrecursion 0)


select rn,  STRING_AGG(symbol, ' ') within group(order by cn)  
from (
select rn, cn, symbol from #t where t = 'staging2' ) t
group by rn
order by 1
option(maxrecursion 0)


select rn,  STRING_AGG(symbol, ' ') within group(order by cn)  
from (
select rn, cn, symbol from #t where t = 'staging1' 
union 
select rn, cn, symbol from #t where t = 'staging2' ) t
group by rn
order by 1
option(maxrecursion 0)


--select rn,  STRING_AGG(symbol, ' ') within group(order by cn)  
--from (select * from staging1 intersect select * from staging2) t
--group by rn
--option(maxrecursion 0)




go
