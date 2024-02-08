select count(*) from webTracker


select top 100 * from webTracker; 

select total_1 = count(*)  from stock_before_revise;


--select * into stock_before_revise from stock_20230407 


select max([Date]) from market 
where tick = 'GOOG'



select 'A' + char(13) + 'B'

go


<<<<<<< HEAD
=======
select * from robinhood_stock_orders
where tick = 'JD' and AveragePrice > 28 
order by cast(trade_Date as date) desc 

go 
>>>>>>> 81a1d8b8492a745196c98bb67dc16e8593d6200a

-- Cathay Pacific available Seat

declare @currPE date = '2023-05-25' -- first available Premium Economy
declare @currE date = '2023-06-02' -- first available Economy 
declare @bookDate date = '2023-07-10'

select 
Today = cast(GETDATE() as date)
, currPE_Availability = @currPE
, days_diff_PE =  DATEDIFF(day, GETDATE(), @currPE)
, currE_Availability = @currE
, days_diff_E = DATEDIFF(day, GETDATE(), @currE)
, bookDate = @bookDate
, projected_PE = dateadd(day, DATEDIFF(day, GETDATE(), @currPE), @bookDate)
, projected_E = dateadd(day, DATEDIFF(day, GETDATE(), @currE), @bookDate)



go






select '*'
waitfor delay '00:00:00.500'
select '@'
waitfor delay '00:00:00.100'
go
 





print '*'
waitfor delay '00:00:00.100'
print '@'
waitfor delay '00:00:00.100'
go 
 
print '*'
waitfor delay '00:00:00.100'
print '@'
waitfor delay '00:00:00.100'
go 


select datediff(day, '2023-04-30', '2023-10-31')

select dateadd(day, 180, '2023-04-30')

select dateadd(day, 180, GETDATE())


select back_to_us = DATEDIFF(day, '2023-06-18', GETDATE()), to_be = DATEDIFF(day, GETDATE(), '2023-10-05')

select dateadd(day, datediff(day, '2023-06-18', GETDATE()), GETDATE())



