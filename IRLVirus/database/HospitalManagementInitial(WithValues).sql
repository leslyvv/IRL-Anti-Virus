CREATE DATABASE IF NOT EXISTS hdb;
CREATE TABLE person(
	user_id INT NOT NULL AUTO_INCREMENT,
    user_role VARCHAR(12),
    username VARCHAR(20) NOT NULL,
	user_password VARCHAR(80) NOT NULL,
    email VARCHAR(50),
    first_name VARCHAR(20),
    last_name VARCHAR(50),
    phone_number CHAR(10),
    date_of_birth DATE,
    age TINYINT UNSIGNED,
    street_address VARCHAR(50),
    state_address CHAR(2),
    zipcode_address VARCHAR(10),
    PRIMARY KEY (user_id)
);

CREATE TABLE disease(
	disease_id INT,
    disease_name VARCHAR(40),
    PRIMARY KEY (disease_id)
);
INSERT INTO disease(disease_id, disease_name) VALUES
(1, 'Flu'),
(2, 'COVID'),
(3, 'Pneumonia'),
(4, 'Malaria'),
(5, 'HIV/AIDS'),
(6, 'Tuberculosis'),
(7, 'E.coli'),
(8, 'Whooping Cough'),
(9, 'Common cold'),
(10, 'Lyme disease'),
(11, 'STDs'),
(12, "Asthma");
CREATE TABLE symptom(
	symptom_id INT,
    symptom_name VARCHAR(40),
    PRIMARY KEY (symptom_id)
);

INSERT INTO symptom (symptom_id, symptom_name) VALUES
(1,'Fever'),
(2,'Diarrhea'),
(3,'Fatigue'),
(4,'Muscle aches'),
(5,'Wheezing'),
(6,'Depression'),
(7,'Headache'),
(8,'Cough'),
(9,'Sore throat'),
(10,'Nausea'),
(11,'Vomiting'),
(12,'Runny nose'),
(13,'Stuffy nose'),
(14,'Chest pain'),
(15,'Rash'),
(16,'Shortness of breath'),
(17,'Joint pain'),
(18,'Weight loss or gain'),
(19,'Difficult sleeping'),
(20,'Memory problems or confusion'),
(21,'Change in bowel movements'),
(22,'Pelvic pain'),
(23, 'Dizziness'),
(24, 'Sudden numbness');


CREATE TABLE disease_symptom(
	disease_id INT,
    symptom_id INT,
    PRIMARY KEY (disease_id, symptom_id),
    FOREIGN KEY (disease_id) REFERENCES disease(disease_id),
    FOREIGN KEY (symptom_id) REFERENCES symptom(symptom_id)
);

INSERT INTO disease_symptom(disease_id, symptom_id) VALUES
(1, 1), -- Flu - Fever
(1, 7), -- Flu - Headache
(1, 8), -- Flu - Cough
(1, 9), -- Flu - Sore throat
(1, 10), -- Flu - Nausea
(1, 11), -- Flu - Vomiting
(1, 12), -- Flu - Runny nose
(1, 14), -- Flu - Chest pain

(2, 1), -- COVID - Fever
(2, 7), -- COVID - Headache
(2, 8), -- COVID - Cough
(2, 9), -- COVID - Sore throat
(2, 10), -- COVID - Nausea
(2, 11), -- COVID - Vomiting
(2, 12), -- COVID - Runny nose
(2, 16), -- COVID - Shortness of breath
(2, 20), -- COVID - Memory problems or confusion

(3, 1), -- Pneumonia - Fever
(3, 7), -- Pneumonia - Headache
(3, 8), -- Pneumonia - Cough
(3, 9), -- Pneumonia - Sore throat
(3, 10), -- Pneumonia - Nausea
(3, 11), -- Pneumonia - Vomiting
(3, 12), -- Pneumonia - Runny nose
(3, 14), -- Pneumonia - Chest pain
(3, 16), -- Pneumonia - Shortness of breath

(4, 1), -- Malaria - Fever
(4, 2), -- Malaria - Diarrhea
(4, 3), -- Malaria - Fatigue
(4, 4), -- Malaria - Muscle aches
(4, 10), -- Malaria - Nausea
(4, 11), -- Malaria - Vomiting

(5, 1), -- HIV/AIDS - Fever
(5, 3), -- HIV/AIDS - Fatigue
(5, 17), -- HIV/AIDS - Joint pain
(5, 18), -- HIV/AIDS - Weight loss or gain

(6, 1), -- Tuberculosis - Fever
(6, 3), -- Tuberculosis - Fatigue
(6, 8), -- Tuberculosis - Cough
(6, 16), -- Tuberculosis - Shortness of breath

(7, 2), -- E.coli - Diarrhea
(7, 3), -- E.coli - Fatigue
(7, 10), -- E.coli - Nausea

(8, 8), -- Whooping Cough - Cough
(8, 14), -- Whooping Cough - Chest pain

(9, 1), -- Common cold - Fever
(9, 7), -- Common cold - Headache
(9, 8), -- Common cold - Cough
(9, 9), -- Common cold - Sore throat
(9, 10), -- Common cold - Nausea
(9, 11), -- Common cold - Vomiting
(9, 12), -- Common cold - Runny nose
(9, 13), -- Common cold - Stuffy nose

