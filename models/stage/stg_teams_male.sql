{{ config(
    materialized='table',
    tags=['stage', 'teams', 'male']
) }}

with source as (
    select *
    from {{ source('raw', 'male_teams') }}
),
cleaned as (
    select
        team_id::int as team_id,
        lower(trim(team_name)) as team_name,
        lower(trim(team_url)) as team_url,
        league_id::int as league_id,
        lower(trim(league_name)) as league_name,
        league_level::int as league_level,
        nationality_id::int as nationality_id,
        lower(trim(nationality_name)) as nationality_name,
        overall::int as overall,
        attack::int as attack,
        midfield::int as midfield,
        defence::int as defence,
        coach_id::int as coach_id,
        home_stadium::text as home_stadium,
        rival_team::text as rival_team,
        international_prestige::int as international_prestige,
        domestic_prestige::int as domestic_prestige,
        transfer_budget_eur::numeric as transfer_budget_eur,
        club_worth_eur::numeric as club_worth_eur,
        starting_xi_average_age::numeric as starting_xi_average_age,
        whole_team_average_age::numeric as whole_team_average_age
    from source
    where team_id is not null
)
select * from cleaned
