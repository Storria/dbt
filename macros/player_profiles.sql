{% macro player_profiles(source_table) %}

select
    player_id,
    short_name,
    gender,
    age,
    overall,
    potential,
    player_positions,

    -- Age group
    case
        when age < 21 then 'U21'
        when age between 21 and 28 then 'Prime'
        else 'Veteran'
    end as age_group,

    -- Role group
    case
        when split_part(player_positions, ',', 1) ilike '%b%' then 'Defender'
        when split_part(player_positions, ',', 1) ilike '%m%' then 'Midfielder'
        when split_part(player_positions, ',', 1) ilike '%w%' then 'Forward'
        when split_part(player_positions, ',', 1) = 'GK' then 'Goalkeeper'
        else 'Other'
    end as role


from {{ ref(source_table) }}

{% endmacro %}