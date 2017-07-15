/******************************************************************************
 * DB_SETTING
 */
delete from db_setting;
insert into db_setting (key, value) values ('date_to_display', date('2017-01-02'));
/******************************************************************************
 * EDUCATOR
 */
delete from educator;
insert into educator (id, first_name, last_name, is_trainee, team_id) values (1, 'Mario' , 'Bross'    , 0, 1);
insert into educator (id, first_name, last_name, is_trainee, team_id) values (2, 'Luidgi', 'Marcli'   , 0, 1);
insert into educator (id, first_name, last_name, is_trainee, team_id) values (3, 'Marcel', 'Debel'    , 0, 1);
insert into educator (id, first_name, last_name, is_trainee, team_id) values (4, 'Lame'  , 'Entation' , 1, 2);
insert into educator (id, first_name, last_name, is_trainee) values (5, 'Jessica', 'Potempoche', 1);
insert into educator (id, first_name, last_name, is_trainee) values (6, 'Alain'  , 'Terieure'  , 0);
/******************************************************************************
 * EDUCATOR TO ACTIVITY
 */
 delete from educator_to_activity;
 insert into educator_to_activity(educator_id, activity_id) values(1, 1);
 insert into educator_to_activity(educator_id, activity_id) values(1, 2);
 insert into educator_to_activity(educator_id, activity_id) values(2, 1);
 insert into educator_to_activity(educator_id, activity_id) values(3, 1);
 insert into educator_to_activity(educator_id, activity_id) values(4, 2);
/******************************************************************************
 * RECIPIENT
 */
 delete from recipient;
insert into recipient (id, first_name, last_name, team_id) values (1, 'Robert'  , 'Dupont'      , 1);-- 1
insert into recipient (id, first_name, last_name, team_id) values (2, 'Marcel'  , 'Decourcelles', 1);-- 2
insert into recipient (id, first_name, last_name, team_id) values (3, 'Martine' , 'Alamer'      , 1);-- 2
insert into recipient (id, first_name, last_name, team_id) values (4, 'Marc'    , 'Esophie'     , 2);-- 2
insert into recipient (id, first_name, last_name, team_id) values (5, 'Tintin'  , 'Emilou'      , 2);-- 2
insert into recipient (id, first_name, last_name, team_id) values (6, 'Goldorak', 'Lerobo'      , 2);-- 1
/******************************************************************************
 * RECIPIENT TO ACTIVITY
 */
 delete from recipient_to_activity;
 insert into recipient_to_activity(recipient_id, activity_id) values(1, 1);
 insert into recipient_to_activity(recipient_id, activity_id) values(1, 2);
 insert into recipient_to_activity(recipient_id, activity_id) values(2, 2);
 insert into recipient_to_activity(recipient_id, activity_id) values(3, 2);
 insert into recipient_to_activity(recipient_id, activity_id) values(4, 2);
 insert into recipient_to_activity(recipient_id, activity_id) values(5, 2);
 insert into recipient_to_activity(recipient_id, activity_id) values(6, 1);
/******************************************************************************
 * TEAM
 */
delete from team;
insert into team (id, name) values (1, 'Groupe alpha');
insert into team (id, name) values (2, 'Groupe beta');
insert into team (id, name) values (3, 'Groupe gamma');
insert into team (id, name) values (4, 'Groupe delta');
insert into team (id, name) values (5, 'Groupe epsilon');
insert into team (id, name) values (6, 'Groupe zeta');
insert into team (id, name) values (7, 'Groupe eta');
/******************************************************************************
 * SCHEDULED TEAM
 */
 delete from scheduled_team;
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(1,1,0,1);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(1,1,1,2);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(1,1,2,1);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(1,1,3,2);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(1,1,4,1);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(1,1,5,2);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(1,0,0,1);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(1,0,1,1);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(1,0,2,1);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(1,0,3,1);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(1,0,4,1);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(1,0,5,2);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(1,1,1,2);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(2,1,2,2);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(2,1,3,2);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(2,1,4,2);
 insert into scheduled_team (week_nr, is_morning, day_of_week, team_id) values(2,1,5,2);
 
/******************************************************************************
 * ACTIVITY
 */
delete from activity;
insert into activity (id, name) values (1, 'Velo 1');
insert into activity (id, name) values (2, 'Velo 2');
insert into activity (id, name) values (3, 'Course 1');
insert into activity (id, name) values (4, 'Course 2');
insert into activity (id, name) values (5, 'Tennis 1');
insert into activity (id, name) values (6, 'Tennis 2');
insert into activity (id, name) values (7, 'Piscine');
/******************************************************************************
 * SCHEDULED ACTIVITY
 */
 delete from scheduled_activity;
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(1,0,0,1);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(1,1,0,2);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(1,0,1,1);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(1,1,1,2);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(1,0,2,1);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(1,1,2,2);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(1,0,3,1);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(1,1,3,1);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(1,0,4,1);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(1,1,4,1);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(1,0,5,1);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(1,1,5,2);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(1,0,6,2);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(2,1,2,2);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(2,1,3,2);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(2,1,4,2);
 insert into scheduled_activity (week_nr, is_morning, day_of_week, activity_id) values(2,1,5,2);
 /******************************************************************************
 * ABSENCES EDUCATOR
 */
 delete from absence_educator;
 insert into absence_educator (educator_id, from_date, to_date) values(1, strftime('%Y-%m-%d', '2017-01-04'), strftime('%Y-%m-%d', '2017-01-05'));
 insert into absence_educator (educator_id, from_date, to_date) values(1, strftime('%Y-%m-%d', '2017-04-01'), strftime('%Y-%m-%d', '2017-04-07'));
 insert into absence_educator (educator_id, from_date, to_date) values(2, strftime('%Y-%m-%d', '2017-03-03'), strftime('%Y-%m-%d', '2017-04-01'));