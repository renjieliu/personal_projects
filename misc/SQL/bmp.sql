select len(img) from test_img


select img from test_img


go 


drop table if exists #t 

select img = convert(varchar(max), img, 2)
into #t
from test_img


--; with cte as 
--(select id = 1, curr = left(img, 2 ), re = right(img, len(img)-2) from #t
--	union all 
-- select id+1, curr = left(re, 2), re = right(re, len(re)-2)  from cte 
-- where len(re) > 2
--)
--select id, curr  from cte 
--option (maxrecursion 0 )



drop table if exists #cte

create table #cte (id int, ch varchar(10))

declare @img varchar(max) = (select top 1 img = convert(varchar(max), img, 2) from test_img)
declare @ptr int = 1 
declare @id int = 1

while @ptr < len(@img)
begin 

	insert into #cte 
	select @id, SUBSTRING(@img, @ptr, 2)

	set @id = @id + 1 
	set @ptr = @ptr+2
	if @id % 10000 = 0
	begin
	select cast(100.0 * @ptr / len(@img) as decimal(38,2))
	end 

end


drop table if exists test_img_staging

select * into test_img_staging from #cte 

--commit

--select * from test_img_staging


drop table if exists #size
---------to get height and width of the bmp file
declare @width int 
declare @height int 

select 
width = 
cast (
convert(varbinary, 
	concat( 
			'0x',
			(select ch from test_img_staging where id = 22 )
			, 
			(select ch from test_img_staging where id = 21 )
			,
			(select ch from test_img_staging where id = 20 )
			,
			(select ch from test_img_staging where id = 19 )
		), 1 
	)
as int 
)

, height = 

cast (
convert(varbinary, 
	concat( 
			'0x',
			(select ch from test_img_staging where id = 26 )
			, 
			(select ch from test_img_staging where id = 25 )
			,
			(select ch from test_img_staging where id = 24 )
			,
			(select ch from test_img_staging where id = 23 )
		), 1 
	)
as int 
)
into #size 


--select * from #size

drop table if exists #pic 

select 
line = (id-54)/(select width from #size)
, * 
into #pic 
from test_img_staging 
where id >=55




select 
line, string_agg( case when ch = 'FF' then ' ' 
					   when ch = '00' then ''
					   else '*' 
			      end, ''  ) within group (order by id)
from #pic 
--where (id - 54)%3 = 0 
group by line
order by 1 desc



select * from #pic p 
where ch = '00' 
and not exists (select * from #pic p2 where ch = '00' and p.id+1 = p2.id)
and not exists (select * from #pic p3 where ch = '00' and p.id-1 = p3.id)


--select * from #pic 
--order by id 






--select 
--*
--from test_img_staging 
--where id >=55


--select * from #size

--select 
--  --STRING_AGG(ch, '') within group (order by id) 
--id
--,ch
--from test_img_staging
--where id between 19 and 22
--order by id desc 


--select 
-- STRING_AGG(ch, '-') within group (order by id ) 
-- , STRING_AGG(ch, '-') within group (order by id desc ) 
--from test_img_staging
--where id between 19 and 22










--with a as (
--select * from (values (1, 'a') , (2, 'b')) t(id, name)
--)
--select string_agg(name, '-') within group(order by id desc )  from a 