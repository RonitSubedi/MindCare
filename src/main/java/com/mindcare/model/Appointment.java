package com.mindcare.model;

import java.sql.Date;
import java.sql.Time;

public class Appointment {
    private int id;
    private int patientId;
    private int counsellorId;
    private Date appointmentDate;
    private Time appointmentTime;
    private String status;
    private String patientName; // For display purposes

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public int getPatientId() { return patientId; }
    public void setPatientId(int patientId) { this.patientId = patientId; }
    
    public int getCounsellorId() { return counsellorId; }
    public void setCounsellorId(int counsellorId) { this.counsellorId = counsellorId; }
    
    public Date getAppointmentDate() { return appointmentDate; }
    public void setAppointmentDate(Date appointmentDate) { this.appointmentDate = appointmentDate; }
    
    public Time getAppointmentTime() { return appointmentTime; }
    public void setAppointmentTime(Time appointmentTime) { this.appointmentTime = appointmentTime; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }
}
