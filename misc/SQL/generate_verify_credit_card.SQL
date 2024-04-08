--------------------------------Generate--------------------------------


declare @startingNum varchar(max) = '4'
declare @res varchar(200) = ''


; with num  as
(
	select og = cast(@startingNum as varchar(max)), id = 1 
	union all
	select og + cast(floor(10*rand(HASHBYTES('MD5', cast(newid() as varchar(max)) ))) as varchar(10) ), id + 1 from num
	where len(og) < 15
)
, total as ( -- adding the sum for the first 15 digits per Luhm algo
select 
currPos = id
, curr = case when id % 2 = 1 then iif( cast(SUBSTRING(og, id, 1) as int) * 2 >= 9 ,  2 * cast(SUBSTRING(og, id, 1) as int) - 9 , 2 * cast(SUBSTRING(og, id, 1) as int) )   
		      else cast(SUBSTRING(og, id, 1) as int)
		 end
, og
from num where id = 15 
union all
select
currPos-1
, curr + 
		case when (currPos-1) % 2 = 1 then iif( cast(SUBSTRING(og, (currPos-1), 1) as int) * 2 >= 9 ,  2 * cast(SUBSTRING(og, (currPos-1), 1) as int) - 9 , 2 * cast(SUBSTRING(og, (currPos-1), 1) as int) )   
		      else cast(SUBSTRING(og, (currPos-1), 1) as int)
		 end
, og
from total 
where currPos > 1
) 
select  @res = og + cast( iif(curr%10 = 0, 0, (10 - curr%10) ) as varchar(10)) from total -- adding the last digit to the string
where currPos = 1 -- take the final total line 

select ccNumGenerated = @res

--------------------------------Verify--------------------------------


-- Luhn to verify the credit card number 

-- 0. formalize the number to be 16 digits 
set @res = REPLACE(@res, ' ', '')

; with prep as 
(
 select cc = case when @res like '%[^0-9]%' or len(@res) not in (15, 16) then replicate('0', 16) -- make the number all 0.
				 else @res
			 end
)
-- split the card number 
,  base as 
(
	select curr = '',  rem =cc, id = 0 from prep
	union all
	select left(rem, 1), right(rem, len(rem)-1), id + 1 from base
	where rem > ''
)
, A as ( -- get the card number location from right to left
select 
right_to_left = row_number() over(order by id desc)
, * 
from base
) -- select * from A
, B as ( -- from right to left, double the number at even position, if doubled number is > 9, minus 9. 
select 
doubled = case when id = 0 then 0 
			   else iif(right_to_left % 2 = 0, iif( curr*2 > 9, curr*2-9, curr*2 ), curr)
		  end 
, *
from A 
)  -- valid if total sum can be divided by 10 and the original number is not all 0 
select
	Valid = iif(sum(doubled) % 10 = 0 and sum(doubled) > 0 , 1, 0)
from B






