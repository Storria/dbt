{% macro players(source_table, gender) %}

with base as (
    select *
    from {{ ref(source_table) }}
    where club_team_id is not null
),

validated as (
    select
        *,
        '{{ gender }}' as gender
    from base
),

deduplicated as (
    select *
    from (
        select *,
            row_number() over (partition by player_id order by fifa_update_date desc) as rn
        from validated
    ) t
    where rn = 1
)

select * from deduplicated

{% endmacro %}