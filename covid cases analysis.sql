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
order by 1,2

----covid cases percentage on population---

select location,date,total_cases,population,
(total_cases/population)*100 as covid_per_on_total_population
from deaths
where location like 'India%'
and continent is not null
order by 1,2


----Highest infection rate across the world---


select location,MAX(total_cases) as highest_infection_rate,population,
MAX((total_cases/population))*100 as Infected_poplation_percentage
from deaths
where continent is not null
--and location like '%India%'
group by location,population
order by Infected_poplation_percentage desc

----infected ratio in india--

select location,MAX(total_cases) as highest_infection_rate,population,
MAX((total_cases/population))*100 as Infected_poplation_percentage
from deaths
where continent is not null
and location like '%India%'
group by location,population
order by Infected_poplation_percentage desc


---total deaths location vise--

select location,MAX(total_deaths) as total_death
from deaths
where continent is not null
--where location like 'India%'
group by location
order by total_death desc


---total death in india---

select location,MAX(total_deaths) as total_death
from deaths
where continent is not null
and location like 'India%'
group by location
order by total_death desc


---total deaths continent vise---


select location,MAX(total_deaths) as totaldeathcount
from deaths
where continent is null
--where location like 'India%'
group by location
order by totaldeathcount desc

---total cases country vise----

select location,MAX(total_cases) as maximum_cases
from deaths
where continent is not null
group by location
order by maximum_cases desc

---total covid cases in the world--


select location,population,max(total_cases)as total_covid_cases_in_the_world from deaths
where location like '%World%'
group by location,population



---total deaths in the world--


select location,population,max(total_deaths)as total_covid_deaths_in_the_world from deaths
where location like '%World%'
group by location,population







select*from vaccinations



select*from
deaths dea
join vaccinations vac
on dea.iso_code=vac.iso_code
and dea.date=vac.date