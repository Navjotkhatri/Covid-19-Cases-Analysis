select*from deaths
where continent is not null
order by 3,4

select location,date,total_cases,new_cases, total_deaths,population from deaths
where continent is not null
order by 1,2


select location,date,total_cases,total_deaths,population,
(total_deaths/total_cases)*100 as deathpercentage 
from deaths
where continent is not null
and location like 'India%'
order by 1,2



select location,date,total_cases,population,
(total_cases/population)*100 as covidpercentage
from deaths
where location like 'India%'
and continent is not null
order by 1,2



select location,MAX(total_cases) as highest_infection_rate,population,
MAX((total_cases/population))*100 as Infectedpoplationpercentage
from deaths
where continent is not null
--and location like '%India%'
group by location,population
order by Infectedpoplationpercentage desc




select location,MAX(total_deaths) as totaldeathcount
from deaths
where continent is not null
--where location like 'India%'
group by location
order by totaldeathcount desc




select location,MAX(total_deaths) as totaldeathcount
from deaths
where continent is null
--where location like 'India%'
group by location
order by totaldeathcount desc



select*from vaccinations



select*from
deaths dea
join vaccinations vac
on dea.iso_code=vac.iso_code
and dea.date=vac.date