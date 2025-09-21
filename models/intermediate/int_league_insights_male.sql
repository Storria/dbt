{{ config(materialized='table', tags=['int', 'league', 'male']) }}

{{ league_insights('int_team_profiles_male', 'int_players_male') }}