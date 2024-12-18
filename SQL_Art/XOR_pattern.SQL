-- # Draw the XOR texture in Python - inspired by https://lodev.org/cgtutor/xortexture.html
-- for y in range(h):
--     for x in range(w):
--         c = x ^ y
--         color = (c, c, c)  # Create a grayscale color
--         screen.set_at((x, y), color)


--- Below is to turn it into SQL- 


drop table if exists #base

; with cte_w as (
     select w= 1
     union all 
     select w+1 from cte_w
     where w < 256 
)
, cte_h as (
     select h= 1
     union all 
     select h+1 from cte_h
     where h < 256 
)
select w, h, c =  w ^ h 
into #base
from cte_w , cte_h
option (maxrecursion 0 )

go 


drop table if exists #staging 

select 
w
, h
, c
, tile_character = SUBSTRING(('.+!&@'), NTILE(len('.+!&@')) over (order by c) , 1 )
into #staging
from #base


select 
h, 
STRING_AGG(tile_character, '') within group(order by w)
from #staging
group by h 
order by 1 

go 







