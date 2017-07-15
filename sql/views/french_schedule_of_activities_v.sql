/****************************************************************************************************************
 * Displays all the schedules for the activities
 */
drop view if exists french_schedule_of_activities_v;
create view french_schedule_of_activities_v as
    select week_nr 
         , week_nr || day_of_week || is_morning as schedule_code
         , date((select strftime('%Y-%m-%d', value) from db_setting where key = 'date_to_display'), '+' || sa.day_of_week || ' day') as cur_date        
         , case sa.day_of_week
            when 0 then 'Lundi'
            when 1 then 'Mardi'
            when 2 then 'Mercredi'
            when 3 then 'Jeudi'
            when 4 then 'Vendredi'
            when 5 then 'Samedi'
            when 6 then 'Dimanche'		
         end as day_name
         , case sa.is_morning
            when 0 then 'Matin'
            when 1 then 'Après-midi'
         end as is_morning
         , a.name as activity_name     
         , (-- the period is configured in table db_settings, key 'date_to_display'
            select group_concat(name, ', ')
            from (
                select first_name || ' ' || last_name as name     
                from educator
                where activity_id = a.id
                and id not in ( -- I remove the educators that are ill for this period
                    select id     
                    from absence_educator
                    where (
                        date((select strftime('%Y-%m-%d', value) from db_setting where key = 'date_to_display'), '+'|| day_of_week ||' day') >= from_date
                    and date((select strftime('%Y-%m-%d', value) from db_setting where key = 'date_to_display'), '+'|| day_of_week ||' day') <= to_date   
                    )
                )
            )
         ) as educators
         , (-- the period is configured in table db_settings, key 'date_to_display'
            select group_concat(name, ', ')
            from (
                select first_name || ' ' || last_name as name     
                from recipient
                where activity_id = a.id
                and id not in ( -- I remove the recipients that are ill for this period
                    select id     
                    from absence_recipient a 
                    where (
                        date((select strftime('%Y-%m-%d', value) from db_setting where key = 'date_to_display'), '+'|| day_of_week ||' day') >= from_date
                    and date((select strftime('%Y-%m-%d', value) from db_setting where key = 'date_to_display'), '+'|| day_of_week ||' day') <= to_date   
                    )
                )
            )
         ) as recipients     
    from activity a
    inner join scheduled_activity sa on a.id = sa.activity_id    
    where week_nr = strftime('%W', (select strftime('%Y-%m-%d', value) from db_setting where key = 'date_to_display'))
    order by week_nr, sa.day_of_week asc, sa.is_morning asc; 