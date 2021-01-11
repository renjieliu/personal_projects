(select '19510101' sd,  x = cast('19510101' as date)
union all
select sd, dateadd(day, 1, x)  from b  
where x < '20001231'
)

select * into #g from a  
union 
select * from b
option(maxrecursion 32767)

select * from #g 

select    x,  DATEPART(dw, x) from #g
where 
datename(day, x) = 1 and DATEPART(dw, x) =1 

