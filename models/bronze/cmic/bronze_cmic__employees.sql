{{ config(materialized='view') }}

with raw_employees as 
    (
    select 
        *
    from {{ source('cmic', 'hr_employee_info_master') }} 
    )

select
    *
from raw_employees