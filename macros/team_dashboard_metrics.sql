{% macro team_dashboard_metrics(team_table, players_table) %}

select
    t.team_id,
    p.gender,
    count(p.player_id) as total_players,
    t.avg_player_rating,
    t.total_team_value,
    max(p.overall) as best_player_rating,
    avg(case when p.overall > p.potential - 5 then 1 else 0 end) as overperformers_ratio
from {{ ref(team_table) }} t
join {{ ref(players_table) }} p on t.team_id = p.club_team_id
group by t.team_id, p.gender, t.avg_player_rating, t.total_team_value

{% endmacro %}