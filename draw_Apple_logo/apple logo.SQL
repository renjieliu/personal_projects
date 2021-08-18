--basic

drop table if exists #t
drop table if exists #grid
drop table if exists #staging


declare @start decimal(38,5) = 0
declare @end decimal(38,5) = 500
declare @step decimal(38,5) = 5

;
with x as 
(select n = @start
union all 
select cast(n+@step as decimal(38,5)) from x
where n+@step <= @end 
), 
y as (
select n = @start
union all 
select cast(n+@step as decimal(38,5))
from y 
where n+@step <= @end
)
select yn = y.n, xn = x.n into #grid from x, y 
option(maxrecursion 0)


;
with x as 
(select n = @start
union all 
select cast(n+@step as decimal(38,5)) from x
where n+@step <= @end 
)
, y as (
select n = @start
union all 
select cast(n+@step as decimal(38,5))
from y 
where n+@step <= @end
)
, left_big  as (
select ctename = 'left_big',  xn = x.n, yn = y.n
, symbol = case when power(x.n-204, 2)+ power(y.n-277, 2) < 40000 then '*' else null end 
from x, y
)
, right_big as (
select ctename = 'right_big',  xn = x.n, yn = y.n
, symbol = case when power(x.n-271, 2)+ power(y.n-277, 2) < 40000 then '*' else null end 
from x, y
)
, bite as (
select ctename = 'bite',  xn = x.n, yn = y.n
, symbol = case when power(x.n-418, 2)+ power(y.n-287, 2) < 6400 then '*' else null end 
from x, y
)
, top_left as (
select ctename = 'top_left',  xn = x.n, yn = y.n
, symbol = case when power(x.n-156, 2)+ power(y.n-239, 2) < 6400 then '*' else null end 
from x, y
)
, top_right as (
select ctename = 'top_right',  xn = x.n, yn = y.n
, symbol = case when power(x.n-312, 2)+ power(y.n-239, 2) < 6400 then '*' else null end 
from x, y
)
, apple_top as (
select ctename = 'apple_top',  xn = x.n, yn = y.n
, symbol = case when power(x.n-238, 2)+ power(y.n-98, 2) < 6400 then '*' else null end 
from x, y
)
, left_leaf as (
select ctename = 'left_leaf',  xn = x.n, yn = y.n
, symbol = case when power(x.n-235, 2)+ power(y.n-83, 2) < 6400 then '*' else null end 
from x, y
)
, right_leaf as (
select ctename = 'right_leaf',  xn = x.n, yn = y.n
, symbol = case when power(x.n-320, 2)+ power(y.n-157, 2) < 6400 then '*' else null end 
from x, y
)
, bite_assis as (
select ctename = 'bite_assis',  xn = x.n, yn = y.n
, symbol = case when power(x.n-299, 2)+ power(y.n-396, 2) < 6400 then '*' else null end 
from x, y
)
, bottom as 
(
select ctename = 'bottom',  xn = x.n, yn = y.n
, symbol = case when power(x.n-238, 2)+ power(y.n-514, 2) < 6400 then '*' else null end 
from x, y
)
, middle_small as 
(
select ctename = 'middle_small',  xn = x.n, yn = y.n
, symbol = case when power(x.n-238, 2)+ power(y.n-396, 2) < 100 then '*' else null end 
from x, y
)
, left_5 as 
(
select ctename = 'left_5',  xn = x.n, yn = y.n
, symbol = case when power(x.n-177, 2)+ power(y.n-396, 2) < 2500 then '*' else null end 
from x, y
)
, right_5 as 
(
select ctename = 'right_5',  xn = x.n, yn = y.n
, symbol = case when power(x.n-299, 2)+ power(y.n-396, 2) < 2500 then '*' else null end 
from x, y
)
, left_3 as 
(
select ctename = 'left_3',  xn = x.n, yn = y.n
, symbol = case when power(x.n-114, 2)+ power(y.n-344, 2) < 900 then '*' else null end 
from x, y
)
, right_3 as 
(
select ctename = 'right_3',  xn = x.n, yn = y.n
, symbol = case when power(x.n-363, 2)+ power(y.n-344, 2) < 900 then '*' else null end 
from x, y
)
, mid_13 as 
(
select ctename = 'mid_13',  xn = x.n, yn = y.n
, symbol = case when power(x.n-238, 2)+ power(y.n-298, 2) < 16900 then '*' else null end 
from x, y
)
, left_upper_corner as  -- need to take extra points, the extra part is left_upper_corner intersect with right large, minus top_left, minus apple_top
(
select ctename = 'left_upper_corner',  xn = xn, yn = yn 
, symbol = '*'
from #grid 
where xn between 82 and 190 
  and yn between 107 and 199
)
, right_upper_corner as 
(
select ctename = 'right_upper_corner',  xn = xn, yn = yn
, symbol = '*'
from #grid 
where xn between 289 and 390
  and yn between 108 and 198
)
, left_lower_corner as 
(
select ctename = 'left_lower_corner',  xn = xn, yn = yn
, symbol = '*'
from #grid 
where xn between 157 and 191
  and yn between 443 and 457
)
, right_lower_corner as 
(
select ctename = 'right_lower_corner',  xn = xn, yn = yn
, symbol = '*'
from #grid 
where xn between 283 and 320
  and yn between 443 and 457
)

