# Comprehensive Gun Violence and Mass Shootings Analysis in the US (2016)

## Project Overview
This project examines gun violence incidents and mass shootings in the United States in 2016. Utilizing datasets from diverse sources, I constructed a comprehensive database to facilitate a nuanced analysis of gun violence patterns. While these datasets cover a broad number of years and incidents, I only examined the year 2016 and events that had at least one victim (injured/killed). The project encompasses data cleaning, manipulation, and analysis using SQL, followed by insightful visualizations created with Tableau.

## Objective
To dissect the complexities of gun violence in the US by analyzing trends in incidents, weapon types, legal status of weapon acquisition, and the interplay between firearm ownership and violence, informing discussions on gun control and violence prevention.

## Data Sources
The analysis is based on three primary datasets:

**Gun Violence Archive:** Information on all gun violence incidents in the US from 2013-2018, providing a detailed account of each incident.
https://github.com/jamesqo/gun-violence-data
**MotherJones:** Focused on mass shooting incidents from 1982-2019, offering insights into the most devastating events.
https://data.world/awram/us-mass-shootings
**RAND Corporation:** Data on gun ownership and suicide rate estimates for each US state from 1980-2016, contributing to understanding the societal impacts of firearm accessibility.
https://www.rand.org/pubs/tools/TL354.html

Each dataset was carefully selected for its authority and comprehensiveness, ensuring a robust foundation for the analysis.

## Methodology
**Data Sourcing:** Compiled extensive datasets covering gun violence incidents, mass shootings, and gun ownership rates.
**Database Creation:** Overcame challenges as a novice MySQL user to successfully build and populate the database, including format conversion and file size management.
**Analysis:** Developed advanced SQL queries to extract actionable insights, focusing on urban violence patterns, firearm preferences, and legislative impacts.
**Visualization:** Created interactive Tableau dashboards to present the findings accessibly.

## Key Insights
Identified cities with high gun violence and mass shooting incidents in 2016, analyzing urban trends.
Cataloged weapon types used in incidents, highlighting firearm preferences.
Analyzed the legality of weapon acquisition in mass shootings and its correlation with incidents involving mental illness signs.
Explored the relationship between firearm laws and gun violence incidents across states, examining the effect of gun ownership accessibility.

## Data Dictionaries
Provided detailed dictionaries for each database table, ensuring clarity and usability of the data for future research and analysis.

### FirearmOwnership
| Field                | Type         | Null | Key | Description                                        |
|----------------------|--------------|------|-----|----------------------------------------------------|
| year                 | int          | NO   | PK  | Year of survey                                     |
| state                | varchar(14)  | NO   | PK  | State of survey                                    |
| ownership_score      | decimal(5,3) | NO   |     | Calculated score representing household ownership  |
| ownership_score_se   | decimal(5,3) | NO   |     | Standard error of calculated ownership score       |
| universal            | bit(1)       | NO   |     | Universal background check required                |
| permit               | bit(1)       | NO   |     | Permit required                                    |
| f_fa_suicide         | decimal(5,3) | NO   |     | Proportion of female suicides by firearm           |
| m_fa_suicide         | decimal(5,3) | NO   |     | Proportion of male suicides by firearm             |

### Incidents2016
| Field                   | Type    | Null | Key | Description                     |
|-------------------------|---------|------|-----|---------------------------------|
| incident_id             | int     | NO   | PK  | Incident ID                     |
| date                    | text    | YES  |     | Date of Incident                |
| state                   | text    | YES  |     | State of Incident               |
| city_or_county          | text    | YES  |     | City or County of Incident      |
| address                 | text    | YES  |     | Address of Incident             |
| n_killed                | int     | YES  |     | Number of people killed         |
| n_injured               | int     | YES  |     | Number of people injured        |
| source_url              | text    | YES  |     | News source URL                 |
| incident_characteristics| text    | YES  |     | Description of the incident     |

### IncidentWeapons2016
| Field                | Type    | Null | Key | Description                  |
|----------------------|---------|------|-----|------------------------------|
| incident_id          | int     | NO   | PK  | Incident ID                  |
| gun_stolen           | text    | YES  |     | Whether the gun was stolen   |
| gun_type             | text    | YES  |     | Type of gun used             |
| n_guns_involved      | int     | YES  |     | Number of guns involved      |

### Participants2016
| Field                    | Type    | Null | Key | Description                    |
|--------------------------|---------|------|-----|--------------------------------|
| incident_id              | int     | NO   | PK  | Incident ID                    |
| participant_age          | text    | YES  |     | Age of all participants        |
| participant_gender       | text    | YES  |     | Gender of all participants     |
| participant_name         | text    | YES  |     | Names of all participants      |
| participant_relationship | text    | YES  |     | Relationship of participants   |
| participant_status       | text    | YES  |     | Current status of participants |
| participant_type         | text    | YES  |     | Type of participant (shooter/victim) |

### MassShootings
| Field              | Type    | Null | Key | Description                  |
|--------------------|---------|------|-----|------------------------------|
| ID                 | int     | NO   | PK  | Mass Shooting ID             |
| case               | text    | YES  |     | Name of the shooting case    |
| city_state         | text    | YES  |     | City and state of the shooting|
| date               | text    | YES  |     | Date of shooting             |
| summary            | text    | YES  |     | Summary of the event         |
| fatalities         | int     | YES  |     | Number of fatalities         |
| injured            | int     | YES  |     | Number of injured            |
| total_victims      | int     | YES  |     | Total number of victims      |
| location           | text    | YES  |     | Type of location             |
| year               | int     | YES  |     | Year of shooting             |

### MassShooters
| Field                        | Type | Null | Key | Description                           |
|------------------------------|------|------|-----|---------------------------------------|
| ID                           | int  | NO   | PK  | Mass Shooting ID                      |
| age_of_shooter               | text | YES  |     | Age of the shooter                    |
| prior_signs_of_mental_health_issues | text | YES  |     | If the shooter had signs of mental illness |
| race                         | text | YES  |     | Race of shooter                       |
| gender                       | text | YES  |     | Gender of shooter                     |

### MassShootingWeapons
| Field                  | Type | Null | Key | Description                           |
|------------------------|------|------|-----|---------------------------------------|
| ID                     | int  | NO   | PK  | Mass Shooting ID                      |
| weapons_obtained_legally | text | YES  |     | Whether the weapon was obtained legally |
| where_obtained         | text | YES  |     | Where the weapon was obtained         |
| weapon_type            | text | YES  |     | Type of weapon used                   |
| weapon_details         | text | YES  |     | More details about the weapon       

## Contribution
This project represents a significant personal commitment to understanding gun violence in the US. Contributions to extend the analysis, update datasets, or improve visualizations are welcome.

## Acknowledgements
Thank you for exploring this comprehensive analysis of gun violence and mass shootings in the US. Your feedback and contributions are valued as we continue to seek data-driven solutions to this pressing issue.
