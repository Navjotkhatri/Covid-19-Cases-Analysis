----covid cases and deaths analysis----

select*from deaths
where continent is not null
order by 3,4

select location,date,total_cases,new_cases, total_deaths,population from deaths
where continent is not null
order by 1,2

---India death percentage by date---

select location,date,total_cases,total_deaths,population,
(total_deaths/total_cases)*100 as death_per_on_total_cases
from deaths
where continent is not null
and location like 'India%'
order by date

--world death percentage by date


select location,date,total_cases,total_deaths,population,
(total_deaths/total_cases)*100 as death_per_on_total_cases
from deaths
where continent is null
and location like '%World%'
order by date

----covid cases percentage on population---

select location,date,total_cases,population,
(total_cases/population)*100 as covid_per_on_total_population
from deaths
where location like 'India%'
and continent is not null
order by date


----Highest infection rate across the world---


select location,MAX(total_cases) as highest_infection_rate,population,
MAX((total_cases/population))*100 as Infected_population_percentage
from deaths
where continent is not null
--and location like '%India%'
group by location,population
order by Infected_population_percentage desc

----infected ratio in india--

select location,MAX(total_cases) as highest_infection_rate,population,
MAX((total_cases/population))*100 as Infected_poplation_percentage
from deaths
where continent is not null
and location like '%India%'
group by location,population
order by Infected_poplation_percentage desc


---total deaths location vise--

select location,max(total_cases) as total_cases ,MAX(total_deaths) as total_death
from deaths
where continent is not null
--where location like 'India%'
group by location
order by total_cases desc


---total death in india---

select location,MAX(total_deaths) as total_death
from deaths
where continent is not null
and location like 'India%'
group by location
order by total_death desc


---total deaths continent vise---


select location,max(total_cases) as total_case_count,MAX(total_deaths) as total_death_count
from deaths
where continent is null
--where location like 'India%'
group by location
order by total_case_count desc

---total cases country vise----

select location,MAX(total_cases) as total_case
from deaths
where continent is not null
group by location
order by total_case desc

--total deaths country vise--


select location,MAX(total_deaths) as total_death
from deaths
where continent is not null
group by location
order by total_death desc

---total covid cases in the world--


select location,population,max(total_cases)as Total_covid_cases_in_the_world from deaths
where location like '%World%'
group by location,population



---total deaths in the world--


select location,population,max(total_deaths)as total_covid_deaths_in_the_world from deaths
where location like '%World%'
group by location,population


-----india total covid cases


select location,population,max(total_cases)as Total_covid_cases from deaths
where location like 'India'
group by location,population


---india total deaths


select location,population,max(total_deaths)as total_covid_deaths from deaths
where location like 'India'
group by location,population


--india covid cases per day
select date,location,total_cases,total_deaths from deaths
where location like 'India'
group by location,date,total_cases,total_deaths
order by date


---covid cases day vise


select location, date,total_cases,total_deaths from deaths
where continent is not null
group by location,date,total_cases,total_deaths
order by date

select*from vaccinations



select*from
deaths dea
join vaccinations vac
on dea.iso_code=vac.iso_code
and dea.date=vac.date