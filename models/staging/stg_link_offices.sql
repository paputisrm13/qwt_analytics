{{config(materialized = 'table', alias = 'stage_link_offices')}}

select 
md5(ho.officehashkey || re.empid) as officehashkey,
current_timestamp as load_date,
ho.recordsource,
re.empid
from
{{ref('stg_hub_offices')}} as ho
inner join {{source("qwt_raw",'raw_employees')}} re
on ho.officeid = re.office