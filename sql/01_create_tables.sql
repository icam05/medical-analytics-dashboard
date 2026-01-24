-- =========================================
-- CREATE TABLES FOR HEALTH ANALYTICS PROJECT
-- =========================================

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    gender VARCHAR(10),
    date_of_birth DATE,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    zip_code VARCHAR(20)
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    specialty VARCHAR(100)
);

CREATE TABLE hospitals (
    hospital_id INT PRIMARY KEY,
    hospital_name VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50)
);

CREATE TABLE medical_conditions (
    condition_id INT PRIMARY KEY,
    medical_condition VARCHAR(255)
);

CREATE TABLE medications (
    medication_id INT PRIMARY KEY,
    medication_name VARCHAR(255)
);

CREATE TABLE insurance_providers (
    provider_id INT PRIMARY KEY,
    provider_name VARCHAR(255)
);

CREATE TABLE encounters (
    encounter_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    hospital_id INT,
    condition_id INT,
    medication_id INT,
    provider_id INT,
    date_of_admission DATE,
    date_of_discharge DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (hospital_id) REFERENCES hospitals(hospital_id),
    FOREIGN KEY (condition_id) REFERENCES medical_conditions(condition_id),
    FOREIGN KEY (medication_id) REFERENCES medications(medication_id),
    FOREIGN KEY (provider_id) REFERENCES insurance_providers(provider_id)
);

