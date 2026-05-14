package com.mindcare.model;

import java.sql.Date;
import java.sql.Time;

public class Availability {
    private int id;
    private int counsellorId;
    private Date availableDate;
    private Time startTime;
    private Time endTime;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public int getCounsellorId() { return counsellorId; }
    public void setCounsellorId(int counsellorId) { this.counsellorId = counsellorId; }
    
    public Date getAvailableDate() { return availableDate; }
    public void setAvailableDate(Date availableDate) { this.availableDate = availableDate; }
    
    public Time getStartTime() { return startTime; }
    public void setStartTime(Time startTime) { this.startTime = startTime; }
    
    public Time getEndTime() { return endTime; }
    public void setEndTime(Time endTime) { this.endTime = endTime; }
}
