--Rule: https://www.archives.gov/research/census/soundex
--All the alphabet character should follow the lkp table 
--If it's AEIOUHWZ, it should not be counted in the final result
--If the character is same as the previous character, it will be neglected
--If it's a special character, the calculation should stop
--If the first character is special, then return '0000'
--If the first character is alphabet, return upper(firstCharacter) + next 3 valid calculated number 
--If the final result is less than 3 chacters, pad 0 on the right
--The result should always be 4 characters.


declare @rawStr varchar(200) = 'aeiouen' -- this is the test input string

;with lkp as 
(select grp = 'BFPV', num = 1
union all
select grp = 'CGJKQSXZ', num = 2
union all 
select grp = 'DT', num = 3
union all 
select grp = 'L', num = 4
union all 
select grp = 'MN',num = 5
union all 
select grp = 'R', num = 6
union all 
select gro = 'AEIOUHWZ', num = 0
), cte as 
(select 
rawStr = @rawStr
, rem =  @rawStr -- right(@rawStr, len(@rawStr) -1)
, pos = 0 
, currCharacter  = ''
union all 
select 
rawStr
, rem = right(rem, len(rem) -1)
, pos+1
, currCharacter = left(rem, 1)
from cte
where len(rem)>0
)   -- select * from cte option (maxrecursion 0) 
,staging as (
select c1.*, num = isnull(lkp.num, -1) from cte c1
left outer join lkp on lkp.grp like '%' + upper(left(c1.currCharacter, 1)) + '%'
where c1.pos > 0
and not exists (select * from cte c2 where c2.pos > 0 and c2.pos = c1.pos+1 and c2.currCharacter = c1.currCharacter)
)  --  select * from staging
, res as (
select rawStr, num, pos
from staging 
where 
 pos > 1
 and
 pos <  -- pos < first special character and >= first character != 0, after the first character
 isnull( (select min(pos) from staging where num = -1), len(@rawStr)*2 ) 
 and pos >
 isnull( (select min(pos) from staging where num = 0 and pos > 1) , 0 ) -- to find the special character pos in the string
) -- select * from res 
select @rawStr,
case when 0 = (select count(*) from res) then case when left(@rawStr,1) like '[a-z]%' then upper(left(@rawStr,1)) + '000' else '0000' end
     else (select 
				upper(substring(rawStr, 1,1)) 
				+ iif( len(string_agg(num, '') within group (order by pos))<3
					, string_agg(num, '') within group (order by pos) + replicate('0', 3-len(string_agg(num, '') within group (order by pos)))
					, left(string_agg(num, '') within group (order by pos), 3)
					)
		  from res
		  where num != 0 
		  group by rawStr
		  )
end




--cross chek with the internal function
select  SOUNDEX(@rawStr)



