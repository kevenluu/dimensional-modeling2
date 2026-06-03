{{ config(materialized='table') }}


with fct_program_enrollment as
    (
    select
        *
    from {{ ref('bronze_cmic__program_enrollments') }}
    )

select
    *
from fct_program_enrollment