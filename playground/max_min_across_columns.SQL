
-- Find the max / min across columns


drop table if exists #a; 

select 100 id1 , 2 id2, 3 id3, 4 id4 into #a
union all
select 300 id1 ,1 id2, 0 id3, -19 id4


--unpivot approach
; with cte as (
select rn = ROW_NUMBER() over (order by 1/0),  * from #a 
), up as 
(
 select mxID = max(measure) over (partition by rn), miID = min(measure) over (partition by rn), * from 
 (select * from cte) src 
  unpivot 
  (measure for colName in (id1, id2, id3, id4)
  ) _
)

select distinct cte.id1, cte.id2, cte.id3, cte.id4 ,mxID, miID from cte inner join up on cte.rn = up.rn 

 
-- Cross apply approach
select * from #a 
cross apply (
	select mxID = max(id), miID = min(id) from (values (id1), (id2), (id3), (id4)) v(id)
	) xa



