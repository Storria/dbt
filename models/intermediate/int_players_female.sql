{{ config(materialized='table', tags=['int', 'players', 'female']) }}

{{ players('stg_players_female', 'female') }}