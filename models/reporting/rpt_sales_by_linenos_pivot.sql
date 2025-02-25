{{config(materialized = 'view', schema = 'reporting_dev')}}

{% set v_linenumbers = get_line_numbers() %}

select 

orderid,

{% for linenumber in v_linenumbers -%}
sum(case when lineno = {{linenumber}} then linesalesamount end) as lineno{{linenumber}}_sales,
--sum(case when lineno=2 then linesalesamount end) as line02_sales,
--sum(case when lineno=3 then linesalesamount end) as line03_sales,


{% endfor %}

sum(linesalesamount) as total_sales 

from {{ref('fct_orders')}} 

group by orderid