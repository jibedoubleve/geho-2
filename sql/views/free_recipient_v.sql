drop view if exists free_recipient_v;
create view free_recipient_v as
    select id                                              as recipient_id
        , first_name || ' ' || last_name                  as recipient_name
        , case when team_id is null then 0 else 1 end     as has_team
    from recipient;