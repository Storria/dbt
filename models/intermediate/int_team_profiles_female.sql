{{ config(materialized='table', tags=['int', 'teams', 'female']) }}

{{ team_profiles('stg_teams_female', 'int_players_female') }}
