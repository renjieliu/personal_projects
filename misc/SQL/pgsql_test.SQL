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


