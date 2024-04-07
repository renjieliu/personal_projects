-- Luhn to verify the credit card number 

-- 1. split the card number 
with base as 
(
	select curr = '',  rem = '1111111111111111', id = 0 
	union all
	select left(rem, 1), right(rem, len(rem)-1), id + 1 from base
	where rem > ''
)
, A as ( -- get the card number location from right to left
select 
right_to_left = row_number() over(order by id desc)
, * 
from base
)
, B as ( -- from right to left, if at even position then double the number, if doubled number is > 9, minus 9. 
select 
doubled = case when id = 0 then 0 
			   else iif(right_to_left % 2 = 0, iif( curr*2 > 9, curr*2-9, curr*2 ), curr)
		  end 
, *
from A 
)  -- if the original length is 16 and total sum can be divided by 10, then valid 
select
	result = case when sum(doubled) % 10 = 0 and 16 = (select len(rem) from B where id = 0 ) then 1 
				  else 0
			 end
from B






