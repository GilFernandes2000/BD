create table mytemp (
	rid bigint IDENTITY (1, 1) not null,
	at1 int null,
	at2 int null,
	at3 int null,
	lixo varchar(100) null
);

create index at1_pk on mytemp(at1) 
create index at2_pk on mytemp(at2)
create index at3_pk on mytemp(at3)
create index lixo_pk on mytemp(lixo)

-- drop table mytemp
-- drop index mytemp(at1)
-- a)
-- create clustered index IndRid on mytemp(rid) with (fillfactor = 90);

-- b)

-- record the start time
declare @start_time datetime, @end_time datetime;
set @start_time = getdate()
print @start_time

--generate random records
declare @val as int = 1;
declare @nelem as int = 50000;

set nocount on

while @val <= @nelem
begin
	dbcc dropcleanbuffers;
	insert mytemp (/*rid, */at1, at2, at3, lixo)
	select /*cast((rand()*@nelem*40000) as int),*/ cast((rand()*@nelem) as int),
		   cast((rand()*@nelem) as int), cast((rand()*@nelem) as int),
		   'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo'
	set @val = @val + 1;
end
print 'Inserted ' + str(@nelem) + ' total records'

--duration
set @end_time = getdate();
print 'Milliseconds used: ' + convert(varchar(20), datediff(millisecond, @start_time, @end_time));

--SELECT * FROM sys.dm_db_index_physical_stats(db_id('temp'), 
--OBJECT_ID('mytemp'), NULL, NULL, 'DETAILED');

-- Miliseconds used: 576480
-- percentagem de fragmentação dos índices -> 99,4%
-- percentagem de ocupação das páginas dos índices -> 68,6%

-- c)

-- fillfactor: 65
-- Miliseconds used: 48593

-- fillfactor: 80
-- Miliseconds used: 48133

-- fillfactor: 90
-- Miliseconds used: 48570

-- d)
-- Miliseconds used: 42923

-- e)
-- Miliseconds used(without index): 42923
-- Miliseconds used(with index): 78166