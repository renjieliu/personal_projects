declare @list varchar(100) = '7,13,22,42,123,2431,2,41,4,1,43' 

;
with lst as (
select curr = @list , remaining = @list ,id = 1
union all 
select 
curr = SUBSTRING(remaining, 0, charindex(',', remaining))
, remaining = right(remaining, len(remaining) - charindex (',', remaining)  ) , id+1
from lst 
where CHARINDEX(',', remaining) > 0
)
select curr from lst
where id !=1 
union 
select remaining from lst 
where id = (Select max(id) from lst)
option (maxrecursion 0 )

