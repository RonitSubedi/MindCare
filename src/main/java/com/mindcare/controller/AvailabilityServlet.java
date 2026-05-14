package com.mindcare.controller;

import com.mindcare.dao.CounsellorDAO;
import com.mindcare.model.User;
import com.mindcare.model.Availability;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/availability")
public class AvailabilityServlet extends HttpServlet {
    private CounsellorDAO counsellorDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        counsellorDAO = new CounsellorDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if ("COUNSELLOR".equals(user.getRole())) {
                List<Availability> availabilities = counsellorDAO.getAvailabilities(user.getId());
                request.setAttribute("availabilities", availabilities);
            }
        }
        request.getRequestDispatcher("/counsellor-availability.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        com.mindcare.model.User user = (com.mindcare.model.User) session.getAttribute("user");
        if (!"COUNSELLOR".equals(user.getRole())) {
            response.sendRedirect("login");
            return;
        }

        int counsellorId = user.getId();
        String availableDate = request.getParameter("availableDate");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");

        boolean isSaved = counsellorDAO.saveAvailability(counsellorId, availableDate, startTime, endTime);

        if (isSaved) {
            request.setAttribute("successMessage", "Availability saved successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to save availability. Please try again.");
        }
        
        List<Availability> availabilities = counsellorDAO.getAvailabilities(counsellorId);
        request.setAttribute("availabilities", availabilities);

        request.getRequestDispatcher("/counsellor-availability.jsp").forward(request, response);
    }
}
