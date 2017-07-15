/****************************************************************************************************************
 * Displays all the schedules for the teams
 */
drop view if exists french_schedule_of_teams_v;
create view french_schedule_of_teams_v as
    select st.week_nr 
         , week_nr || day_of_week || is_morning as schedule_code
         , date((select strftime('%Y-%m-%d', value) from db_setting where key = 'date_to_display'), '+' || day_of_week || ' day') as cur_date          
         , case st.day_of_week
             when 0 then 'Lundi'
             when 1 then 'Mardi'
             when 2 then 'Mercredi'
             when 3 then 'Jeudi'
             when 4 then 'Vendredi'
             when 5 then 'Samedi'
             when 6 then 'Dimanche'		
        end as day_name
        , case st.is_morning
            when 0 then 'Matin'
            when 1 then 'Après-midi'
        end as is_morning
        , t.name as team_name     
        , ( -- the period is configured in table db_settings, key 'date_to_display'
            select group_concat(name, ', ')
            from (
                select first_name || ' ' || last_name name     
                from educator
                where team_id = t.id
                and id not in (-- remove educators that are ill at this time
                    select id                         
                    from absence_educator 
                    where (
                        date((select strftime('%Y-%m-%d', value) from db_setting where key = 'date_to_display'), '+'|| day_of_week ||' day') >= from_date
                    and date((select strftime('%Y-%m-%d', value) from db_setting where key = 'date_to_display'), '+'|| day_of_week ||' day') <= to_date   
                    )
                )
                and id not in (-- remove educators that are booked in an activity at this moment
                    select e.id
                    from scheduled_activity sa
                    inner join educator_to_activity e on e.activity_id = sa.activity_id
                    where sa.week_nr     = st.week_nr
                      and sa.day_of_week = st.day_of_week
                      and sa.is_morning  = st.is_morning
                )
            )
        ) as educators
        , (-- I take the recipients that are not ill in the period configured in table db_settings, key 'date_to_display'
            select group_concat(name, ', ')
            from (
                select first_name || ' ' || last_name name     
                from recipient
                where team_id = t.id
                and id not in (-- remove recipients that are ill at this time
                    select id     
                    from absence_recipient
                    where (
                        date((select strftime('%Y-%m-%d', value) from db_setting where key = 'date_to_display'), '+'|| day_of_week ||' day') >= from_date
                    and date((select strftime('%Y-%m-%d', value) from db_setting where key = 'date_to_display'), '+'|| day_of_week ||' day') <= to_date   
                    )
                )
                and id not in ( -- remove recipients that are booked in an activity at this time
                    select r.id
                    from scheduled_activity sa
                    inner join recipient_to_activity r on r.activity_id = sa.activity_id
                    where sa.week_nr     = st.week_nr
                      and sa.day_of_week = st.day_of_week
                      and sa.is_morning  = st.is_morning
                )
            )
        ) as recipients     
    from team t
    inner join scheduled_team st on t.id = st.team_id    
    where week_nr = strftime('%W', (select strftime('%Y-%m-%d', value) from db_setting where key = 'date_to_display'))    
    order by week_nr, st.day_of_week asc, st.is_morning asc;
