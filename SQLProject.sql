use GunViolence;

# Question 1
# Which city had the most gun violence incidents in 2016? What about mass shootings specifically?
select city_or_county, count(city_or_county) as num_of_incidents from incidents2016
group by city_or_county
order by count(city_or_county) desc;

select city_state, count(city_state) as num_of_mass_shootings from massshootings
where year = 2016
group by city_state
order by count(city_state) desc;

# Question 2
# List all the types of weapons used during gun violence incidents in 2016 ordered by most commonly used to least.
select gun_type, count(gun_type) as frequency from weapons2016
where gun_type not like '%Unknown%'
group by gun_type
order by count(gun_type) desc;

# Question 3
# Of the mass shooting incidents where the weapon was not obtained legally, how many of them involved a shooter with prior signs of mental illness?
select count(*) NumofShooters from massshootingweapons join massshooters using(ID)
where lower(weapons_obtained_legally) like '%no%' and lower(prior_signs_mental_health_issues) like '%yes%';

# Question 4
# What is the average number of gun violence incidents among the states that require both a permit and universal background check to own a firearm in 2016?
select state, NumofIncidents, round(avg(NumofIncidents) over(),2) as AvgNumIncidents from(
select state, count(*) as NumofIncidents from incidents2016 
join FirearmOwnership fo using(state) 
where fo.year = 2016
and fo.universal = 0 and fo.permit = 0
group by state
order by count(*)) as t;

# Question 5
# Which news source reported the most gun violence incidents in 2016?
select substring_index(substring(source_url,locate("/",source_url)+2), '/', 1) as source, 
count(*) as NumofIncidents from incidents2016
group by source
order by NumofIncidents;

# Question 6
# List the state and the gun ownership score for the states with the most mass shootings for each year from 1982-2016.
# create a new state column for massshootings to use for joining with firearmownership
alter table massshootings
add column state varchar(20) not null;

set sql_safe_updates = 0;
update massshootings set
state = substring(city_state, locate(', ', city_state)+2);
set sql_safe_updates = 1;

with RankedStates as (
select fo.year, fo.state, fo.ownership_score, count(*) as ShootingCount,
rank() over (partition by fo.year order by count(*) desc) as StateRank
from massshootings ms join firearmownership fo
where ms.year = fo.year and ms.state = fo.state
group by fo.year, fo.state
)
select rs.year, rs.state, rs.ownership_score
from RankedStates rs
where StateRank = 1
order by rs.year;

# Question 7
# What is the proportion of male suicides that resulted from a firearm in the state with the most gun violence incidents during 2016?
select state, round(m_fa_suicide, 4) as prop_male_suicide_firearm from firearmownership
where state = (select state from incidents2016 group by state order by count(*) desc limit 1) and year = 2016;

# Question 8
# Of all the gun violence incidents where the shooter was related to the victim(s), how old was the shooter?
select incident_id, date, state, incident_characteristics,
substring_index(participant_age, '::', -1) as shooter_age, 
avg(cast(substring_index(participant_age, '::', -1) as unsigned)) over() as AvgAge from participants2016 p
join incidents2016 inc using(incident_id)
where lower(participant_relationship) like '%family%' or lower(participant_relationship) like '%significant other%';



