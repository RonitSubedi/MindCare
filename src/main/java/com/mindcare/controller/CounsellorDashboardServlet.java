package com.mindcare.controller;

import com.mindcare.model.User;
import com.mindcare.dao.CounsellorDAO;
import com.mindcare.model.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/counsellor-dashboard")
public class CounsellorDashboardServlet extends HttpServlet {
    private CounsellorDAO counsellorDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        counsellorDAO = new CounsellorDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if ("COUNSELLOR".equals(user.getRole())) {
                List<Appointment> upcomingAppointments = counsellorDAO.getUpcomingAppointments(user.getId());
                int totalSessions = counsellorDAO.getTotalSessionsCompleted(user.getId());
                int activePatients = counsellorDAO.getActivePatientsCount(user.getId());
                
                req.setAttribute("appointments", upcomingAppointments);
                req.setAttribute("totalSessions", totalSessions);
                req.setAttribute("activePatients", activePatients);
                
                req.getRequestDispatcher("counsellor-dashboard.jsp").forward(req, resp);
                return;
            }
        }
        resp.sendRedirect("login");
    }
}
