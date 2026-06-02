{{ config(materialized='table') }}

with dim_programs as 
    (
    select
        program_id,
        program_name
    from {{ ref('bronze_servicenow__programs') }}
    )

select
    *
from dim_programs