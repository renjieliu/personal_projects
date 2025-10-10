drop table if exists Test.dbo.weather

create table weather(
location_name varchar(100)
, latitude decimal(38,8)
, longitude decimal(38, 8)
, Date_time datetime
, temperature decimal(38, 5)
, UOM varchar(10)
, comment varchar(8000)
, insert_date datetime
)
 



select cnt = count(*) from weather
where location_name	like '%chappaqua%'

delete from weather where location_name	like '%chappaqua%'






select top 200  * from weather
where location_name like '%shanghai%'
order by temperature desc , date_time desc 



select 
top 200 
local_time = DATEADD(hour, 8, Date_time)
,  * from weather
where location_name like '%shanghai%'
order by temperature desc , local_time desc 



select top 200  
local_time = DATEADD(hour, -5, Date_time)
, * from weather
where location_name like '%chappaqua%'
and Date_time >= '2025-04-27'
order by temperature , date_time desc 



create index idx_loc_temp on weather(location_name, temperature)



; with cte as
(select rn = ROW_NUMBER() over(partition by location_name, date_time order by UOM )
, * from weather
) 
select * from cte
where location_name = 'chappaqua'
and rn = 2 
order by location_name, Date_time 


; with cte as
(select rn = ROW_NUMBER() over(partition by location_name, date_time order by UOM )
, * from weather
) 
delete from cte
where rn = 2 
 

select * into weather_20251010_1558 from weather 

 