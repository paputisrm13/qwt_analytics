{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}
 

select 
p.productid,
p.productname,
c.categoryname,
s.companyname as suppliercompany,
s.contactname as suppliercontact,
s.city as suppliercity,
s.Country as suppliercountry,
p.quantityperunit,
p.unitcost,
p.unitprice,
p.unitsinstock,
p.unitsonorder,
p.unitprice - p.unitcost as profit,
IFF(p.unitsonorder > p.unitsinstock,'Not Available','Available') as productavailability




from
{{ref('stg_products')}} as p left join {{ref('trf_suppliers')}} as s
on p.SupplierID=s.SupplierID left join
{{ref('lkp_categories')}} as c on c.categoryid=p.categoryid
