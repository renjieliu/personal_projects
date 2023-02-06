drop table if exists r
drop table if exists i

select -50 id into r 
select -50 id into i

set nocount on 

declare @curr int = (select top 1 id from r)
declare @end int = (select abs(max(id)) from r)
declare @step int = 1

while @curr < @end
begin
	insert into r select max(id)+1 from r 
	insert into i select max(id)+1 from i
	set @curr = @curr + @step
end


; WITH q AS
(
SELECT  
r =  cast(x + r_id * step as real), 
i =  cast(y + i_id * step as real),
rx = cast(x + r_id * step as real), 
ix = cast(y + i_id * step as real),
g = 0
FROM   
	(
	SELECT  
	x = 0.25,
	y = -0.55,
	step =  0.002, 
	r_id = r.id, 
	i_id = i.id
	FROM r cross join i
	) t 

UNION ALL
	SELECT  
	r, 
	i,
	cast(CASE WHEN (rx * rx + ix * ix) <  1E8 THEN power(rx * rx + ix * ix , 0.75) * COS(1.5 * ATN2(ix, rx)) END - 0.2 as real),
	cast(CASE WHEN (rx * rx + ix * ix) <  1E8 THEN power(rx * rx + ix * ix , 0.75) * SIN(1.5 * ATN2(ix, rx)) END as real),
	g = g + 1
	FROM  q
	WHERE rx IS NOT NULL
	AND g < 99
)

SELECT string_agg(s,'') within group(ORDER BY r)
FROM (
	SELECT  i, r, SUBSTRING(' .:-=+*#%@', MAX(g) / 10 + 1, 1) s
	FROM q
	GROUP BY i, r
	) X 
GROUP BY i
ORDER BY i



