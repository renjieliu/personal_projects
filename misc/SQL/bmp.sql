--select len(img) from test_img


--select img from test_img


--go 


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



declare @img varchar(max) = (select top 1 img = convert(varchar(max), img, 2) from test_img)

 

drop table if exists #size

select width =  cast(convert(varbinary, '0x' 
										+ SUBSTRING(@img, 43, 2)
										+ SUBSTRING(@img, 41, 2)
										+ SUBSTRING(@img, 39, 2) 
										+ SUBSTRING(@img, 37, 2) 
							, 1) 
					 as int)
, height = cast(convert(varbinary, '0x' 
										+ SUBSTRING(@img, 51, 2)
										+ SUBSTRING(@img, 49, 2)
										+ SUBSTRING(@img, 47, 2) 
										+ SUBSTRING(@img, 45, 2) 
							, 1) 
					 as int)

into #size 



declare @padding int = (select 3*width from #size) % 4 


drop table if exists #cte

create table #cte (id int, ch varchar(max))

declare @ptr int = 110 
declare @id int = 1
declare @width_bytes int = (select (select 3*width from #size) + @padding*2)

while @ptr < len(@img)
begin 

	insert into #cte 
	select @id, SUBSTRING(@img, @ptr, @width_bytes)

	set @id = @id + 1 
	set @ptr = @ptr + @width_bytes
	-- if @id % 10000 = 0
	--begin
	--	select cast(100.0 * @ptr / len(@img) as decimal(38,2))
	--end 

end

select * from #cte
 
go









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

delete from test_img_staging  where id < 55 -- delete the BMP file header. BMP header takes 54 bytes
--select * from #size

update test_img_staging set id = id-54

select * from test_img_staging

drop table if exists #pic 

select 
--pixel_n = ceiling(id/3.0)
--, 
id
, ch
, pixel_rgb = cast(convert(varbinary, '0x' + ch, 1 ) as int)
into #pic 
from test_img_staging 
order by 1 


select * from #pic 
order by id 


; with t as (
select 
*
--, line_n = ceiling(pixel_n / (select width from #size))
-- , pixel_gray = AVG(pixel_rgb) over(partition by pixel_n)
, pad_or_not = case when pixel_rgb = 0 -- current is 0, previous is end of pixel. Padding is to make line as 4x bytes
							and
						(
						floor ( (id-1.0)/ (select width from #size)) =  (id-1)/(select width from #size) 
							or 
						floor ( (id-2.0)/ (select width from #size) )  = (id-2) / (select width from #size) 
							or 
						floor ( (id-3.0)/ (select width from #size) )  = (id-3) / (select width from #size) 
						)
						
					then 1 
					else 0
			    end 
from #pic 
) 
select
id 
, ch
, pixel_rgb
from t
where pad_or_not = 1 
 
select 
pixel_n = ceiling(pixel_id/3.0)
, pixel_id
, ch
, pixel_rgb
from b 


select 
line_n
, string_agg( case when pixel_gray = 255 then ' ' 
					   when pixel_gray = 0 then ''
					   else '*' 
			      end, ''  ) within group (order by pixel_n)
from t 
--where (id - 54)%3 = 0 
group by line_n
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