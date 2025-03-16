-- OCD Patient Dashboard SQL Queries
-- This file contains SQL queries used to extract and transform data for the OCD Patient Dashboard.
-- Source: OCD Patient Dataset from Kaggle
-- Author: Eril Smith

------------------------------------------------------------
-- 1. Gender Distribution and Average Obsession Score
-- Calculates the total number of male and female patients,
-- the percentage of each group, and the average Y-BOCS 
-- Obsession score by gender
------------------------------------------------------------

WITH gender_count_data AS 
(
SELECT Gender
  ,COUNT(`Patient ID`) AS patient_count
  ,round(avg(`Y-BOCS Score (Obsessions)`),2) AS avg_obs_score
 FROM OCD_Patient_Dataset.ocd_health_data
   GROUP BY Gender
   ORDER BY patient_count
 )
 
SELECT sum(CASE WHEN Gender = 'Female' THEN patient_count ELSE 0 END) AS count_female
  ,sum(CASE WHEN Gender = 'Male' THEN patient_count ELSE 0 END) AS count_male

-- Calculate % of female and male patients
  ,round(sum(CASE WHEN Gender = 'Female' THEN patient_count ELSE 0 END)/
 (sum(CASE WHEN Gender = 'Female' THEN patient_count ELSE 0 END)+sum(CASE WHEN Gender = 'Male' THEN patient_count ELSE 0 END)) *100,2)
 AS pct_female
  
  ,round(sum(CASE WHEN Gender = 'Male' THEN patient_count ELSE 0 END)/
 (sum(CASE WHEN Gender = 'Female' THEN patient_count ELSE 0 END)+sum(CASE WHEN Gender = 'Male' THEN patient_count ELSE 0 END)) *100,2)
 AS pct_male
FROM gender_count_data
 ;


------------------------------------------------------------
-- 2. Patient Count and Average Obsession Score by Ethnicity
------------------------------------------------------------

SELECT Ethnicity
  ,COUNT(`Patient ID`) AS patient_count
  ,round(avg(`Y-BOCS Score (Obsessions)`),2) AS avg_obs_score
FROM OCD_Patient_Dataset.ocd_health_data
  GROUP BY Ethnicity
  ORDER BY patient_count
;


------------------------------------------------------------
-- 3. Month-Over-Month OCD Diagnoses
-- Formats OCD diagnosis dates to the first of each month
-- and counts how many patients were diagnosed each month
------------------------------------------------------------

-- Ensure OCD Diagnosis Date is in DATE format
ALTER TABLE OCD_Patient_Dataset.ocd_health_data
MODIFY `OCD Diagnosis Date` date
;

SELECT date_format(`OCD Diagnosis Date`, "%Y-%m-01 00:00:00") AS MONTH
  ,COUNT(`Patient ID`) AS patient_count
FROM OCD_Patient_Dataset.ocd_health_data 
  GROUP BY MONTH
  ORDER BY MONTH 
;

------------------------------------------------------------
-- 4. Most Common Obsession Types & Avg Scores
------------------------------------------------------------

SELECT `Obsession Type`
  ,COUNT(`Patient ID`) AS patient_count
  ,ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) AS avg_obs_score
FROM OCD_Patient_Dataset.ocd_health_data 
  GROUP BY `Obsession Type`
  ORDER BY patient_count
;

------------------------------------------------------------
-- 5. Most Common Compulsion Types & Avg Scores
------------------------------------------------------------

SELECT `Compulsion Type`
  ,COUNT(`Patient ID`) AS patient_count
  ,ROUND(AVG(`Y-BOCS Score (Compulsions)`),2) AS avg_com_score
FROM OCD_Patient_Dataset.ocd_health_data 
  GROUP BY `Compulsion Type`
  ORDER BY patient_count
;
