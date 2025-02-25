{% macro get_line_numbers() %}
 
    {% set get_line_number_query %}
 
        SELECT distinct lineno
        from {{ref('fct_orders')}}
        order by lineno
 
    {% endset %}
 
    {% set results = run_query(get_line_number_query) %}
 
    {% if execute %}
    {# Return the first column #}
    {% set results_list = results.columns[0].values()%}
    {% else %}
    {% set results_list = [] %}
    {% endif %}
 
    {{ return(results_list) }}
 
 
   
 
{% endmacro %}

{% macro get_minorder_date() %}
 
    {% set get_minorderdate_query %}
 
        SELECT min(ORDERDATE)
        from {{ref('fct_orders')}}
         
    {% endset %}
 
    {% set results = run_query(get_minorderdate_query) %}
 
    {% if execute %}
    {# Return the first column #}
    {% set results_list = results.columns[0][0] %}
    {% else %}
    {% set results_list = [] %}
    {% endif %}
 
    {{ return(results_list) }}
 
 
   
 
{% endmacro %}

{% macro get_maxorder_date() %}
 
    {% set get_maxorderdate_query %}
 
        SELECT max(ORDERDATE)
        from {{ref('fct_orders')}}
         
    {% endset %}
 
    {% set results = run_query(get_maxorderdate_query) %}
 
    {% if execute %}
    {# Return the first column #}
    {% set results_list = results.columns[0][0] %}
    {% else %}
    {% set results_list = [] %}
    {% endif %}
 
    {{ return(results_list) }}
 
 
   
 
{% endmacro %}