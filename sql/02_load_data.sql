-- =========================================
-- LOAD CSV DATA INTO SQL SERVER
-- =========================================

DECLARE @dataPath VARCHAR(500) = DECLARE @dataPath VARCHAR(500) = '<<< UPDATE LOCAL PATH HERE >>>';


-- Use CRLF or 0x0a depending on how the CSVs were saved.
-- From Notepad screenshots, CRLF is likely correct.
DECLARE @rowTerm NVARCHAR(10) = '\r\n';

-------------------------
-- Patients
-------------------------
BULK INSERT dbo.Patients
FROM @dataPath + 'patients.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR   = @rowTerm
);

-------------------------
-- Doctors
-------------------------
BULK INSERT dbo.Doctors
FROM @dataPath + 'doctors.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR   = @rowTerm
);

-------------------------
-- Hospitals
-------------------------
BULK INSERT dbo.Hospitals
FROM @dataPath + 'hospitals.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR   = @rowTerm
);

-------------------------
-- Medical Conditions
-------------------------
BULK INSERT dbo.MedicalConditions
FROM @dataPath + 'medical_conditions.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR   = @rowTerm
);

-------------------------
-- Medications
-------------------------
BULK INSERT dbo.Medications
FROM @dataPath + 'medications.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR   = @rowTerm
);

-------------------------
-- Insurance Providers
-------------------------
BULK INSERT dbo.InsuranceProviders
FROM @dataPath + 'insurance_providers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR   = @rowTerm
);

-------------------------
-- Encounters
-------------------------
BULK INSERT dbo.Encounters
FROM @dataPath + 'encounters.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR   = @rowTerm
);


