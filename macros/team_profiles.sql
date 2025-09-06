{% macro team_profiles(team_table, players_table) %}

with players as (
    select *
    from {{ ref(players_table) }}
),

teams as (
    select *
    from {{ ref(team_table) }}
),

team_agg as (
    select
        t.team_id,
        count(p.player_id) as num_players,
        avg(p.overall) as avg_player_rating,
        sum(p.value_eur) as total_team_value
    from teams t
    left join players p
        on t.team_id = p.club_team_id
    group by 1
)

select * from team_agg
where avg_player_rating is not null

{% endmacro %}