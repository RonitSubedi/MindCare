package com.mindcare.controller;

import com.mindcare.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/landing")
public class LandingServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int counsellorCount = userDAO.countByRole("COUNSELLOR");
        int patientCount    = userDAO.countByRole("PATIENT");

        req.setAttribute("counsellorCount", counsellorCount);
        req.setAttribute("patientCount", patientCount);
        req.getRequestDispatcher("landing.jsp").forward(req, resp);
    }
}