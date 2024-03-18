----This is to generate 4*4 sudoku game

set nocount on;

drop table if exists #nums;


-- prepare the base numbers 
select 
rn = ROW_NUMBER() over(order by 1/0)
, * 
into #nums
from (values(1), (2), (3), (4)) v(id)


drop table if exists #r_c

; with cte as
(
	select curr = cast(id as varchar(max)) from #nums
		union all 
	select concat(curr, n.id) from #nums n, cte 
	where len(curr) < 4 
	and charindex(cast(n.id as varchar), curr) = 0  -- make sure no repeat number in the same row
)
, r as -- rows satisfied the conditions 
(
	select * from cte
	where len(curr) = 4
) 
select
A = r.curr
, B = r2.curr
, C = r3.curr
, D = r4.curr
into #r_c 
from r, r r2, r r3, r r4
where r.curr != r2.curr  -- no repeat in the same col
and SUBSTRING(r.curr, 1, 1)!= SUBSTRING(r2.curr, 1, 1)
and SUBSTRING(r.curr, 1, 1)!= SUBSTRING(r3.curr, 1, 1)
and SUBSTRING(r.curr, 1, 1)!= SUBSTRING(r4.curr, 1, 1)
and SUBSTRING(r.curr, 2, 1)!= SUBSTRING(r2.curr, 2, 1)
and SUBSTRING(r.curr, 2, 1)!= SUBSTRING(r3.curr, 2, 1)
and SUBSTRING(r.curr, 2, 1)!= SUBSTRING(r4.curr, 2, 1)
and SUBSTRING(r.curr, 3, 1)!= SUBSTRING(r2.curr, 3, 1)
and SUBSTRING(r.curr, 3, 1)!= SUBSTRING(r3.curr, 3, 1)
and SUBSTRING(r.curr, 3, 1)!= SUBSTRING(r4.curr, 3, 1)
and SUBSTRING(r.curr, 4, 1)!= SUBSTRING(r2.curr, 4, 1)
and SUBSTRING(r.curr, 4, 1)!= SUBSTRING(r3.curr, 4, 1)
and SUBSTRING(r.curr, 4, 1)!= SUBSTRING(r4.curr, 4, 1)

and SUBSTRING(r2.curr, 2, 1)!= SUBSTRING(r3.curr, 2, 1)
and SUBSTRING(r2.curr, 2, 1)!= SUBSTRING(r4.curr, 2, 1)
and SUBSTRING(r2.curr, 3, 1)!= SUBSTRING(r3.curr, 3, 1)
and SUBSTRING(r2.curr, 3, 1)!= SUBSTRING(r4.curr, 3, 1)
and SUBSTRING(r2.curr, 4, 1)!= SUBSTRING(r3.curr, 4, 1)
and SUBSTRING(r2.curr, 4, 1)!= SUBSTRING(r4.curr, 4, 1)

and SUBSTRING(r3.curr, 2, 1)!= SUBSTRING(r4.curr, 2, 1)
and SUBSTRING(r3.curr, 3, 1)!= SUBSTRING(r4.curr, 3, 1)
and SUBSTRING(r3.curr, 4, 1)!= SUBSTRING(r4.curr, 4, 1)




drop table if exists #good

select 
rn = ROW_NUMBER() over (order by A) -- valid rows to be used for union 
,  *
into #good
from #r_c
where  --valid for each 2*2 grid 
cast(substring(A, 1, 1) as int) +  cast(substring(A, 2, 1 ) as int) +  cast(substring(B, 1, 1)as int) +  cast(substring(B, 2, 1) as int)= 10 
and 
cast(substring(C, 1, 1) as int) +  cast(substring(C, 2, 1 ) as int) +  cast(substring(D, 1, 1)as int) +  cast(substring(D, 2, 1) as int)= 10 


--sn is the sudoku rows - column A: 1, B:2, C:3, D:4
--random_1 and random_2 is to mark the placeholders for the sudoku game
; with cte as (
select rn, sn = 1, A, random_1 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1, random_2 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1 from #good
union all 
select rn, sn = 2, B, random_1 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1, random_2 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1 from #good
union all
select rn, sn = 3, C, random_1 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1, random_2 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1 from #good
union all
select rn, sn = 4, D, random_1 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1, random_2 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1 from #good
) 
select -- replace the number at random location as X
stuff( 
	stuff(A, cast(random_1 as int ), 1 , N'X')
	,
	cast(random_2 as int )
	,1
	,N'X'
	)
from cte
where rn = (select floor( rand()* (select max(rn) from #good)  )  + 1) -- take anyone from the repository 
order by sn 





---------this is to solve the sudoku---------
-- TODO -- 
-- Inspired by 
-- https://forums.oracle.com/ords/apexds/post/explanation-of-a-complex-query-to-solve-sudoku-using-recurs-7923
-- https://www.percona.com/blog/sudoku-recursive-common-table-expression-solver/ 
-- https://technology.amis.nl/it/solving-a-sudoku-with-one-sql-statement/

; with input as 
(
  select sud =  '53..7....6..195....98....6.8...6...34..8.3..17...2...6.6....28....419..5....8..79' -- "." is placeholders
) 
,digits as -- this is to generate from 1 to 9 
( 
select 
num = cast('1' as varchar(max))
, n = 1
union all 
select 
num = cast(n+1 AS varchar(max))
, n+1 
from digits where n<9
) 
, res as 
(
select  
s = cast(sud as varchar(max)) -- find the first location for the placeholder
, ind = cast(charindex('.', sud) as varchar(max) ) FROM input

union all 

select 
 s = cast(substring( s, 1, ind-1) + num + substring(s, ind+1, len(s)-(ind+1) )  as varchar(max)) -- generate the new line
, ind = cast(charindex('.' ,  substring(s, 1, ind-1) + num + substring(s, ind+1, len(s)-(ind+1))) as varchar(max)) -- find the next .
from res, digits z -- filling in the numbers
where ind > 0
and not exists  
	( 
	select * 
	from digits d 
	where z.num = substring(s, ((ind-1)/9)*9 + d.n, 1) -- same row 
		or z.num = substring(s, ((ind-1)%9) + (d.n-1)*9 + 1, 1) -- same col
		or z.num = substring(s, (((ind-1)/3) % 3) * 3 -- same 3*3 square
								+ ((ind-1)/27) * 27 + d.n
								+ ((d.n-1) / 3) * 6
							, 1
							)
	)
 )
select s from res 
where ind = 0 -- cannot find . anymore












 