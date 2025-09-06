{{ config(materialized='table', tags=['int', 'league', 'female']) }}

{{ league_insights('int_team_profiles_female', 'int_players_female') }}