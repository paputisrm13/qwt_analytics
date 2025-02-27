{{config(materialized = 'table', alias = 'stage_offices')}}

select 
md5(officeid) as officehashkey,
current_timestamp as load_date,
sourcefile as recordsource,
officeid
from
{{source('qwt_raw','raw_offices')}}