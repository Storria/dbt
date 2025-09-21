{{ config(
    materialized='table',
    tags=['stage', 'coaches', 'female']
) }}

with source as (
    select *
    from {{ source('raw', 'female_coaches') }}
),
cleaned as (
    select
        coach_id::int as coach_id,
        lower(trim(short_name)) as short_name,
        lower(trim(long_name)) as long_name,
        dob::date as birth_date,
        nationality_id::int as nationality_id,
        lower(trim(nationality_name)) as nationality_name
    from source
    where coach_id is not null
)
select * from cleaned
