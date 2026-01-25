-- ============================================
-- 03_create_analytics_tables.sql
-- Creates derived / analytics tables used by
-- the Health Analytics Power BI dashboard.
--
-- NOTE: Run this in the target database
--       *after* 01_create_tables.sql and
--       02_load_data.sql have been executed.
-- ============================================

------------------------------------------------
-- AgeGrouping
------------------------------------------------
IF OBJECT_ID('dbo.AgeGrouping', 'U') IS NOT NULL
    DROP TABLE dbo.AgeGrouping;
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.AgeGrouping (
    patient_id NVARCHAR(50) NOT NULL,
    gender     NVARCHAR(10) NULL,
    age_group  VARCHAR(5)   NOT NULL
);
GO

------------------------------------------------
-- EncounterAnalytics
------------------------------------------------
IF OBJECT_ID('dbo.EncounterAnalytics', 'U') IS NOT NULL
    DROP TABLE dbo.EncounterAnalytics;
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.EncounterAnalytics (
    encounter_id              INT           NOT NULL,
    patient_id                NVARCHAR(50)  NOT NULL,
    age                       INT           NULL,
    gender                    NVARCHAR(10)  NULL,
    blood_type                NVARCHAR(5)   NULL,
    date_of_admission         DATE          NOT NULL,
    discharge_date            DATE          NULL,
    length_of_stay            INT           NULL,
    room_number               INT           NULL,
    admission_type            NVARCHAR(50)  NULL,
    billing_amount            DECIMAL(18,2) NULL,
    test_results              NVARCHAR(50)  NULL,
    hospital_id               INT           NOT NULL,
    hospital_name             NVARCHAR(200) NULL,
    hospital_latitude         FLOAT         NULL,
    hospital_longitude        FLOAT         NULL,
    doctor_id                 INT           NOT NULL,
    doctor_name               NVARCHAR(200) NULL,
    insurance_provider_id     INT           NOT NULL,
    insurance_provider_name   NVARCHAR(200) NULL,
    medical_condition_id      INT           NOT NULL,
    medical_condition_name    NVARCHAR(200) NULL,
    medication_id             INT           NOT NULL,
    medication_name           NVARCHAR(200) NULL
);
GO

------------------------------------------------
-- PatientDemographics
------------------------------------------------
IF OBJECT_ID('dbo.PatientDemographics', 'U') IS NOT NULL
    DROP TABLE dbo.PatientDemographics;
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.PatientDemographics (
    encounter_id           INT           NOT NULL,
    patient_id             NVARCHAR(50)  NOT NULL,
    age                    INT           NULL,
    gender                 NVARCHAR(10)  NULL,
    blood_type             NVARCHAR(5)   NULL,
    date_of_admission      DATE          NOT NULL,
    discharge_date         DATE          NULL,
    length_of_stay         INT           NULL,
    billing_amount         DECIMAL(18,2) NULL,
    test_results           NVARCHAR(50)  NULL,
    admission_type         NVARCHAR(50)  NULL,
    hospital_id            INT           NOT NULL,
    hospital_name          NVARCHAR(200) NULL,
    hospital_latitude      FLOAT         NULL,
    hospital_longitude     FLOAT         NULL,
    doctor_id              INT           NOT NULL,
    doctor_name            NVARCHAR(200) NULL,
    medical_condition_id   INT           NOT NULL,
    medical_condition_name NVARCHAR(200) NULL
);
GO

------------------------------------------------
-- YearlyKpi
------------------------------------------------
IF OBJECT_ID('dbo.YearlyKpi', 'U') IS NOT NULL
    DROP TABLE dbo.YearlyKpi;
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.YearlyKpi (
    [year]           INT           NULL,
    admitted_patients INT          NULL,
    rooms_beds       INT           NULL,
    doctors          INT           NULL,
    avg_length_of_stay FLOAT       NULL,
    avg_patient_age  FLOAT         NULL,
    total_billing    DECIMAL(38,2) NULL
);
GO
