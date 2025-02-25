{{config(materialized = 'incremental', unique_key=['OrderID','LineNo'], alias = 'stage_orderdetails')}}

select rod.*,ro.OrderDate
from
{{source('qwt_raw','raw_orders')}} ro
join {{source('qwt_raw','raw_orderdetails')}} rod on ro.OrderID=rod.OrderID

{% if is_incremental() %}

where ro.OrderDate > (select max(OrderDate) from {{this}})

{% endif %}