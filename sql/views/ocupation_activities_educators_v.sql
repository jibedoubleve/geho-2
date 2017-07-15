drop view if exists ocupation_activities_educators_v;
create view ocupation_activities_educators_v as
    select ee.id
        , first_name || ' ' || ee.last_name as educator_name
        , (select group_concat(a.name, ', ')
        from activity a
        inner join educator_to_activity eta on a.id = eta.activity_id
        where eta.educator_id = ee.id) as activities
    from educator ee;