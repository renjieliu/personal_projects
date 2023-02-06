-- using column sequence to find which column is truncated, as column name could be different b/w src and tgt.. 
; with tgt as 
(
select * from tempdb.sys.all_columns where [object_id] = OBJECT_ID('tempdb..#tgt')
)
, src as 
(
select * from tempdb.sys.all_columns where [object_id] = OBJECT_ID('tempdb..#src')
)
select 
tgt_columnName = tgt.name
, tgtLength = tgt.max_length
, tgtPrecision = tgt.precision
, src_columnName = src.name
, srcLength = src.max_length 
, srcPrecision = src.precision
from tgt left outer join src
on tgt.column_id = src.column_id
where src.max_length is null or src.max_length > isnull(tgt.max_length, 0)