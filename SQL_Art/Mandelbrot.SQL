/* Python code for reference
def isMandelbrotNumber(z, c):
    iteration = 40
    threshold = 100
    while iteration > 0:
        z = z**2+c 
        if abs(z) > threshold:
            return False
        iteration -=1
    return True

arr = []
i = -1.2 
cnt_i = 0
while i < 1.2:
    cnt_i += 1 
    arr.append([])
    j = -1.6
    cnt_j = 0
    while j < 0.6:
        arr[-1].append("*" if isMandelbrotNumber(0, j + 1j * i) else " ")
        j+=0.02
        cnt_j += 1
    i+=0.06
print('total number checked: ', cnt_j, cnt_i)
print("\n".join("".join(a) for a in arr))

*/

drop table if exists #working

declare @threshold int = 1000 
declare @iteration int = 40

declare @realStart decimal(38,10) = -1.6
declare @realEnd decimal(38,10) =  0.6
declare @realStep decimal(38,10) = 0.02

declare @imgStart decimal(38,10) = -1.2
declare @imgEnd decimal(38,10) = 1.2
declare @imgStep decimal(38,10) = 0.06


; with realpart as 
(select r = @realStart
union all 
select r + @realStep from realpart
where r < @realEnd
), imaginary as (
select i = @imgStart
union all 
select i + @imgStep  from imaginary
where i < @imgEnd
), base as (
select rn = row_number() over(order by realpart.r) ,realpart.r, imaginary.i from realpart  , imaginary 
)
, cte as ( -- f = z**2 + c (zr is the real part of z, zi is the imaginary part of z. cr is real part of c , and ci is imaginary part of c)
select rn, iteration = 1, zr = r, zi = i, cr = r, ci = i  from base
union all
select rn, iteration+1
, cast(zr*zr - zi*zi + cr as decimal(38,10))
, cast(zr*zi + zr*zi + ci as decimal(38,10))
, cast(cr as decimal(38,10))
, cast(ci as decimal(38,10))
from cte
where iteration < @iteration and abs(cast(zr*zr - zi*zi + cr as decimal(38,10))) < @threshold
) 
select * into #working from cte  
option (maxrecursion 0)


-- find all the mandelbrot number in the iteration 
-- if it is, then display *, else display space.
drop table if exists #clean
select
cr
,ci
,display = case when count(*) >= @iteration then '*' else ' ' end -- if the iteration finishd, then it's in the mandelbrot set
into #clean
from #working
group by cr, ci


select
STRING_AGG(display,'') within group (order by cr)
from #clean
group by ci
 





