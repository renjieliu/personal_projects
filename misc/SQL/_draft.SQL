select count(*) from webTracker


select top 100 * from webTracker; 

select total_1 = count(*)  from stock;



select max([Date]) from market 
where tick = 'GOOG'



select 'A' + char(13) + 'B'

go



-- Cathay Pacific available Seat

declare @currPE date = '2023-05-23' -- first available Premium Economy
declare @currE date = '2023-05-15' -- first available Economy 
declare @bookDate date = '2023-05-02'

select 
Today = cast(GETDATE() as date)
, currPE_Availability = @currPE
, days_diff_PE =  DATEDIFF(day, GETDATE(), @currPE)
, currE_Availability = @currE
, days_diff_E = DATEDIFF(day, GETDATE(), @currE)
, bookDate = @bookDate
, projected_PE = dateadd(day, DATEDIFF(day, GETDATE(), @currPE), @bookDate)
, projected_E = dateadd(day, DATEDIFF(day, GETDATE(), @currE), @bookDate)





select '*'
waitfor delay '00:00:00.500'
select '@'
waitfor delay '00:00:00.100'
go 2
 


