{{ config(materialized='table') }}

with dim_employees as 
    (
    select
        member_id,
        title,
        first_name,
        last_name,
        email,
        date_of_birth,
        country,
        province
    from {{ ref('silver_employees_cleaned') }}
    )

select
    *
from dim_employees