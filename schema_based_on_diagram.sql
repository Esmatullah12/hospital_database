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

CREATE TABLE treatments(
  id SERIAL PRIMARY KEY,
  type VARCHAR(255),
  name VARCHAR(255)
);

CREATE TABLE invoice_items(
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INTEGER,
  total_price DECIMAL,
  invoice_id INTEGER,
  treatment_id INTEGER,
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE medical_histories_has_treatment(
  medical_history_id INTEGER, 
  treatment_id INTEGER, 
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id), 
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE INDEX idx_medical_histories_patient_id ON medical_histories(patient_id);
CREATE INDEX idx_invoices_history_id ON invoices(medical_history_id);
CREATE INDEX idx_invoice_items_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_invoice_items_treatment_id ON invoice_items(treatment_id);
CREATE INDEX idx_medical_histories_has_treatment_medical_history_id ON medical_histories_has_treatment(medical_history_id);
CREATE INDEX idx_medical_histories_has_treatment_treatment_id On medical_histories_has_treatment(treatment_id);
