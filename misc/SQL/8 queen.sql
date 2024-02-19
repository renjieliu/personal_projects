with pos as (
select 0 id 
union all 
select id + 1  from pos
where id < 63
) 
, cte as 
(
	select board = cast(replicate('-', 64) as varchar(max))
		, id = -1 , num = 0 -- base
		union all
	select substring(board, 1, p1.id)  + '#' + substring(board, p1.id+2, len(board)-p1.id+1) 
		, p1.id
		, num+1 -- iterating
	from cte, pos p1
	where num < 8 
	and p1.id > cte.id -- no need to check the i < current. speed up performance
	and not exists 
	(
		select * from pos ps
		where 
		SUBSTRING(cte.board, ps.id+1, 1) = '#' -- current one is taken
		and 
		(ps.id % 8 = p1.id % 8 -- same col
		or ps.id/8 = p1.id / 8 -- same row
		or (ps.id/8) + (ps.id % 8) = (p1.id/8) + (p1.id%8) -- right upper diag
		or (ps.id/8) - (ps.id % 8) = (p1.id/8) - (p1.id%8) -- left upper diag
		)
	)
)
select *  from cte
where num = 8



--select 23 % 8 
