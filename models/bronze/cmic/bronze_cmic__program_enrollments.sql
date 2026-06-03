{{ config(materialized='view') }}

with program_enrollments as 
    (
    select 
        *
    from {{ source('cmic', 'member_program_enrollment') }} 
    )

select
    *
from program_enrollments