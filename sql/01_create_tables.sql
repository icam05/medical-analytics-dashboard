-- =========================================
-- CREATE TABLES FOR HEALTH ANALYTICS PROJECT
-- Schema matches CSVs in data/raw
-- =========================================

-- Drop in dependency-safe order if they already exist
IF OBJECT_ID('dbo.Encounters', 'U') IS NOT NULL DROP TABLE dbo.Encounters;
IF OBJECT_ID('dbo.Patients', 'U') IS NOT NULL DROP TABLE dbo.Patients;
IF OBJECT_ID('dbo.Doctors', 'U') IS NOT NULL DROP TABLE dbo.Doctors;
IF OBJECT_ID('dbo.Hospitals', 'U') IS NOT NULL DROP TABLE dbo.Hospitals;
IF OBJECT_ID('dbo.MedicalConditions', 'U') IS NOT NULL DROP TABLE dbo.MedicalConditions;
IF OBJECT_ID('dbo.Medications', 'U') IS NOT NULL DROP TABLE dbo.Medications;
IF OBJECT_ID('dbo.InsuranceProviders', 'U') IS NOT NULL DROP TABLE dbo.InsuranceProviders;
GO

-- patients.csv
-- patient_id,age,gender,blood_type
CREATE TABLE dbo.Patients (
    patient_id   VARCHAR(20)  NOT NULL PRIMARY KEY,  -- e.g. 'ID-2621'
    age          INT          NULL,
    gender       VARCHAR(20)  NULL,
    blood_type   VARCHAR(5)   NULL
);

-- doctors.csv
-- doctor_id,doctor_name
CREATE TABLE dbo.Doctors (
    doctor_id    INT          NOT NULL PRIMARY KEY,
    doctor_name  VARCHAR(255) NOT NULL
);

-- hospitals.csv
-- hospital_id,hospital_name,hospital_latitude,hospital_longitude
CREATE TABLE dbo.Hospitals (
    hospital_id        INT          NOT NULL PRIMARY KEY,
    hospital_name      VARCHAR(255) NOT NULL,
    hospital_latitude  DECIMAL(10,6) NULL,
    hospital_longitude DECIMAL(10,6) NULL
);

-- medical_conditions.csv
-- medical_condition_id,medical_condition_name
CREATE TABLE dbo.MedicalConditions (
    medical_condition_id   INT          NOT NULL PRIMARY KEY,
    medical_condition_name VARCHAR(255) NOT NULL
);

-- medications.csv
-- medication_id,medication_name
CREATE TABLE dbo.Medications (
    medication_id   INT          NOT NULL PRIMARY KEY,
    medication_name VARCHAR(255) NOT NULL
);

-- insurance_providers.csv
-- insurance_provider_id,insurance_provider_name
CREATE TABLE dbo.InsuranceProviders (
    insurance_provider_id   INT          NOT NULL PRIMARY KEY,
    insurance_provider_name VARCHAR(255) NOT NULL
);

-- encounters.csv
-- encounter_id,patient_id,date_of_admission,discharge_date,
-- room_number,admission_type,billing_amount,test_results,
-- hospital_id,doctor_id,insurance_provider_id,
-- medical_condition_id,medication_id
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
    CONSTRAINT FK_Encounters_InsProviders
        FOREIGN KEY (insurance_provider_id) REFERENCES dbo.InsuranceProviders(insurance_provider_id),
    CONSTRAINT FK_Encounters_MedConds
        FOREIGN KEY (medical_condition_id) REFERENCES dbo.MedicalConditions(medical_condition_id),
    CONSTRAINT FK_Encounters_Medications
        FOREIGN KEY (medication_id) REFERENCES dbo.Medications(medication_id)
);
GO

