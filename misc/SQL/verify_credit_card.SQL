-- Luhn to verify the credit card number 

declare @number varchar(200) = '5555 5555 5555 4444'

-- 0. formalize the number to be 16 digits 
set @number = REPLACE(@number, ' ', '')

; with prep as 
(
 select cc = case when @number like '%[^0-9]%' or len(@number) not in (15, 16) then replicate('0', 16) -- make the number all 0.
				 else @number
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
	result = iif(sum(doubled) % 10 = 0 and sum(doubled) > 0 , 1, 0)
from B






