{{config(materialized = 'table', alias = 'stage_employees')}}

select *
from
{{source('qwt_raw','raw_employees')}}