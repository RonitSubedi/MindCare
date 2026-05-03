package com.mindcare.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Security check — only ADMIN role can access
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 2. TODO: Fetch real data from DAO and set as request attributes
        // Example (uncomment when DAO is ready):
        // AdminDAO adminDAO = new AdminDAO();
        // request.setAttribute("totalUsers",        adminDAO.getTotalUsers());
        // request.setAttribute("activeSessions",    adminDAO.getActiveSessions());
        // request.setAttribute("pendingApprovals",  adminDAO.getPendingApprovalCount());
        // request.setAttribute("recentActivities",  adminDAO.getRecentActivities(5));

        // 3. Forward to JSP inside WEB-INF
        request.getRequestDispatcher("/WEB-INF/admin-dashboard.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect POST to GET (Post-Redirect-Get pattern)
        doGet(request, response);
    }
}
