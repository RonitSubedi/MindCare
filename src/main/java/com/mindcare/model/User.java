package com.mindcare.model;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String role; // 'ADMIN', 'COUNSELLOR', 'PATIENT'
    private String status; // 'PENDING', 'APPROVED', 'REJECTED', 'ACTIVE', 'INACTIVE'
    
    // Additional fields for specific roles can be kept here or in separate tables
    // To keep it simple, we use a single User class for common auth fields
    private String phone;
    private String specialization; // For counsellor
    private String licenseNumber; // For counsellor
    private int experienceYears; // For counsellor

    public User() {}

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }
    public String getLicenseNumber() { return licenseNumber; }
    public void setLicenseNumber(String licenseNumber) { this.licenseNumber = licenseNumber; }
    public int getExperienceYears() { return experienceYears; }
    public void setExperienceYears(int experienceYears) { this.experienceYears = experienceYears; }
}
