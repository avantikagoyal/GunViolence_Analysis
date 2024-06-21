create database GunViolence;

use GunViolence;

create table Incidents2017 
(incident_id int primary key,
date date,
state varchar(20),
city_county varchar(20),
address varchar(20),
n_killed int,
n_injured int,
source_url varchar(20),
characteristics varchar(20));

alter table incidents2017
add primary key(incident_id);

create table IncidentWeapons2017
(incident_id int primary key,
gun_stolen varchar(20),
gun_type varchar(20),
n_guns_involved int);

alter table incidentweapons2017
add primary key(incident_id);

create table Participants2017
(incident_id int primary key,
participant_age varchar(20),
participant_name varchar(20),
participant_gender varchar(20),
participant_relationship varchar(20),
participant_status varchar(20),
participant_type varchar(20));

alter table participants2017
add primary key(incident_id);

create table MassShootings
(mass_shooting_id int primary key,
date date,
shooting_case varchar(20),
city_state varchar(20),
summary varchar(20),
fatalities int,
injured int,
total_victims int,
location varchar(20),
year int);

alter table massshootings
add primary key(ID),
rename column location to city_state,
rename column location__1 to location;

create table MassShooter
(mass_shooting_id int primary key,
date date,
age_of_shooter int,
race varchar(20),
gender varchar(20),
signs_of_mental_health_issues varchar(10));

alter table massshooters
add primary key(ID);

create table MassShootingWeapons
(mass_shooting_id int primary key,
weapons_obtained_legally varchar(20),
where_obtained varchar(20),
weapon_type varchar(20),
weapon_details varchar(20));

alter table massshootingweapons
add primary key(ID);

create table FirearmOwnership
(year int,
state varchar(20),
primary key (year, state),
ownership_score numeric,
ownership_score_se numeric,
universal binary,
permit binary,
F_suicide numeric,
M_suicide numeric);
