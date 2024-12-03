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



select * from #code_mapping 

 
drop table if exists #left_side 
drop table if exists #right_side 


select digit = cast(digit as int), pattern, comment into #left_side from #code_mapping where comment like '%left%'
select digit = cast(digit as int), pattern, comment into #right_side from #code_mapping where comment like '%left%'

select * from #left_side
select * from #right_side 







--  TODO - Below is to generate code 128 type of barcode 

