DROP DATABASE IF EXISTS mindcare_db;
CREATE DATABASE mindcare_db;
USE mindcare_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('ADMIN', 'COUNSELLOR', 'PATIENT') NOT NULL,
    status ENUM('PENDING', 'APPROVED', 'REJECTED', 'ACTIVE', 'INACTIVE') DEFAULT 'ACTIVE',
    phone VARCHAR(20),
    specialization VARCHAR(100),
    license_number VARCHAR(100),
    experience_years INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE availabilities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    counsellor_id INT NOT NULL,
    available_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY (counsellor_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    counsellor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status ENUM('SCHEDULED', 'COMPLETED', 'CANCELLED') DEFAULT 'SCHEDULED',
    cancel_reason VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (counsellor_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE session_notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    counsellor_id INT NOT NULL,
    patient_id INT NOT NULL,
    notes TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES appointments(id) ON DELETE CASCADE,
    FOREIGN KEY (counsellor_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (patient_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ==========================================
-- Insert Mock Users (Password: admin123)
-- Hash mapping for 'admin123' -> $2a$10$L9UyHGTVO92t3ybZX.ca0uqyFrUogzKoNhsP2buuHTtDDDexOFNOO
-- ==========================================

-- Admin
INSERT INTO users (id, name, email, password, role, status) VALUES 
(1, 'Super Admin', 'admin@mindcare.com', '$2a$10$L9UyHGTVO92t3ybZX.ca0uqyFrUogzKoNhsP2buuHTtDDDexOFNOO', 'ADMIN', 'ACTIVE');

-- Counsellor
INSERT INTO users (id, name, email, password, role, status) VALUES 
(2, 'Dr. Smith', 'smith@mindcare.com', '$2a$10$L9UyHGTVO92t3ybZX.ca0uqyFrUogzKoNhsP2buuHTtDDDexOFNOO', 'COUNSELLOR', 'APPROVED');

-- Patient
INSERT INTO users (id, name, email, password, role, status) VALUES 
(3, 'John Doe', 'john@gmail.com', '$2a$10$L9UyHGTVO92t3ybZX.ca0uqyFrUogzKoNhsP2buuHTtDDDexOFNOO', 'PATIENT', 'ACTIVE');

-- Insert Counsellor Availability for tomorrow
INSERT INTO availabilities (counsellor_id, available_date, start_time, end_time) VALUES 
(2, CURDATE() + INTERVAL 1 DAY, '10:00:00', '14:00:00');

-- Insert Scheduled Appointment
INSERT INTO appointments (id, patient_id, counsellor_id, appointment_date, appointment_time, status) VALUES 
(1, 3, 2, CURDATE() + INTERVAL 1 DAY, '10:30:00', 'SCHEDULED');
