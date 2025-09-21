{{ config(
    materialized='table',
    tags=['mart', 'teams']
) }}

with male as (
    {{ team_dashboard_metrics('int_team_profiles_male', 'int_players_male') }}
),

female as (
    {{ team_dashboard_metrics('int_team_profiles_female', 'int_players_female') }}
)

select * from male
union all
select * from female