{% macro league_insights(team_profiles_table, players_table) %}

with teams as (
    select *
    from {{ ref(team_profiles_table) }}
),

players as (
    select *
    from {{ ref(players_table) }}
),

league_agg as (
    select
        p.league_id,
        p.league_name,
        avg(t.avg_player_rating) as avg_league_rating,
        bool_or(p.age <= 23 and p.potential > 85) as has_young_talent
    from teams t
    join players p
        on t.team_id = p.club_team_id
    group by p.league_id, p.league_name
)

select * from league_agg

{% endmacro %}