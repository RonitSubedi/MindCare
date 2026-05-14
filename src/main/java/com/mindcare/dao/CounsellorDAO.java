package com.mindcare.dao;

import com.mindcare.model.Appointment;
import com.mindcare.model.Availability;
import com.mindcare.util.DBConnection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class CounsellorDAO {

    // Save Counsellor Availability
    public boolean saveAvailability(int counsellorId, String availableDate, String startTime, String endTime) {
        String sql = "INSERT INTO availabilities (counsellor_id, available_date, start_time, end_time) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, counsellorId);
            stmt.setDate(2, Date.valueOf(availableDate));
            stmt.setTime(3, Time.valueOf(startTime + ":00"));
            stmt.setTime(4, Time.valueOf(endTime + ":00"));
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get availabilities
    public List<Availability> getAvailabilities(int counsellorId, String fromDate, String toDate) {
        List<Availability> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM availabilities WHERE counsellor_id = ?");
        
        if (fromDate != null && !fromDate.trim().isEmpty()) {
            sql.append(" AND available_date >= ?");
        }
        if (toDate != null && !toDate.trim().isEmpty()) {
            sql.append(" AND available_date <= ?");
        }
        sql.append(" ORDER BY available_date ASC, start_time ASC");
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {
            
            int paramIndex = 1;
            stmt.setInt(paramIndex++, counsellorId);
            
            if (fromDate != null && !fromDate.trim().isEmpty()) {
                stmt.setDate(paramIndex++, Date.valueOf(fromDate));
            }
            if (toDate != null && !toDate.trim().isEmpty()) {
                stmt.setDate(paramIndex++, Date.valueOf(toDate));
            }
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Availability a = new Availability();
                a.setId(rs.getInt("id"));
                a.setCounsellorId(rs.getInt("counsellor_id"));
                a.setAvailableDate(rs.getDate("available_date"));
                a.setStartTime(rs.getTime("start_time"));
                a.setEndTime(rs.getTime("end_time"));
                list.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Availability> getAvailabilities(int counsellorId) {
        return getAvailabilities(counsellorId, null, null);
    }

    // Delete Availability
    public boolean deleteAvailability(int id, int counsellorId) {
        String sql = "DELETE FROM availabilities WHERE id = ? AND counsellor_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.setInt(2, counsellorId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Upcoming Appointments for a Counsellor
    public List<Appointment> getUpcomingAppointments(int counsellorId) {
        List<Appointment> appointments = new ArrayList<>();
        String sql = "SELECT a.id, a.appointment_date, a.appointment_time, a.status, u.name AS patient_name " +
                     "FROM appointments a " +
                     "JOIN users u ON a.patient_id = u.id " +
                     "WHERE a.counsellor_id = ? AND a.status = 'SCHEDULED' " +
                     "ORDER BY a.appointment_date ASC, a.appointment_time ASC";
                     
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, counsellorId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Appointment appt = new Appointment();
                appt.setId(rs.getInt("id"));
                appt.setAppointmentDate(rs.getDate("appointment_date"));
                appt.setAppointmentTime(rs.getTime("appointment_time"));
                appt.setStatus(rs.getString("status"));
                appt.setPatientName(rs.getString("patient_name"));
                appointments.add(appt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }

    // Get Total Sessions Completed
    public int getTotalSessionsCompleted(int counsellorId) {
        String sql = "SELECT COUNT(*) FROM appointments WHERE counsellor_id = ? AND status = 'COMPLETED'";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, counsellorId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Get Active Patients
    public int getActivePatientsCount(int counsellorId) {
        String sql = "SELECT COUNT(DISTINCT patient_id) FROM appointments WHERE counsellor_id = ? AND status IN ('SCHEDULED', 'COMPLETED')";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, counsellorId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
