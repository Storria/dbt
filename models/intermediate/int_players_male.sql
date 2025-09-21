{{ config(materialized='table', tags=['int', 'players', 'male']) }}

{{ players('stg_players_male', 'male') }}