CREATE DATABASE IF NOT EXISTS mindcare_db;
USE mindcare_db;

CREATE TABLE IF NOT EXISTS users (
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

-- Insert default admin (password is: admin123)
INSERT IGNORE INTO users (name, email, password, role, status)
VALUES ('Super Admin', 'admin@mindcare.com',
'$2a$10$wN.d5G0YkOzO109C4yS87u.H11aC6Hq9e6K3IIn274G3g4W41Qx5e', 'ADMIN', 'ACTIVE');