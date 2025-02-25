{{config(materialized = 'table', alias = 'stage_office')}}

select *
from
{{source('qwt_raw','raw_office')}}