{% test team_avg_rating_range(model, column_name) %}
SELECT *
FROM {{ model }}
WHERE avg_player_rating < 40 OR avg_player_rating > 100
{% endtest %}