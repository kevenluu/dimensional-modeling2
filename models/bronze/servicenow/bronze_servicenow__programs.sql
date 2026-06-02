{{ config(materialized='view') }}

with raw_programs as 
    (
    select 
        *
    from {{ source('servicenow', 'employee_eligibility_programs') }} 
    )

select
    *
from raw_programs