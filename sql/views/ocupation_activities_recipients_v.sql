drop view if exists ocupation_activities_recipients_v;
create view ocupation_activities_recipients_v as
    select r.id
        , first_name || ' ' || r.last_name as recipient_name
        , (select group_concat(a.name, ', ')
        from activity a
        inner join recipient_to_activity eta on a.id = eta.activity_id
        where eta.recipient_id = r.id) as activities
    from recipient r;