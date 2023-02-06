-- T-SQL

-- Find all the strobogrammatic numbers from @low to @high
declare @low bigint = 1
declare @high bigint = 1000000;

;with r as (
select * from (values(1), (2)) t (id)
), 
r1 as 
(select rn = ROW_NUMBER() over(order by (select null)) from r, r r1)
, r2 as
(select rn = ROW_NUMBER() over(order by (select null)) from r1, r1 rr)
, r3 as
(select rn = ROW_NUMBER() over(order by (select null)) from r2, r2 rrr)
, r4 as
(select rn = ROW_NUMBER() over(order by (select null)) from r3, r3 rrrr)
, r5 as
(select rn = ROW_NUMBER() over(order by (select null)) from r4, r4 a ) --, r4 b , r4 c)
, r6 as (
select 
top (select @high - @low+1 )
rn = rn + @low-1 from r5
)
select * from r6 
where replace(replace(replace(cast(rn as varchar(100)), '6', '+'), '9', '6') , '+', '9') = reverse(cast(rn as varchar)) --replace 6 to 9, and 9 to 6
and cast(rn as varchar) not like '%[23457]%' -- there should not any 2, 3, 4, 5, 7 in the number

-- a = reverse(a) after replacement, for checking if the number is strobogrammatic






