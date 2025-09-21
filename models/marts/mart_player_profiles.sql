{{ config(
    materialized='table',
    tags=['mart', 'players']
) }}

with male as (
    {{ player_profiles('int_players_male') }}
),

female as (
    {{ player_profiles('int_players_female') }}
)

select * from male
union all
select * from female