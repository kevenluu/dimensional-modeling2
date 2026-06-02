{{ config(materialized='view') }}

with cleaned_employee_names as 
    (   
    select 
        *,
        regexp_replace(regexp_replace(name, '^(Mr\\.|Mrs\\.|Dr\\.)\\s+', '', 1, 0, 'i'), '\\s+(MD|DVM|PhD|DDS|Esq\\.|Jr\\.|Sr\\.)$', '', 1, 0, 'i') as full_clean_name
    from {{ ref('bronze_cmic__employees') }}
    ),

cleaned_employees as
    (
    select
        id as member_id,
        regexp_substr(name, '^(Mr\\.|Mrs\\.|Dr\\.)', 1, 1, 'i') as title,
        split_part(full_clean_name, ' ', 1) AS first_name,
        trim(substr(full_clean_name, length(full_clean_name) - position(' ' in reverse(full_clean_name)) + 2)) as last_name,
        email,
        date_of_birth,
        split_part(province_of_residence, '-', 1) as country,
        split_part(province_of_residence, '-', 2) as province,
        created_at,
        loaded_at,
        organization_id,
        eligible_programs
    from cleaned_employee_names
    )

select
    *
from cleaned_employees