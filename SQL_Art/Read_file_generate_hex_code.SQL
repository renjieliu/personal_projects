set nocount on
;

drop table if exists #hex; 


-- insert into #test_img (img) 
SELECT hex = BulkColumn 
into #hex
FROM Openrowset( Bulk '/var/opt/mssql/data/myfiles/testingGzip.gz', Single_Blob) as hex


select * from #hex

