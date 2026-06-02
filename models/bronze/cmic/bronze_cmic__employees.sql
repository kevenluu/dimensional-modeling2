{{ config(materialized='view') }}

with raw_employees as 
    (
    select 
        *
    from {{ source('CMiC', 'EMPLOYEES') }} 
    )

select
    *
from raw_employees