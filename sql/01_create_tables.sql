/*==============================================================
  01_create_tables.sql
  HEALTH ANALYTICS – TABLE DDL

  INSTRUCTIONS:

  1. Create (or switch to) the target database:
       CREATE DATABASE IngestionPlatform;
       GO
       USE IngestionPlatform;
       GO

  2. Run this script to create all tables used by the project.

  3. Then run 02_load_data.sql to bulk load the CSV files.
==============================================================*/

---------------------------------------------------------------
-- Drop existing tables in FK-safe order (if they exist)
---------------------------------------------------------------
IF OBJECT_ID('dbo.Encounters', 'U')           IS NOT NULL DROP TABLE dbo.Encounters;
IF OBJECT_ID('dbo.InsuranceProviders', 'U')   IS NOT NULL DROP TABLE dbo.InsuranceProviders;
IF OBJECT_ID('dbo.MedicalConditions', 'U')    IS NOT NULL DROP TABLE dbo.MedicalConditions;
IF OBJECT_ID('dbo.Medications', 'U')          IS NOT NULL DROP TABLE dbo.Medications;
IF OBJECT_ID('dbo.Hospitals', 'U')            IS NOT NULL DROP TABLE dbo.Hospitals;
IF OBJECT_ID('dbo.Doctors', 'U')              IS NOT NULL DROP TABLE dbo.Doctors;
IF OBJECT_ID('dbo.Patients', 'U')             IS NOT NULL DROP TABLE dbo.Patients;
GO

/*==============================================================
  DIMENSION TABLES
==============================================================*/

---------------------------------------------------------------
-- PATIENTS
-- CSV: patients.csv
-- Columns: patient_id, age, gender, blood_type
---------------------------------------------------------------
CREATE TABLE dbo.Patients (
    patient_id  VARCHAR(20)  NOT NULL PRIMARY KEY,
    age         INT          NULL,
    gender      VARCHAR(10)  NULL,
    blood_type  VARCHAR(5)   NULL
);
GO

---------------------------------------------------------------
-- DOCTORS
-- CSV: doctors.csv
-- Columns: doctor_id, doctor_name
---------------------------------------------------------------
CREATE TABLE dbo.Doctors (
    doctor_id    INT          NOT NULL PRIMARY KEY,
    doctor_name  VARCHAR(255) NOT NULL
);
GO

---------------------------------------------------------------
-- HOSPITALS
-- CSV: hospitals.csv
-- Columns: hospital_id, hospital_name, hospital_latitude, hospital_longitude
---------------------------------------------------------------
CREATE TABLE dbo.Hospitals (
    hospital_id        INT           NOT NULL PRIMARY KEY,
    hospital_name      VARCHAR(255)  NOT NULL,
    hospital_latitude  DECIMAL(10,6) NULL,
    hospital_longitude DECIMAL(10,6) NULL
);
GO

---------------------------------------------------------------
-- MEDICAL CONDITIONS
-- CSV: medical_conditions.csv
-- Columns: medical_condition_id, medical_condition_name
---------------------------------------------------------------
CREATE TABLE dbo.MedicalConditions (
    medical_condition_id   INT          NOT NULL PRIMARY KEY,
    medical_condition_name VARCHAR(255) NOT NULL
);
GO

---------------------------------------------------------------
-- MEDICATIONS
-- CSV: medications.csv
-- Columns: medication_id, medication_name
---------------------------------------------------------------
CREATE TABLE dbo.Medications (
    medication_id   INT          NOT NULL PRIMARY KEY,
    medication_name VARCHAR(255) NOT NULL
);
GO

---------------------------------------------------------------
-- INSURANCE PROVIDERS
-- CSV: insurance_providers.csv
-- Columns: insurance_provider_id, insurance_provider_name
---------------------------------------------------------------
CREATE TABLE dbo.InsuranceProviders (
    insurance_provider_id   INT          NOT NULL PRIMARY KEY,
    insurance_provider_name VARCHAR(255) NOT NULL
);
GO

/*==============================================================
  FACT TABLE
==============================================================*/

---------------------------------------------------------------
-- ENCOUNTERS
-- CSV: encounters.csv
-- Columns:
--   encounter_id, patient_id, date_of_admission, discharge_date,
--   room_number, admission_type, billing_amount, test_results,
--   hospital_id, doctor_id, insurance_provider_id,
--   medical_condition_id, medication_id
---------------------------------------------------------------
CREATE TABLE dbo.Encounters (
    encounter_id          INT           NOT NULL PRIMARY KEY,
    patient_id            VARCHAR(20)   NOT NULL,
    date_of_admission     DATE          NULL,
    discharge_date        DATE          NULL,
    room_number           INT           NULL,
    admission_type        VARCHAR(50)   NULL,
    billing_amount        DECIMAL(18,2) NULL,
    test_results          VARCHAR(50)   NULL,
    hospital_id           INT           NOT NULL,
    doctor_id             INT           NOT NULL,
    insurance_provider_id INT           NOT NULL,
    medical_condition_id  INT           NOT NULL,
    medication_id         INT           NOT NULL,

    CONSTRAINT FK_Encounters_Patients
        FOREIGN KEY (patient_id) REFERENCES dbo.Patients(patient_id),

    CONSTRAINT FK_Encounters_Hospitals
        FOREIGN KEY (hospital_id) REFERENCES dbo.Hospitals(hospital_id),

    CONSTRAINT FK_Encounters_Doctors
        FOREIGN KEY (doctor_id) REFERENCES dbo.Doctors(doctor_id),

    CONSTRAINT FK_Encounters_InsuranceProviders
        FOREIGN KEY (insurance_provider_id) REFERENCES dbo.InsuranceProviders(insurance_provider_id),

    CONSTRAINT FK_Encounters_MedicalConditions
        FOREIGN KEY (medical_condition_id) REFERENCES dbo.MedicalConditions(medical_condition_id),

    CONSTRAINT FK_Encounters_Medications
        FOREIGN KEY (medication_id) REFERENCES dbo.Medications(medication_id)
);
GO


