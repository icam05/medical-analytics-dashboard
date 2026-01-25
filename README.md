Health Analytics Dashboard Pipeline

A complete end-to-end healthcare analytics project using SQL Server, Python, R, and Power BI.

This repository showcases a full data-engineering and analytics workflow similar to what is used inside MLTC plans, Health Plans, Hospice organizations, and Managed Care analytics environments (e.g., Reveleer, CCNY, Sentara, and HomeCare Partners). It includes:

Automated data ingestion from CSV files

SQL Server data modeling (DDL)

Bulk load operations for healthcare datasets

A complete Power BI PBIP dashboard

Clean, reproducible ETL and project structure

This project is designed as a portfolio-ready demonstration of real-world healthcare analytics workflows.

Table of Contents

Project Overview

Tech Stack

Repository Structure

Dataset Description

SQL Server Setup

Python ETL Workflow

Power BI Dashboard

Optional R Statistical Analysis

Why SQL Server for Automation

Future Improvements

License

1. Project Overview

This project models and analyzes healthcare data representing:

Patients

Encounters

Doctors

Hospitals

Medical Conditions

Insurance Providers

Medications

The Power BI dashboard includes:

Patient demographics

Admission analytics

Condition prevalence

Hospital utilization

Doctor activity

Age-group segmentation

Interactive matrix-based slicing & filtering

The end-to-end pipeline mirrors workflows used in:

Quality Improvement

Utilization Management

Risk Adjustment

Care Management

Population Health Analytics

2. Tech Stack
Languages & Tools

SQL Server — data modeling, querying, DDL/DML

Python — ingestion automation and repeatable ETL

Power BI (PBIP) — dashboards, data modeling, DAX

R (optional) — statistical analysis

GitHub — version control and project delivery

VS Code — development environment

Core Skills Demonstrated

SQL data modeling

Healthcare ETL design

Automated data loading pipelines

Power BI report design & relationships

End-to-end analytics project organization


health-analytics/
│
├── data/
│   └── raw/                    # Source CSV files
│
├── ingestion/
│   └── load_to_sql.py          # Python ingestion script
│
├── powerbi/
│   └── health_dashboard/       # Power BI PBIP project
│
├── sql/
│   ├── 01_create_tables.sql    # Creates all SQL tables
│   └── 02_load_data.sql        # Bulk loads CSV data
│
├── .gitignore
├── LICENSE
└── README.md


4. Dataset Description

Each dataset represents a core domain of healthcare operations:

File	Description
patients.csv	Demographics, gender, blood type
doctors.csv	Clinicians by ID
hospitals.csv	Facilities + latitude/longitude
medical_conditions.csv	Primary diagnosis categories
medications.csv	Medication reference list
insurance_providers.csv	Payers/health plans
encounters.csv	Admissions, LOS, billing amounts, diagnosis, etc.

All files are intentionally lightweight to allow quick ingestion and testing.

5. SQL Server Setup
Step 1 — Create Tables

Run:
sql/01_create_tables.sql
This builds:

patients

doctors

hospitals

medical_conditions

medications

insurance_providers

encounters

All relationships are enforced through foreign keys.

Step 2 — Load the Data

Edit the path inside:
sql/02_load_data.sql

Update:
DECLARE @dataPath VARCHAR(500) = 'C:\your\local\path\here\';

Then run the script to bulk insert every CSV:

Patients

Doctors

Hospitals

Conditions

Medications

Insurance Providers

Encounters

This loads the full dataset into SQL Server.

6. Python ETL Workflow

File:
ingestion/load_to_sql.py

Functions demonstrated:

Reading CSVs

Connecting to SQL Server (pyodbc)

Iterating through all raw files

Executing bulk inserts programmatically

Reusable ingestion logic for automation

This script can later be scheduled using:

Windows Task Scheduler

Cron

Airflow

Azure Data Factory

Databricks Workflows

7. Power BI Dashboard

Location:
powerbi/health_dashboard/

Includes:

All PBIP artifacts

Data model

Visuals

Measures

Formatting

Relationships

To open:

Clone the repo

Open Power BI Desktop

Select the PBIP folder

Update SQL Server connection in Power Query

Refresh

All visuals load immediately from the SQL tables.

8. Optional R Statistical Analysis

You may add an R analysis layer including:

Hypothesis testing (χ², t-test, ANOVA)

Logistic regression (e.g., readmission risk)

ggplot2 charts

Exploratory analysis

These would live under a future /r/ folder.

9. Why SQL Server for Automation?

Using SQL Server provides:

Repeatable data refresh

Guaranteed referential integrity (FK constraints)

Consistent schema enforcement

A single source of truth for Power BI

Supports future automation (Python ETL → SQL → Power BI refresh)

Alternative options (Parquet, DuckDB, SQLite, Databricks, or a cloud warehouse) could also work, but SQL Server is ideal for:

Healthcare analytics workflows

Local development

Power BI modeling

ETL reproducibility

This is a deliberate design decision to reflect real enterprise processes.

10. Future Improvements

Planned enhancements include:

Star schema redesign (FactEncounters + Dim tables)

Power BI model optimized for fact/dimension analysis

Advanced DAX: care-management KPIs, risk models

Azure-based ingestion pipeline

Machine-learning extensions (readmission prediction)

Publishing a live Power BI dashboard

11. License

This project is available under the MIT License.






