{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}
 
with recursive managers
     
      (indent, officeid, employee_id, manager_id, employee_title, manager_title)
    as
      (
 
        -- Anchor Clause
        select '*' as indent, office, empid, IFF(reportsto is null, empid, reportsto),
        title as employee_title, title as manager_title from {{ref('stg_employees')}}
          where title = 'President'
 
        union all
 
        -- Recursive Clause
        select
            indent || ' *' as indent, emp.office, emp.empid, emp.reportsto, emp.title,
            mgr.employee_title
          from {{ref('stg_employees')}} as emp inner join managers as mgr
            on emp.reportsto = mgr.employee_id
      ),
 
      offices (officeid, officecity, officecountry)
      as
      (
      select officeid, officecity, officecountry from {{ref('stg_office')}}
      )
 
  -- This is the "main select".
  select managers.indent, managers.employee_id, offices.officecity, offices.officecountry,
  managers.employee_title, managers.manager_id, managers.manager_title
    from managers left join offices on managers.officeid = offices.officeid