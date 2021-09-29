--RL 20210928: SQL Server Syntax

declare @date date = '20200109'
select 
firstDayofpreMonth = dateadd(day, -DATEPART(day, dateadd(month, -1, @date))+1,dateadd(month, -1, @date)) 
,lastdayofPreMonth = dateadd(day, -DATEPART(day, @date), @date)
, firstDayofcurrMonth = dateadd(day, -DATEPART(day, @date)+1, @date)
, lastdayofcurrMonth = dateadd(day, -DATEPART(day, dateadd(month, 1, @date)),dateadd(month, 1, @date)) 
, firstDayofNxtMonth = dateadd(day, -datepart(day, dateadd(month, 1, @date))+1, dateadd(month, 1, @date))
, lastdayofNxtMonth = dateadd(day, -datepart(day, dateadd(month, 2, @date)), dateadd(month, 2, @date))

