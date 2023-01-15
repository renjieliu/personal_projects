--Revised on 2021-06-15 by Renjie Liu
--Original Data Source: https://divvy-tripdata.s3.amazonaws.com/index.html




--3885182 
select count(1) from bike_coursera ;



select top 100 * from bike_coursera
order by 1 

select distinct start_station_name , round(start_lat,3), round(start_lng,3) from bike_coursera 


create index idx_riderType_member on bike_coursera(rideable_type, member_casual)


select member_casual , rideable_type , duration = avg(DATEDIFF(second, started_at , ended_at)+1.0) from bike_coursera 
group by member_casual , rideable_type
order by 1, 2



select 
member_casual
, rideable_type
, weekday = datepart(dw, started_at) 
, rides = count(*)
, avgDuration = avg(DATEDIFF(second, started_at , ended_at)+1.0)
, totalDuration = sum(DATEDIFF(second, started_at , ended_at)+1.0) from bike_coursera 
group by member_casual , rideable_type, datepart(dw, started_at) 
order by 1, 2



--clean up the missing start_station, with the closest start station, per Geo location

select distinct start_station_id, start_station_name, start_lat, start_lng from bike_coursera
order by 1, 2



select distinct start_station_id, start_station_name, round(start_lat,3), round(start_lng,3)
from bike_coursera where start_lat = 41.65 and start_lng = -87.55



select distinct start_station_id, count(distinct start_station_name ) from bike_coursera 
where start_station_id is not null 
group by start_station_id 
having count(distinct start_station_name) > 1 
order by 2 desc 


select * from bike_coursera 
where start_station_id = '317'
order by 2 desc 



