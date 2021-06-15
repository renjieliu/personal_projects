--3885182 
select count(1) from bike_coursera 

select top 100 * from bike_coursera 
order by 1 

select distinct start_station_name , round(start_lat,3), round(start_lng,3) from bike_coursera 



select member_casual , rideable_type , duration = avg(DATEDIFF(second, started_at , ended_at)+1.0) from bike_coursera 
group by member_casual , rideable_type
order by 1, 2

 
select 
member_casual
, rideable_type
, rides = count(*)
, avgDuration = avg(DATEDIFF(second, started_at , ended_at)+1.0)
, totalDuration = sum(DATEDIFF(second, started_at , ended_at)+1.0) from bike_coursera 
group by member_casual , rideable_type
order by 1, 2



