--basic

declare @step decimal(38,5) = 0.05
;
with r as (
select n = cast(-1.0 as decimal(38,5))
union all 
select cast(n+@step as decimal(38,5))
from r 
where n+@step <= 1.0
)
, c as 
(select n = cast(-1.0 as decimal(38,5))
union all 
select cast(n+@step as decimal(38,5)) from c
where n+@step <= 1.0
), staging as (
select rn = r.n, cn = c.n
, symbol = case when power(r.n-0, 2)+ power(c.n-0, 2) <= 1 then '*' else ' ' end 
from r, c 
)
select rn,   STRING_AGG(symbol, ' ') within group(order by cn)  
from staging
group by rn
option(maxrecursion 0)




go



--with format

declare @step decimal(38,5) = 0.05

;with r as (
select n = cast(-1.0 as decimal(38,5))
union all 
select cast(n+@step as decimal(38,5))
from r 
where n+@step <= 1.0
)
, c as 
(select n = cast(-1.0 as decimal(38,5))
union all 
select cast(n+@step as decimal(38,5)) from c
where n+@step <= 1.0
), staging as (
select rn = r.n, cn = c.n
, symbol = case when sqrt(power(r.n-0, 2)+ power(c.n-0, 2)) <= 1 then substring('`.*?x#h', cast(1+7*sqrt((power(r.n-0, 2)+ power(c.n-0, 2)))/1.0 as int ), 1) else ' ' end -- here is the formula, and pick the character from the format string, based on the percentile of distance to (0,0)
from r, c 
)
select rn
-- , pick
,   STRING_AGG(symbol, ' ') within group(order by cn)  
from staging
group by rn --, pick
option(maxrecursion 0)


go