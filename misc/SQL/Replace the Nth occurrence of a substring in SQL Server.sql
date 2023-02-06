CREATE FUNCTION splitStr
(
    @string varchar(200),
    @split varchar(10)
)
RETURNS TABLE AS RETURN
(
with cte as( 
select currString = @string, occurrence = 1, pos = PATINDEX('%' + @split + '%', @string)
union all
select right(currString, len(currString) - PATINDEX('%' + @split + '%',  currString)), occurrence+1, pos = pos + PATINDEX('%' + @split + '%',  right(currString, len(currString)- PATINDEX('%' + @split + '%',  currString)))
from cte 
where PATINDEX('%' + @split + '%',  right(currString, len(currString)- PATINDEX('%' + @split + '%',  currString))) > 0
)
select * from cte 
)
go


declare @originalCharacter varchar(100) = 'A'
declare @replaceWith varchar(100) = '#'
declare @occurence int = 3


; with base as (select yyyyyyy from xxxxxxxxx)
select yyyyyyy, 
stuff(yyyyyyy, 
	          isnull( x.pos, 1)
			  ,	case when x.pos is null then 0 else 1 end 
			  , case when x.pos is null then '' else '#' end 
			  )
			  
from base 
outer apply (select pos from dbo.splitStr(base.yyyyyyy, @originalCharacter) t where occurrence = 3) as x 


