{{config(materialized = 'table', alias = 'stage_suppliers')}}

select *
from
{{source('qwt_raw','raw_suppliers')}}