-- 1. Count & Pct of F vs M that hacce OCD & Average Obsession score by Gender
with gender_count_data as (
SELECT
Gender, 
COUNT(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score

 FROM OCD_Patient_Dataset.ocd_health_data
 Group by Gender
 Order by patient_count
 )
 
SELECT 
 sum(case when Gender = 'Female' then patient_count else 0 end) as count_female,
 sum(case when Gender = 'Male' then patient_count else 0 end) as count_male,

 round(sum(case when Gender = 'Female' then patient_count else 0 end)/
 (sum(case when Gender = 'Female' then patient_count else 0 end)+sum(case when Gender = 'Male' then patient_count else 0 end)) *100,2)
 as pct_female,

round(sum(case when Gender = 'Male' then patient_count else 0 end)/
 (sum(case when Gender = 'Female' then patient_count else 0 end)+sum(case when Gender = 'Male' then patient_count else 0 end)) *100,2)
 as pct_male

 FROM gender_count_data
 ;

-- 2. Count of Patients by Ethnicity and their respective Average Obsession Score

SELECT
Ethnicity, 
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score
FROM OCD_Patient_Dataset.ocd_health_data
Group by Ethnicity
Order by patient_count
;


3. Number of people diagnosed with OCD MoM (month over month)

alter table OCD_Patient_Dataset.ocd_health_data
modify `OCD Diagnosis Date` date;

select
date_format(`OCD Diagnosis Date`, "%Y-%m-01 00:00:00") as month,
count(`Patient ID`) as patient_count
FROM OCD_Patient_Dataset.ocd_health_data 
group by month
order by month 
;

-- 4. What is the most common Obsession Type (Count) & it's respective Average Obsession Score

select
`Obsession Type`,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score
from OCD_Patient_Dataset.ocd_health_data 
group by `Obsession Type`
order by patient_count
;


-- 5. What is the most common Compulsion type (Count) & it's respective Average Obsession Score

select
`Compulsion Type`,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Compulsions)`),2) as avg_com_score
from OCD_Patient_Dataset.ocd_health_data 
group by `Compulsion Type`
order by patient_count
;
