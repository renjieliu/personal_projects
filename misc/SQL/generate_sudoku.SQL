
drop table if exists #base 


select rn = ROW_NUMBER() over(order by 1/0)
, * into #base
from (values(1), (2), (3), (4)) t(id)


drop table if exists #rpt

; with cte as
(select curr = cast(id as varchar(max)) from #base
union all 
select concat(curr, b.id) from #base b , cte 
where len(curr) < 4 and charindex(cast(b.id as varchar), curr) = 0  -- make sure no repeat number in the same row
), r as 
(
select * from cte
where len(curr) = 4
) 
select
A = r.curr
, B = r2.curr
, C = r3.curr
, D = r4.curr
into #rpt
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

order by 1, 2, 3, 4 



drop table if exists #duo

select rn = ROW_NUMBER() over (order by A)
,  *
into #duo
from #rpt
where  --valid for each 2*2 grid 
cast(substring(A, 1, 1) as int) +  cast(substring(A, 2, 1 ) as int) +  cast(substring(B, 1, 1)as int) +  cast(substring(B, 2, 1) as int)= 10 
and 
cast(substring(C, 1, 1) as int) +  cast(substring(C, 2, 1 ) as int) +  cast(substring(D, 1, 1)as int) +  cast(substring(D, 2, 1) as int)= 10 
 
; with a as (
select rn, sn = 1, A, random_1 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1, random_2 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1 
from #duo
union all 
select rn, sn = 2, B, random_1 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1, random_2 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1 from #duo
union all
select rn, sn = 3, C, random_1 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1, random_2 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1 from #duo
union all
select rn, sn = 4, D, random_1 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1, random_2 = floor(rand(CRYPT_GEN_RANDOM(5))*4)+1 from #duo
) 
select
rn
, sn
, stuff( 
	stuff(A, cast(random_1 as int ), 1 , 'X')
	,
	cast(random_2 as int )
	,1
	,'X'
	)
from a
where rn = (select floor( rand()* (select max(rn) from #duo)  )  + 1)
order by sn 





--; 
--with one as (
--select 
--rn = ROW_NUMBER() over(order by b1.id, b2.id, b3.id, b4.id)
--, b1 = b1.id
--, b2 = b2.id
--, b3 = b3.id
--, b4 = b4.id 
--from #base b1, #base b2 , #base b3 , #base b4 
--where b1.id != b2.id 
--and b1.id!= b3.id 
--and b1.id!=b4.id
--and b2.id!= b3.id
--and b2.id!=b4.id
--and b3.id!=b4.id 
--)
--, cte as (
--select rn, b1, b2, b3, b4, gn = rn, lvl = 1 from one 
--where rn = 1 
--union all 
--select one.rn, one.b1, one.b2, one.b3, one.b4, cte.gn, cte.lvl + 1   from cte inner join one
--on  one.rn > cte.rn 
--and one.b1 != cte.b1
--and one.b2 != cte.b2 
--and one.b3 != cte.b3
--and one.b4 != cte.b4
--), rpt as (
--select  
--rn = ROW_NUMBER() over (order by c1.b1)
--, lvl1_1 =   c1.b1
--, lvl1_2 = c1.b2
--, lvl1_3 = c1.b3
--, lvl1_4 = c1.b4
--, lvl2_1 = c2.b1
--, lvl2_2 = c2.b2
--, lvl2_3 = c2.b3
--, lvl2_4 = c2.b4
--, lvl3_1 = c3.b1
--, lvl3_2 = c3.b2
--, lvl3_3 = c3.b3
--, lvl3_4 = c3.b4
--, lvl4_1 = c4.b1
--, lvl4_2 = c4.b2
--, lvl4_3 = c4.b3
--, lvl4_4 = c4.b4
--from 
--(select * from cte where lvl = 1) c1 
--, (select * from cte where lvl = 2) c2
--, (select * from cte where lvl = 3) c3
--, (select * from cte where lvl = 4) c4
--where c1.lvl = 1 and c2.lvl = 2 and c3.lvl = 3 and c4.lvl = 4
--and c1.b1 + c2.b1 + c3.b1 + c4.b1  = 10 
--and c1.b2 + c2.b2 + c3.b2 + c4.b2  = 10 
--and c1.b3 + c2.b3 + c3.b3 + c4.b3  = 10 
--and c1.b4 + c2.b4 + c3.b4 + c4.b4  = 10 
--group by 
--c1.b1
--, c1.b2
--, c1.b3
--, c1.b4
--, c2.b1
--, c2.b2
--, c2.b3
--, c2.b4
--, c3.b1
--, c3.b2
--, c3.b3
--, c3.b4
--, c4.b1
--, c4.b2
--, c4.b3
--, c4.b4

--) 
--select 
--rn
--, lvl1_1  
--, lvl1_2  
--, lvl1_3  
--, lvl1_4  
--from rpt 
--union all 
--select 
--rn
--, lvl2_1  
--, lvl2_2  
--, lvl2_3  
--, lvl2_4  
--from rpt 
--union all 
--select 
--rn
--, lvl3_1  
--, lvl3_2  
--, lvl3_3  
--, lvl3_4  
--from rpt 
--union all 
--select 
--rn
--, lvl4_1  
--, lvl4_2  
--, lvl4_3  
--, lvl4_4  
--from rpt 
--order by 1 





 