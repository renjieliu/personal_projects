-- This script is to find the people followed the most by people you follow, but not followed by you.
-- If tie , get the smallest user id.

drop table if exists follow

create table follow(id int, f int)

insert into follow 
select * from (values (1,2),
(1,3),
(1,4),
(2,3),
(2,4),
(2,5),
(2,6),
(2,7),
(3,1),
(3,2),
(3,5),
(3,7),
(3,8),
(4,1),
(4,2),
(5,6),
(7,8),
(6,1),
(8,1)) t(id, tt)


; 

with base as ( -- find all the people followed by people you follow
select 
er_id = er.id
, ee_f = ee.f
, cnt = count(distinct ee.id)
from 
follow er left outer join follow ee on er.f = ee.id
group by er.id, ee.f
)
, new_follower as ( -- from base, minus the people you follow and yourself
select er_id, ee_f from base  
except 
select id, f from follow
except 
select id, id from follow
) , rpt as ( -- find the one followed by the most, take the smallest id if tie
select
new_follower.*
, base.cnt 
, rn = ROW_NUMBER() over(partition by new_follower.er_id order by base.cnt desc, base.ee_f)
from base inner join new_follower 
on base.er_id = new_follower.er_id and base.ee_f = new_follower.ee_f
)
select 
er_id
, ee_f
from rpt where rn = 1 
;


drop table if exists follow

;

