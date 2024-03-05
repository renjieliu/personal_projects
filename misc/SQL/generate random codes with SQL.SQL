-- previous solution

drop table if exists #t

; with rep as 
(select ch = char(48), r = 48
union all 
select ch  = char(r+1), r = r+ 1 from rep   
where r <=  122 
), b as (
select ch from rep
where r between 48 and 57 
	or r between 65 and 90 
	or r between 97 and 122 
)
select rn = ROW_NUMBER() over(order by newid() ) , * into #t from b
;




with cte as
(
	select
	id = 1 
	, res = concat( 
	  (select top 1 ch from #t order by newid())
	, (select top 1 ch from #t order by newid())
	, (select top 1 ch from #t order by newid())
	, (select top 1 ch from #t order by newid())
	, (select top 1 ch from #t order by newid())
	, (select top 1 ch from #t order by newid())
	, (select top 1 ch from #t order by newid())
	, (select top 1 ch from #t order by newid())
	)

	union all 
	select
	id + 1 
	, res = concat( 
	  (select ch from (select rn = ROW_NUMBER() over (order by newid()), ch  from #t) t where rn = 1 )
	, (select ch from (select rn = ROW_NUMBER() over (order by newid()), ch  from #t) t where rn = 1 )
	, (select ch from (select rn = ROW_NUMBER() over (order by newid()), ch  from #t) t where rn = 1 )
	, (select ch from (select rn = ROW_NUMBER() over (order by newid()), ch  from #t) t where rn = 1 )
	, (select ch from (select rn = ROW_NUMBER() over (order by newid()), ch  from #t) t where rn = 1 )
	, (select ch from (select rn = ROW_NUMBER() over (order by newid()), ch  from #t) t where rn = 1 )
	, (select ch from (select rn = ROW_NUMBER() over (order by newid()), ch  from #t) t where rn = 1 )
	, (select ch from (select rn = ROW_NUMBER() over (order by newid()), ch  from #t) t where rn = 1 )
	)
	from cte
	where id < 100

)
select * from cte 







-- drop table if exists #b ; 


-- ; with rep as 
-- (select c = char(48), r = 48
-- union all 
-- select c = char(r+1), r = r+ 1 from rep   
-- where r <=  122 
-- ), b as (
-- select c from rep
-- where r between 48 and 57 
-- 	or r between 65 and 90 
-- 	or r between 97 and 122 
-- )
-- select rn = ROW_NUMBER() over(order by newid() ) , * into #b from b

-- --select * from #b 
-- --select datediff_big(second, '2024-01-01', GETDATE())

-- ; with res as (
-- select
-- 	cnt = 1 
-- 	,r = CONCAT(
-- 	   (select c from #b where rn = floor(rand()* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand()* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand()* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand()* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand()* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand()* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand()* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand()* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand()* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand()* 62) + 1  )
-- 	)
-- union all 
-- select cnt + 1
-- 	,r = CONCAT(
-- 	   (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  ) -- using the previous result to generate the current random
-- 	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
-- 	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
-- 	)
-- from res
-- where cnt < 100
-- )
-- select * from res
-- option (maxrecursion 0)



-- ; 



