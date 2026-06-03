{{ config(materialized='table') }}

with date_spine as 
    (
    {{
        dbt_utils.date_spine(
            datepart="day",
            start_date="cast('2010-01-01' as date)",
            end_date="cast('2035-12-31' as date)"
        )
    }}
    ),

date_spine_derived as
    (
    select
        to_number(to_char(date_day, 'YYYYMMDD')) as date_id,
        date_day as date,
        year(date_day) as year,
        quarter(date_day) as quarter,
        month(date_day) as month,
        monthname(date_day) as month_name,
        dayofweek(date_day) as day_of_week,
        dayname(date_day) as day_name
    from date_spine
    )

select 
    *
from date_spine_derived