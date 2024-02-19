; with pos as ( -- assign number for each grid
	select id = 0
	union all 
	select id+1 
	from pos 
	where id < 63
) 
, solution as 
(select 
	board = cast(replicate('-', 64) as varchar(max)) -- form the base board
	, finalID = -1 -- last id to be placed on the board 
	, number = 0  -- number of queen 
 union all 
	select 
	stuff(board, p.id+1 , 1, '#') --  id starts from 0, add 1 to start from 1st location in the string 
	, p.id
	, number+1
	from solution s , pos p 
	where 
	p.id > s.finalID  -- only check the ones after current id, to speed up the search
	and s.number < 8  
	and not exists (
		select * from pos p1 
		where
		SUBSTRING(board, p1.id+1, 1) = '#' -- current id is not used 
		and 
		( p1.id / 8 = p.id / 8 -- same row 
			or p1.id % 8 = p.id % 8  -- same col
			or p1.id / 8 + p1.id % 8 = p.id / 8 + p.id % 8  -- go right upper diag
			or p1.id / 8 - p1.id % 8 = p.id / 8 - p.id % 8  -- go left lower diag
			)
 )
 
) 
select * from solution 
where number = 8 







