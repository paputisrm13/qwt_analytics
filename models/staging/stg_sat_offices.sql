{{config(materialized = 'table', alias = 'stage_sat_offices')}}

select 
ho.officehashkey,
current_timestamp as load_date,
ho.recordsource,
ro.OfficeAddress,
ro.OfficePostalCode,
ro.OfficeCity,
ro.OfficeStateProvince,
ro.OfficePhone,
ro.OfficeFax,
ro.OfficeCountry
from
{{ref('stg_hub_offices')}} as ho
inner join {{source("qwt_raw",'raw_offices')}} ro
on ho.officeid = ro.officeid