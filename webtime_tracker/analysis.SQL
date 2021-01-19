declare @website varchar(max)= 'slickdeal'

select sum(visit_length)/3600.0 from webTracker w1
where domain like '%' + @website + '%'
and not exists
(select * from webTracker w2 where w2.domain like '%' + @website + '%'
and w2.record_insert_date > w1.record_insert_date
and w2.visit_from = w1.visit_from)

