create database covid;
use covid;

-- 1. what is the likelihood of a person who would be die in case of she has been infected?
select location, sum(dead) ,sum(infected), (sum(dead)/sum(infected) *100) as dead_infection_likelihood 
from data
group by location
order by dead_infection_likelihood desc;

-- 2. show the likelihood of person would be died in case of she has been vaccinated?
select location, sum(infected) as total_infected,sum(dead) as total_dead,sum(vaccinated) as total_vaccinated,
(sum(dead)/sum(vaccinated) *100) as vaccinated_dead_likelihood 
from data
group by location 
order by vaccinated_dead_likelihood  desc;

-- 3.show the likelihood of person infected in case of she has been vaccinated?
select location, sum(infected) as total_infected,sum(vaccinated) as total_vaccinated,
(sum(infected)/sum(vaccinated) *100) as infected_vaccinated_likelihood 
from data
group by location 
order by infected_vaccinated_likelihood;

-- 4. which country has highest death rate compare to population?
select location, population, sum(dead) as total_dead ,(sum(dead)/population *100) as death_rate
from data
group by location,population
order by death_rate desc;