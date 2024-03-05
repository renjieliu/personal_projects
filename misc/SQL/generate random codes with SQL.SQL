; with rep as 
(select c = char(48), r = 48
union all 
select c = char(r+1), r = r+ 1 from rep   
where r <=  122 
), b as (
select c from rep
where r between 48 and 57 
	or r between 65 and 90 
	or r between 97 and 122 
)
select rn = ROW_NUMBER() over(order by newid() ) , * into #b from b

--select * from #b 
--select datediff_big(second, '2024-01-01', GETDATE())

; with res as (
select
	id = 1 
	,r = CONCAT(
	   (select c from #b where rn = floor(rand()* 62) + 1  )
	 , (select c from #b where rn = floor(rand()* 62) + 1  )
	 , (select c from #b where rn = floor(rand()* 62) + 1  )
	 , (select c from #b where rn = floor(rand()* 62) + 1  )
	 , (select c from #b where rn = floor(rand()* 62) + 1  )
	 , (select c from #b where rn = floor(rand()* 62) + 1  )
	 , (select c from #b where rn = floor(rand()* 62) + 1  )
	 , (select c from #b where rn = floor(rand()* 62) + 1  )
	 , (select c from #b where rn = floor(rand()* 62) + 1  )
	 , (select c from #b where rn = floor(rand()* 62) + 1  )
	)
union all 
select id + 1
	,r = CONCAT(
	   (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  ) -- using the previous result to generate the current random
	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
	 , (select c from #b where rn = floor(rand(hashbytes('MD5', r + cast(rand() as varchar(200) )))* 62) + 1  )
	)
from res
where id < 100
)
select * from res


