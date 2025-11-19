DECLARE @trace_id int;
DECLARE @maxfilesize bigint;
DECLARE @database nvarchar(256);
DECLARE @user nvarchar(512);
DECLARE @time bigint;
SET @maxfilesize = 5;
SET @database = 'db_vendas';
SET @user = 'sa';
SET @time = 15000

EXEC sp_trace_create @trace_id OUTPUT, 0, N'C:\temp\MEUTRACE2', @maxfilesize, NULL;

EXEC sp_trace_create @trace_id OUTPUT, 0, N'C:\temp\MEUTRACE2', @maxfilesize, NULL;

EXEC sp_trace_setevent @trace_id, 12, 1, 1;

EXEC sp_trace_setfilter @trace_id, 35, 0, 0, @database;

EXEC sp_trace_setfilter @trace_id, 11, 0, 0, @user;

EXEC sp_trace_setfilter @trace_id, 13, 0, 2, @time;

EXEC sp_trace_setstatus @trace_id, 1;

EXEC sp_trace_setstatus @traceid = 3, @status = 0
EXEC sp_trace_setstatus @traceid = 3, @status = 2