select * into #t 
from left_big
union all select * from right_big
union all select * from bite
union all select * from top_left
union all select * from top_right
union all select * from apple_top
union all select * from left_leaf
union all select * from right_leaf
union all select * from bite_assis
union all select * from bottom
union all select * from middle_small
union all select * from left_5
union all select * from right_5
union all select * from left_3
union all select * from right_3
union all select * from mid_13
union all select * from left_upper_corner
union all select * from right_upper_corner
union all select * from left_lower_corner
union all select * from right_lower_corner
option(maxrecursion 0)



create index idx_t on #t(ctename)



; 
with staging as
(
	select distinct grid.xn , grid.yn , symbol = isnull(t.symbol, ' ')-- coalesce(t1.symbol, t2.symbol, ' ')
	from #grid grid 
	left outer join 
	(
			(select xn, yn, symbol from #t where ctename = 'left_big' and symbol='*'
			intersect
			select xn, yn, symbol from #t where ctename = 'right_big' and symbol='*'
			except 
			select xn, yn, symbol from #t where ctename = 'apple_top' and symbol='*'
			except 
			select xn, yn, symbol from #t where ctename = 'bottom' and symbol='*'
			except 
			select xn, yn, symbol from #t where ctename = 'bite' and symbol='*'
			)  
			
			except -- left upper corner

			(
			select xn, yn, symbol from #t where ctename = 'left_upper_corner' and symbol='*' 
			intersect 
			select xn, yn, symbol from #t where ctename = 'right_big' and symbol='*'
			except 
			select xn, yn, symbol from #t where ctename = 'top_left' and symbol='*'
			except 
			select xn, yn, symbol from #t where ctename = 'apple_top' and symbol='*'
			)
			


			except -- right upper corner

			(
			select xn, yn, symbol from #t where ctename = 'right_upper_corner' and symbol='*' 
			intersect 
			select xn, yn, symbol from #t where ctename = 'left_big' and symbol='*'
			except 
			select xn, yn, symbol from #t where ctename = 'top_right' and symbol='*'
			except 
			select xn, yn, symbol from #t where ctename = 'apple_top' and symbol='*'
			)

			except -- left lower corner

			(
			select xn, yn, symbol from #t where ctename = 'left_lower_corner' and symbol='*' 
			intersect 
			select xn, yn, symbol from #t where ctename = 'right_big' and symbol='*'
			except 
			select xn, yn, symbol from #t where ctename = 'left_5' and symbol='*'
			except 
			select xn, yn, symbol from #t where ctename = 'bottom' and symbol='*'
			)
			
			
			except -- right lower corner

			(
			select xn, yn, symbol from #t where ctename = 'right_lower_corner' and symbol='*' 
			intersect 
			select xn, yn, symbol from #t where ctename = 'left_big' and symbol='*'
			except 
			select xn, yn, symbol from #t where ctename = 'right_5' and symbol='*'
			except 
			select xn, yn, symbol from #t where ctename = 'bottom' and symbol='*'
			)


			union  --leaf
			(select xn, yn, symbol from #t where ctename = 'left_leaf' and symbol='*'
			 intersect
			 select xn, yn, symbol from #t where ctename = 'right_leaf' and symbol='*'
			) 

	) t on grid.xn = t.xn and grid.yn = t.yn 
)
select * into #staging from staging

;
declare @radius decimal(38,5) = 0; 
declare @band decimal(38,5) = 0;
declare @y0 decimal(38,5);
declare @format int = 1 -- 1 as band, 2 as radius


; with points_Range as -- the range of points shown on the canvas
(select
 mn_x = min(xn)
 , mx_x = max(xn)
 , mn_y = min(yn)
 , mx_y = max(yn)
 from #staging
 where symbol = '*'
)
, radius  as 
(select radius = greatest( sqrt( power( (select mn_x from points_Range)-250, 2) + power( (select mn_y from points_Range)-250, 2) ) ,
				           sqrt( power( (select mx_x from points_Range)-250, 2) + power( (select mx_y from points_Range)-250, 2) )
						  )
)
select @y0 = (select mn_y from points_Range),  @band = mx_y - mn_y, @radius = (select radius from radius) from points_Range





--select yn,  
select yn, 
iif(@format=2, STRING_AGG( case when symbol = '*' then substring('@*@?x#M', cast(1+7*sqrt((power(xn-250, 2)+ power(yn-250, 2)))/@radius as int ), 1) else ' ' end  , ' ') within group(order by xn) 
		     , STRING_AGG( case when symbol = '*' then substring('M+M+M+M', cast(1+7*(yn-@y0)/@band as int), 1) else ' ' end  , ' ') within group(order by xn)   
   ) --if @band = 0, use the radius for format, else, use banded appple logo
from #staging
group by yn
order by 1 



 
