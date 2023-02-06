--RL 20210928: revise the logic to be more dynamic
declare @date date = '20210109'
declare @monthDiff int = 2 -- -2:previous 2 months. 0: current month. 1 next 2 months
select 
firstDayof_monthDiff_Month = dateadd(day, -DATEPART(day, dateadd(month, @monthDiff, @date))+1,dateadd(month, @monthDiff, @date)) 
,lastdayof_monthDiff_Month = dateadd(day, -DATEPART(day, dateadd(month, @monthDiff+1, @date)), dateadd(month, @monthDiff+1, @date))



-- RL 20210928: Initial creation with SQL Server Syntax
-- declare @date date = '20200109'
-- declare @monthDiff int = 1
-- select 
-- firstDayofNMonth = dateadd(day, -DATEPART(day, dateadd(month, -1, @date))+1,dateadd(month, -1, @date)) 
-- ,lastdayofNMonth = dateadd(day, -DATEPART(day, @date), @date)
-- , firstDayofCurrMonth = dateadd(day, -DATEPART(day, @date)+1, @date)
-- , lastdayofCurrMonth = dateadd(day, -DATEPART(day, dateadd(month, 1, @date)),dateadd(month, 1, @date)) 
-- , firstDayofNxtMonth = dateadd(day, -datepart(day, dateadd(month, 1, @date))+1, dateadd(month, 1, @date))
-- , lastdayofNxtMonth = dateadd(day, -datepart(day, dateadd(month, 2, @date)), dateadd(month, 2, @date))



