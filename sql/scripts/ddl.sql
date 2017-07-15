drop table if exists db_setting;
create table db_setting (
	id      integer,
	"key"   text,
	value   text,
	constraint db_setting_pk primary key (id)
);
-----------------------------------------------------
drop table if exists educator;
create table educator (
	id          integer,
	first_name  text,
	last_name   text,
	is_trainee  integer check (is_trainee = 0 or is_trainee = 1),
	team_id     integer,
	constraint educator_pk primary key (id)
	foreign key (team_id) references team(id)
);
-----------------------------------------------------
drop table if exists recipient;
create table recipient (
	id          integer,
	first_name  text,
	last_name   text,
	team_id     integer,
	constraint recipient_pk primary key (id)
	foreign key (team_id) references team(id)
);
-----------------------------------------------------
drop table if exists team;
create table team (
	id       integer,
	name     numeric,	
	constraint group_pk primary key (id)
);
-----------------------------------------------------
drop table if exists scheduled_team;
create table scheduled_team (
	id integer,
	week_nr     integer check (week_nr >= 1 and week_nr <= 52),
	is_morning  integer check (is_morning = 0 or is_morning = 1), 
	day_of_week integer check (day_of_week >= 0 and day_of_week < 7), -- Monday = 0, Sunday = 6
	team_id     integer,
	constraint scheduled_team_pk primary key (id)
	foreign key (team_id) references team(id)
);
-----------------------------------------------------
drop table if exists activity;
create table activity (
	id             integer,
	name           integer,
	constraint activity_pk primary key (id)
);
-----------------------------------------------------
drop table if exists scheduled_activity;
create table scheduled_activity (
	id          integer,
	week_nr     integer check (week_nr >= 1 and week_nr <= 52),
	is_morning  integer check (is_morning = 0 or is_morning = 1), 
	day_of_week integer check (day_of_week >= 0 and day_of_week < 7), -- Monday = 0, Sunday = 6
	activity_id integer,
	constraint scheduled_activity_pk primary key (id)
	foreign key (activity_id) references activity(id)
);
-----------------------------------------------------
drop table if exists absence_educator;
create table absence_educator(
	id          integer,
	educator_id integer,
	from_date   date,
	to_date     date,
	constraint absence_educator_pk primary key (id)
	foreign key (educator_id) references educator(id)
);
-----------------------------------------------------
drop table if exists absence_recipient;
create table absence_recipient(
	id           integer,
	recipient_id integer,
	from_date    date,
	to_date      date,
	constraint absence_recipient_pk primary key (id)
	foreign key (recipient_id) references recipient(id)
);
-----------------------------------------------------
drop table if exists recipient_to_activity;
create table recipient_to_activity(
	id           integer,
	recipient_id integer,
	activity_id  integer,
	constraint recipient_to_activity_pk primary key (id)
	foreign key (recipient_id) references recipient(id)
	foreign key (activity_id) references activity(id)
);
-----------------------------------------------------
drop table if exists educator_to_activity;
create table educator_to_activity(
	id          integer,
	educator_id integer,
	activity_id integer,
	constraint educator_to_activity_pk primary key (id)
	foreign key (educator_id) references educator(id)
	foreign key (activity_id) references activity(id)
);