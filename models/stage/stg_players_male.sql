{{ config(
    materialized='table',
    tags=['stage', 'players', 'male']
) }}

with source as (
    select *
    from {{ source('raw', 'male_players') }}
),
cleaned as (
    select
        player_id::int as player_id,
        fifa_version::int as fifa_version,
        fifa_update_date::date as fifa_update_date,
        lower(trim(short_name)) as short_name,
        lower(trim(long_name)) as long_name,
        lower(trim(player_positions)) as player_positions,
        overall::int as overall,
        potential::int as potential,
        value_eur::bigint as value_eur,
        wage_eur::bigint as wage_eur,
        age::int as age,
        dob::date as birth_date,
        height_cm::int as height_cm,
        weight_kg::int as weight_kg,
        league_id::int as league_id,
        lower(trim(league_name)) as league_name,
        league_level::int as league_level,
        club_team_id::int as club_team_id,
        lower(trim(club_name)) as club_name,
        lower(trim(club_position)) as club_position,
        club_jersey_number::int as club_jersey_number,
        lower(trim(club_loaned_from)) as club_loaned_from,
        club_joined_date::date as club_joined_date,
        club_contract_valid_until_year::int as club_contract_valid_until_year,
        nationality_id::int as nationality_id,
        lower(trim(nationality_name)) as nationality_name,
        nation_team_id::int as nation_team_id,
        lower(trim(nation_position)) as nation_position,
        nation_jersey_number::int as nation_jersey_number,
        lower(trim(preferred_foot)) as preferred_foot,
        weak_foot::int as weak_foot,
        skill_moves::int as skill_moves,
        international_reputation::int as international_reputation,
        lower(trim(work_rate)) as work_rate,
        lower(trim(body_type)) as body_type,
        release_clause_eur::bigint as release_clause_eur,
        lower(trim(player_tags)) as player_tags,
        lower(trim(player_traits)) as player_traits
    from source
    where player_id is not null
)

select * from cleaned

