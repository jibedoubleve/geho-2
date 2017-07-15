drop view if exists cal_full_calendar_v;
create view cal_full_calendar_v as
    select w.week || d."day" || m.is_morning as schedule_code  
        , w.week      as week_nr
        , d."day"      as day_nr
        , m.is_morning as is_morning_val        
        , case d."day"
            when 0 then 'Lundi'
            when 1 then 'Mardi'
            when 2 then 'Mercredi'
            when 3 then 'Jeudi'
            when 4 then 'Vendredi'
            when 5 then 'Samedi'
            when 6 then 'Dimanche'		
        end as day_name
        , case m.is_morning
            when 1 then 'Matin'
            when 0 then 'Après-midi'
        end as is_morning
    from cal_day_in_week_v          d
    cross join cal_weeks_in_year_v  w
    cross join cal_half_day_v       m
    order by w.week       asc
           , d."day"      asc
           , m.is_morning desc;