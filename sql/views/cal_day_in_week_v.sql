drop view if exists cal_day_in_week_v;
create view cal_day_in_week_v as
    with recursive
    cnt(day) as (
        select 0
        union all
        select day+1 from cnt
        limit 7
    )
    select day from cnt;