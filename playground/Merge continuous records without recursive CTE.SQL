

create table student_location
(

  StudentID int,
  StudentName  varchar(20),
  Location varchar(10),
  FromDate date,
  ToDate date
)


insert into student_location values(1, 'Tom','Paris', '2020-03-01', '2020-03-07')
insert into student_location values(1, 'Tom','Paris', '2020-03-08', '2020-03-09')
insert into student_location values(1, 'Tom','New York', '2020-03-10', '2020-03-12')
insert into student_location values(1, 'Tom','New York', '2020-03-13', '2020-03-15')
insert into student_location values(2, 'Betty','London', '2020-03-01', '2020-05-31')
insert into student_location values(3, 'Steve','Rome', '2020-02-13', '2020-03-12')
insert into student_location values(3, 'Steve','Rome', '2020-03-13', '2020-03-15')
insert into student_location values(3, 'Steve','Rome', '2020-03-16', '2020-03-18')
insert into student_location values(3, 'Steve','New York', '2020-03-19', '2020-03-21')
insert into student_location values(3, 'Steve','Rome', '2020-03-22', '2020-03-23')
insert into student_location values(3, 'Steve','Rome', '2020-03-24', '2020-04-23')




--1. find all the periods can be connected with one another
;with canMerge as (
select
studentId
, studentName
, location
, FromDate
, ToDate
, diff = datediff(day, fromdate, todate)+1
from student_location s1
where exists -- can find a following record
(select * from student_location s2 where s2.StudentID = s1.StudentID  and s1.location = s2.location 
 and dateadd(day, 1, s1.ToDate) = s2.FromDate
)
or  -- can find a previous record
exists (select * from student_location s3 where s3.StudentID = s1.StudentID and s1.location = s3.location
 and dateadd(day, 1, s3.ToDate) = s1.FromDate)
)

--2. The ones can be merged should have continuous dates, therefore,
--   Days between the fromDate of the first period, and the toDate of the last period, should be the same as the sum of datediff of each period
, main as (
select 
c1.studentid
,c1.studentName
,c1.location
,c1.FromDate
,c2.ToDate
,diff_from_to = datediff(day, c1.fromDate, c2.toDate)+1
,sum_of_days_in_between = (select sum(diff) from canMerge c where c.StudentID = c1.StudentId and c.ToDate between c1.FromDate and c2.ToDate)
from canMerge c1 
inner join canMerge c2 
on c1.studentId = c2.studentId
and c2.location = c1.location 
and c2.fromDate > c1.FromDate -- get all the following period
group by c1.studentid, c1.studentName,c1.location, c1.FromDate, c2.ToDate
)
,temp as (
select StudentID , StudentName, Location, FromDate, ToDate = max(ToDate) 
from main
where diff_from_to = sum_of_days_in_between
group by  StudentID , StudentName, Location ,FromDate
)
select StudentID , StudentName, Location ,FromDate = min(FromDate), ToDate from temp
group by StudentID , StudentName, Location ,ToDate

union all  --add the ones cannot be merged with other periods

select * from student_location s1
where 
not exists
(select * from student_location s2 where s2.StudentID = s1.StudentID and dateadd(day, 1, s1.ToDate) = s2.FromDate
 and s1.location = s2.location 
)
and 
not exists
(select * from student_location s3 where s3.StudentID = s1.StudentID and dateadd(day, 1, s3.ToDate) = s1.FromDate
 and s1.location = s3.location 
)
order by 1, FromDate



