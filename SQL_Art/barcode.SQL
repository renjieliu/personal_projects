-- Below is to generate the UPC-A barcode 



drop table if exists #code_mapping 


select digit = '0' , pattern = '0001101' , comment = 'Left pattern for "0"' 
into #code_mapping
 union all
select digit = '1' , pattern = '0011001' , comment = 'Left pattern for "1"' union all
select digit = '2' , pattern = '0010011' , comment = 'Left pattern for "2"' union all
select digit = '3' , pattern = '0111101' , comment = 'Left pattern for "3"' union all
select digit = '4' , pattern = '0100011' , comment = 'Left pattern for "4"' union all
select digit = '5' , pattern = '0110001' , comment = 'Left pattern for "5"' union all
select digit = '6' , pattern = '0101111' , comment = 'Left pattern for "6"' union all
select digit = '7' , pattern = '0111011' , comment = 'Left pattern for "7"' union all
select digit = '8' , pattern = '0110111' , comment = 'Left pattern for "8"' union all
select digit = '9' , pattern = '0001011' , comment = 'Left pattern for "9"' union all
select digit = '0' , pattern = '1110010' , comment = 'Right pattern for "0"' union all
select digit = '1' , pattern = '1100110' , comment = 'Right pattern for "1"' union all
select digit = '2' , pattern = '1101100' , comment = 'Right pattern for "2"' union all
select digit = '3' , pattern = '1000010' , comment = 'Right pattern for "3"' union all
select digit = '4' , pattern = '1011100' , comment = 'Right pattern for "4"' union all
select digit = '5' , pattern = '1001110' , comment = 'Right pattern for "5"' union all
select digit = '6' , pattern = '1010000' , comment = 'Right pattern for "6"' union all
select digit = '7' , pattern = '1000100' , comment = 'Right pattern for "7"' union all
select digit = '8' , pattern = '1001000' , comment = 'Right pattern for "8"' union all
select digit = '9' , pattern = '1110100' , comment = 'Right pattern for "9"' 



-- select * from #code_mapping 

 
-- drop table if exists #left_side 
-- drop table if exists #right_side 


-- select digit = cast(digit as int), pattern, comment into #left_side from #code_mapping where comment like '%left%'
-- select digit = cast(digit as int), pattern, comment into #right_side from #code_mapping where comment like '%left%'

-- select * from #left_side
-- select * from #right_side 


drop table if exists #upc

select upc = '03600029145' into #upc

drop table if exists #brk

; with cte as (
select 
id = 1
, curr = cast(left(upc, 1) as int)
, code = cm.pattern
, rem = right(upc, len(upc) - 1 ) 
from #upc u left outer join #code_mapping cm on left(upc, 1) = cm.digit and cm.comment like '%left%'

union all 

select 
id + 1 
, curr =cast( left(rem, 1 ) as int)
, code = cm.pattern
, rem = right(rem, len(rem) - 1 ) 
from cte c
inner join #code_mapping cm on  1 = case when id + 1 <= 6 and comment like '%left%' and c.curr = cm.digit then 1 
                                         when id + 1 > 6 and comment like '%right%' and c.curr = cm.digit then 1
                                         else 0 
                                    end

where c.id <= 10 
) 
select * into #brk from cte
order by 1 
OPTION(maxrecursion 0)


-- compute the final number

drop table if exists #final_digit_sum

select
final = (select 3*sum(curr) from #brk where id % 2 = 1 )
        + 
        (select sum(curr) from #brk where id % 2 = 0 )
into #final_digit_sum


-- concatenate the final number with the upc numbers

drop table if exists #final

; with final_number as (
select -- round up to the nearest 10
n = 10 + 10 * (final /10) - final
from #final_digit_sum
)
, res as (
select id, curr, code from #brk -- this is the first 11 numbers
union all 
select 12, n, cm.pattern 
from final_number fn inner join #code_mapping cm 
on fn.n= cm.digit and cm.comment like '%right%'
)
, merged as (
select og =  STRING_AGG(code, '') within group (order by id)
from res
)
, with_guards as 
(

 select total = '101' -- left guard
                + left(og, 42) 
                + '01010' -- center guard 
                + right(og, 42)
                + '101' -- right guard 
  from merged

)
, cte as 
(
    select id = 1, curr = left(total, 1), rem = right(total, len(total)- 1) from with_guards
    union all 
    select id + 1, curr = left(rem, 1), rem = right(rem, len(rem)- 1) from cte
    where len(rem) >= 1
)   
select * into #final from cte 
order by id 
OPTION(maxrecursion 0 )


drop table if exists #display

; with cte as 
(
select 
n = 1 
, indent = REPLICATE(' ', 100)
, barcode = 
	REPLACE(
		REPLACE(
			STRING_AGG(curr, '') within group(order by id) 
			, '1', nchar(9608) )
			, '0', ' ')
from #final 

union all 

select n + 1
, indent
, barcode from cte 
where n <= 10
)
select indent, barcode into #display from cte 
option(maxrecursion 0)


select * from #display

--  TODO - Below is to generate code 128 type of barcode 

