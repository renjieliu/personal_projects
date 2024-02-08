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


truncate table t_1

insert into t_1 select 1


drop function if exists ins;

create OR REPLACE FUNCTION ins(input TEXT) RETURNS TEXT 
as $$ 
    return ''.join(sorted(list(input), reverse=1))
$$ LANGUAGE plpython3u
; 

select ins('hello world')


CREATE EXTENSION mysql_fdw;

CREATE SERVER mysql_renjie_rocks
FOREIGN DATA WRAPPER mysql_fdw
OPTIONS (host 'ipipip', port 'portno');


create USER MAPPING FOR boroger -- this for my current username
SERVER mysql_renjie_rocks
OPTIONS (username 'xxxxx', password 'xxxxx');


drop FOREIGN TABLE if exists mysql_wp_posts ;  

create FOREIGN TABLE mysql_wp_posts (
    ID                    decimal     , 
    post_author           decimal     , 
    post_date             text   ,    
    post_date_gmt         text   ,    
    post_content          text        , 
    post_title            text        ,   
    post_excerpt          text        ,   
    post_status           varchar(20) ,   
    comment_status        varchar(20) ,   
    ping_status           varchar(20) ,   
    post_password         varchar(20) ,   
    post_name             varchar(200),   
    to_ping               text        ,   
    pinged                text        ,   
    post_modified         text    ,   
    post_modified_gmt     text    ,   
    post_content_filtered text        , 
    post_parent           decimal     , 
    guid                  varchar(255),   
    menu_order            decimal     ,  
    post_type             varchar(20) ,   
    post_mime_type        varchar(100),   
    comment_count         decimal         
) SERVER mysql_renjie_rocks
OPTIONS (dbname 'wordpress', table_name 'wp_posts');


 

select * into wp_posts from mysql_wp_posts; 



select * from wp_posts;



-- alter table wp_posts alter column post_date type time ; 


