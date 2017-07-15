drop view if exists free_educator_v;
create view free_educator_v as
    select id                                             as educator_id
        , first_name || ' ' || last_name                  as educator_name
        , is_trainee                                      as is_trainee
        , case when team_id is null then 0 else 1 end     as has_team
    from educator;