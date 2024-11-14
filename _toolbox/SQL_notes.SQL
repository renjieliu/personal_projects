------------------------------------------------------------------------------------------------------------

CREATE DATABASE db_rpi
ON (Filename = '\\192.168.1.225\sandisk\db_rpi.mdf'),
   (Filename = '\\192.168.1.225\sandisk\db_rpi_log.ldf')
FOR ATTACH;

CREATE DATABASE db_rpi 
ON (NAME = N'db_rpi',Filename = '\\192.168.1.225\sandisk\db_rpi.mdf')
LOG ON 
(NAME = N'db_rpi_log', Filename = '\\192.168.1.225\sandisk\db_rpi_log.ldf')


------------------------------------------------------------------------------------------------------------
-- Check SQL history in SQL Server

SELECT  dest.text
FROM    sys.dm_exec_query_stats AS deqs
        CROSS APPLY sys.dm_exec_sql_text(deqs.sql_handle) AS dest
WHERE   deqs.last_execution_time > '5/19/2011 11:00'
        AND dest.text LIKE 'WITH%';




---- Check SQL history in SQL Server

SELECT  dest.text
FROM    sys.dm_exec_query_stats AS deqs
        CROSS APPLY sys.dm_exec_sql_text(deqs.sql_handle) AS dest
WHERE   deqs.last_execution_time > '5/19/2011 11:00'
        AND dest.text LIKE 'WITH%';


---------------------------------------clear transaction log --------------------------------------
--GO
ALTER DATABASE DBNAME SET RECOVERY SIMPLE
--GO
DBCC SHRINKFILE ( DBNAME, 1)
--GO
ALTER DATABASE DBNAME SET RECOVERY FULL




