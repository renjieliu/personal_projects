insert into t_1
select * from t_1 

select count(*) from t_1 

CREATE EXTENSION plpython3u;

; 

drop function fib ; 

CREATE or replace FUNCTION fib(n int) RETURNS DECIMAL
AS $$
    if n < 0:
        return -1
    elif n in (1, 2):
        return 1
    else:
        a = 1 
        b = 1 
        for _ in range(3, n+1):
            c = a+b
            a = b
            b = c
        return c
$$ LANGUAGE plpython3u 
;
 
select fib(1000) ; 



CREATE EXTENSION IF NOT EXISTS tds_fdw;

 
create SERVER sqlserver_renjie_rocks
FOREIGN DATA WRAPPER tds_fdw
OPTIONS (servername 'xxxxxxxx', port '1433', database 'Test');


ALTER SERVER sqlserver_renjie_rocks
OPTIONS (SET servername 'xxx', SET port '1434') ;

CREATE USER MAPPING FOR boroger
SERVER sqlserver_renjie_rocks
OPTIONS (username 'xxxxx', password 'xxxx');



drop FOREIGN TABLE if exists sqlserver_stocks; 


CREATE FOREIGN TABLE sqlserver_stocks (
	tick text,
	stock_name text,
	AveragePrice text,
	Qty text
	-- trade_Type text,
	-- Side text,
	-- Fees float,
	-- trade_State text,
	-- trade_Date text,
	-- trade_Time text  ,
	-- insert_time text 
) SERVER sqlserver_renjie_rocks 
OPTIONS (query 'SELECT * from table', row_estimate_method 'showplan_all');



select * from sqlserver_stocks
