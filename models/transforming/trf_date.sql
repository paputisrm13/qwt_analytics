{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

{% set min_orderdate = get_minorder_date() %}
{% set max_orderdate = get_maxorder_date() %}

{{ dbt_date.get_date_dimension(min_orderdate, max_orderdate) }}