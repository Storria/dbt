{{ config(materialized='table', tags=['int', 'teams', 'male']) }}

{{ team_profiles('stg_teams_male', 'int_players_male') }}
