{{ config(materialized='table') }}


with fact_program_enrollment as
    (
    select
        *
    from {{ ref('bronze_cmic__program_enrollments') }}
    )

select
    *
from fact_program_enrollment