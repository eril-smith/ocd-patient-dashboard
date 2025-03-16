# OCD Patient Dashboard
This repository contains the **OCD Patient Dashboard**, an interactive Tableau dashboard visualizing patient data from the publicly available [OCD Patient Dataset: Demographics & Clinical Data](https://www.kaggle.com/datasets/ohinhaque/ocd-patient-dataset-demographics-and-clinical-data/versions/1?resource=download). The dashboard presents key insights into demographics and clinical characteristics of patients with obsessive-compulsive disorder (OCD).

## Dashboard Features
- Month-over-month patient counts
- Demographic breakdown including gender and ethnicity
- Obsession and compulsion types based on symptoms measured via the Yale-Brown Obsessive-Compulsive Scale (Y-BOCS)
- Interactive tooltips showing average Y-BOCS scores for each obsession and compulsion category

## Tools Used
- **SQL**: Used to clean, transform, and structure the dataset into separate tables for each dashboard component
- **Tableau**: Used for creating visualizations and designing the final dashboard layout

## Dataset
- Source: [Kaggle - OCD Patient Dataset](https://www.kaggle.com/datasets/ohinhaque/ocd-patient-dataset-demographics-and-clinical-data/versions/1?resource=download)

## SQL Queries

The SQL queries used to create the underlying dataset for the OCD Patient Dashboard are included in [`ocd_dashboard_queries.sql`](./ocd_dashboard_queries.sql).

These queries were used to:
1. Calculate the count and percentage of male vs. female OCD patients and their average Y-BOCS obsession scores
2. Summarize patient counts and average obsession scores by ethnicity
3. Show month-over-month (MoM) trends in OCD diagnoses
4. Identify the most common obsession types and their associated average scores
5. Identify the most common compulsion types and their associated average scores

Each query was written in standard SQL and run on the dataset from [Kaggle: OCD Patient Dataset – Demographics & Clinical Data](https://www.kaggle.com/datasets/ohinhaque/ocd-patient-dataset-demographics-and-clinical-data/versions/1?resource=download). The resulting tables were then imported into Tableau for visualization.

## Tableau Dashboard
[View the Interactive Dashboard on Tableau Public]([https://public.tableau.com/views/your-dashboard-link](https://public.tableau.com/views/OCDPatientDashboard/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link))

This dashboard was created using SQL-transformed data and visualized in Tableau. It presents clinical and demographic patterns in OCD diagnoses to help understand trends and symptom distributions.

## Summary

This project showcases my ability to work with clinical and demographic data, apply SQL to generate insights, and communicate findings through visual storytelling in Tableau. The OCD Patient Dashboard offers a snapshot of patterns in obsessive-compulsive disorder diagnoses based on real-world data.

## Skills Demonstrated

- Data cleaning and transformation using SQL
- Aggregating and analyzing clinical data
- Designing clear, user-friendly dashboards in Tableau
- Interpreting health data and highlighting key insights
- Structuring and documenting a technical project for portfolio and hiring purposes
