; with a as (select id = 'Hello World')
, b as (select * from (values ('H'), ('e'), ('w')) as t(id) )
, c as (
select id = cast(id as varchar(max)) , rt = id from a
union all
select replace(c.id, b.id, ''), rt
from c inner join b
on c.id like '%'+ b.id + '%'
)
select distinct id from c where len(id) = (
select min(len(id)) from c
group by rt
)

