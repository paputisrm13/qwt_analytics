{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}
 
select
GET(XMLGET(supplierssinfo,'supplierID'),'$') as supplierID,
GET(XMLGET(supplierssinfo,'CompanyName'),'$')::varchar as CompanyName,
GET(XMLGET(supplierssinfo,'ContactName'),'$')::varchar as ContactName,
GET(XMLGET(supplierssinfo,'Address'),'$')::varchar as Address,
GET(XMLGET(supplierssinfo,'City'),'$')::varchar as City,
GET(XMLGET(supplierssinfo,'PostalCode'),'$')::varchar as PostalCode,
GET(XMLGET(supplierssinfo,'Country'),'$')::varchar as Country,
GET(XMLGET(supplierssinfo,'Phone'),'$')::varchar as Phone,
GET(XMLGET(supplierssinfo,'Fax'),'$')::varchar as Fax
from
{{ref("stg_suppliers")}}