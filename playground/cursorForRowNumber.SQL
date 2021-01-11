--using a cursor to generate the row number
declare @rid int = 0
declare ptr cursor local for select indexnumber from WC_FACTEMPLOYEE_WK order by 1 desc
declare @indexnumber varchar(max)
open ptr 
fetch next from ptr into @indexnumber
while @@FETCH_STATUS  = 0
	begin
	set @rid = @rid + 1
	insert into #temp select @rid,@indexnumber
	fetch next from ptr into @indexnumber
	end
select * from #temp
