with combined as (
    select player_id from {{ ref('int_players_male') }}
    union all
    select player_id from {{ ref('int_players_female') }}
)
select player_id
from combined
group by player_id
having count(*) > 1