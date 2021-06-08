select
    county,
    party,
    sum(votes) as total_votes
from dev.incremental_and_shapshot_test.governors_county_candidate
group by 1, 2