-- select * from webTracker  

declare @website varchar(max) = 'youtube'

select
visit_date
, length_in_hours_total = sum(visit_length)/3600.0 
from webTracker w1
where domain like '%' + @website + '%'
and not exists
(select * from webTracker w2 where w2.domain like '%' + @website + '%'
and w2.record_insert_date > w1.record_insert_date
and w2.visit_from = w1.visit_from)
group by visit_date 
order by 1 desc 