(10, 15), -- Lyme disease - Rash
(10, 17), -- Lyme disease - Joint pain
(10, 18), -- Lyme disease - Weight loss or gain
(10, 20), -- Lyme disease - Memory problems or confusion

(11, 22), -- STDs - Pelvic pain
(11, 21), -- STDs - Change in bowel movements
(11, 15), -- STDs - Rash
(11, 18), -- STDs - Weight loss or gain
(11, 20), -- STDs - Memory problems or confusion

(12, 5), -- Asthma - Shortness of breath
(12, 8), -- Asthma - Cough
(12, 14); -- Asthma - Chest pain

CREATE TABLE insurance(
	insurance_id INT AUTO_INCREMENT,
    insurance_name VARCHAR(50),
    insurance_phone CHAR(10),
    street_address VARCHAR(50),
    state_address CHAR(2),
    zipcode_address VARCHAR(10),
    co_pay DECIMAL(10,2),
    PRIMARY KEY (insurance_id)
);

INSERT INTO insurance (insurance_id, insurance_name, insurance_phone, street_address, state_address, zipcode_address, co_pay) VALUES 
(1,'Affordable Medicare Solutions','7709455261','3525 Suwanee Rd, Suwannee', 'GA','30024', 100.00),
(2,'Healthcare Providers','4048926233','4519 Health Ct, Canton', 'GA', '3899', 250.00),
(3, 'Primary Health', '8888198423','4444 Concern Valley, San Antonio', 'TX', '42332', 50.00);

CREATE TABLE patient(
	user_id INT NOT NULL,
	patient_id INT NOT NULL AUTO_INCREMENT,
    SSN VARCHAR(11),
    Gender CHAR(1),
    insurance_id INT,
    isInsured BOOLEAN,
    severity_level VARCHAR(8),
    isVIP BOOLEAN,
    medical_history VARCHAR(255),
    PRIMARY KEY (patient_id),
    FOREIGN KEY (user_id) REFERENCES person(user_id),
    FOREIGN KEY (insurance_id) REFERENCES insurance(insurance_id),
    CONSTRAINT unique_user_id UNIQUE (user_id)
);


CREATE TABLE patient_symptom(
    patient_id INT NOT NULL,
    symptom_id INT,
    PRIMARY KEY (patient_id, symptom_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (symptom_id) REFERENCES symptom(symptom_id)
);



CREATE TABLE hospital(
	hospital_id INT AUTO_INCREMENT,
    hospital_name VARCHAR(50),
    street_address VARCHAR(50),
    state_address CHAR(2),
    zipcode_address VARCHAR(10),
    phone_number CHAR(10),
    PRIMARY KEY (hospital_id)
);

CREATE TABLE receptionist (
    user_id INT NOT NULL,
    hospital_id INT,
    receptionist_id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (receptionist_id),
    UNIQUE(user_id),
    FOREIGN KEY (user_id) REFERENCES person(user_id),
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)
);

CREATE TABLE doctor(
	user_id INT NOT NULL,
    hospital_id INT,
	doctor_id INT NOT NULL AUTO_INCREMENT,
    specialization VARCHAR(30),
    PRIMARY KEY (doctor_id),
    UNIQUE(user_id),
    FOREIGN KEY (user_id) REFERENCES person(user_id),
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)
);


CREATE TABLE doctor_availability(
    availability_id INT AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    day_of_week VARCHAR(20),
    start_time TIME,
    end_time TIME,
    PRIMARY KEY (availability_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

CREATE TABLE room(
    hospital_id INT,
    room_number INT NOT NULL,
    PRIMARY KEY (room_number, hospital_id),
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)
);


CREATE TABLE appointment(
    appointment_id INT AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    hospital_id INT,
    room_number INT,
    start_time TIME,
    end_time TIME,
    appointment_fee DECIMAL(10,2),
    PRIMARY KEY (appointment_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id),
    FOREIGN KEY (room_number) REFERENCES room(room_number)
);


CREATE TABLE doctor_disease (
    doctor_id INT NOT NULL,
    disease_id INT NOT NULL,
    PRIMARY KEY (doctor_id, disease_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY (disease_id) REFERENCES disease(disease_id)
);

CREATE TABLE prescription(
	prescription_id INT AUTO_INCREMENT,
	doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    medicine_name VARCHAR(20),
    dosage_desc VARCHAR(20),
    prescription_fee DECIMAL(10,2),
    additional_notes VARCHAR(255),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    PRIMARY KEY (prescription_id)
);

CREATE TABLE billing(
	billing_id INT AUTO_INCREMENT,
    patient_id INT NOT NULL,
    appointment_id INT,
    prescription_id INT NULL,
    insurance_id INT NULL,
    total_fee DECIMAL(10,2),
    bill_date TIMESTAMP,
    bill_due DATE,
    PRIMARY KEY (billing_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id),
    FOREIGN KEY (prescription_id) REFERENCES prescription(prescription_id),
    FOREIGN KEY (insurance_id) REFERENCES insurance(insurance_id)
);  

CREATE TABLE payment(
	payment_id INT AUTO_INCREMENT,
	patient_id INT NOT NULL,
    billing_id INT,
    payment_date TIMESTAMP,
    payment_amount DECIMAL(10,2),
    payment_card_type VARCHAR(25),
    payment_card VARCHAR(120),
    PRIMARY KEY (payment_id),
	FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (billing_id) REFERENCES billing(billing_id)
);