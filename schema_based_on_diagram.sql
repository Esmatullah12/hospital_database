CREATE DATABASE hospital_db;

CREATE TABLE patients(
  id SERIAL PRIMARY KEY,
  name VARCHAR(150),
  date_of_birth DATE
);

CREATE TABLE medical_histories(
  id SERIAL PRIMARY KEY, 
  admitted_at TIMESTAMP, 
  patient_id INTEGER, 
  FOREIGN KEY (patient_id) REFERENCES patients(id), 
  status VARCHAR(255)
);

CREATE TABLE invoices(
  id SERIAL PRIMARY KEY, 
  total_amount DECIMAL, 
  generated_ad TIMESTAMP, 
  payed_at TIMESTAMP, 
  medical_history_id INTEGER, 
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE teatments(
  id SERIAL PRIMARY KEY,
  type VARCHAR(255),
  name VARCHAR(255)
);
