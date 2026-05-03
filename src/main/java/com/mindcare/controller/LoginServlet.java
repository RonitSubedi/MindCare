package com.mindcare.controller;

import com.mindcare.dao.UserDAO;
import com.mindcare.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = userDAO.login(email, password);

        if (user != null) {
            if ("PENDING".equals(user.getStatus())) {
                req.setAttribute("errorMessage", "Your account is pending admin approval.");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
                return;
            } else if ("REJECTED".equals(user.getStatus()) || "INACTIVE".equals(user.getStatus())) {
                req.setAttribute("errorMessage", "Your account is inactive or rejected.");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
                return;
            }

            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());

            switch (user.getRole()) {
                case "ADMIN":
                    resp.sendRedirect(req.getContextPath() + "admin-dashboard");
                    break;
                case "COUNSELLOR":
                    resp.sendRedirect("counsellor-dashboard");
                    break;
                case "PATIENT":
                    resp.sendRedirect("patient-dashboard");
                    break;
                default:
                    resp.sendRedirect("index.jsp");
            }
        } else {
            req.setAttribute("errorMessage", "Invalid email or password.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
