drop view if exists cal_weeks_in_year_v;
create view cal_weeks_in_year_v as
    with recursive
    cnt(week) as (
        select 1
        union all
        select week+1 from cnt
        limit 52
    )
    select week from cnt;