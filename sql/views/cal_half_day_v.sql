drop view if exists cal_half_day_v;
create view cal_half_day_v as
    with recursive
    cnt(is_morning) as (
        select 0
        union all
        select is_morning+1 from cnt
        limit 2
    )
    select is_morning from cnt;