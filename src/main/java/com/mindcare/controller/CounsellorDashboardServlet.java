package com.mindcare.controller;

import com.mindcare.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/counsellor-dashboard")
public class CounsellorDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if ("COUNSELLOR".equals(user.getRole())) {
                req.getRequestDispatcher("counsellor-dashboard.jsp").forward(req, resp);
                return;
            }
        }
        resp.sendRedirect("login");
    }
}
