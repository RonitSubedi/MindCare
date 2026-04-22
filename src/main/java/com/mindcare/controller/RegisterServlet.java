package com.mindcare.controller;

import com.mindcare.dao.UserDAO;
import com.mindcare.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = new User();

        user.setName(req.getParameter("name"));
        user.setEmail(req.getParameter("email"));
        user.setPassword(req.getParameter("password"));
        user.setRole(req.getParameter("role"));

        // GLOBAL PHONE FIX
        String countryCode = req.getParameter("countryCode");
        String phone = req.getParameter("phone");

        if (countryCode != null && phone != null) {
            user.setPhone(countryCode + phone); // final global format
        }

        //  ROLE-BASED LOGIC
        if ("COUNSELLOR".equals(user.getRole())) {
            user.setSpecialization(req.getParameter("specialization"));
            user.setLicenseNumber(req.getParameter("licenseNumber"));

            String exp = req.getParameter("experienceYears");
            if (exp != null && !exp.trim().isEmpty()) {
                try {
                    user.setExperienceYears(Integer.parseInt(exp));
                } catch (NumberFormatException e) {
                    req.setAttribute("errorMessage", "Invalid experience value.");
                    req.getRequestDispatcher("register.jsp").forward(req, resp);
                    return;
                }
            }
        }

        // SAVE USER
        boolean success = userDAO.registerUser(user);

        if (success) {
            req.setAttribute("successMessage", "Registration successful. Please login.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            req.setAttribute("errorMessage", "Registration failed. Please try again.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}