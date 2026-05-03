package com.mindcare.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/admin/users")
public class AdminUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Security check
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 2. Read optional filter params from URL query string
        // e.g. /admin/users?role=counsellor&status=Active&search=Sarah
        String roleFilter   = request.getParameter("role");   // "patient", "counsellor", or null = all
        String statusFilter = request.getParameter("status"); // "Active", "Pending", "Suspended", or null
        String searchQuery  = request.getParameter("search"); // free text search

        // Pass filter values back to JSP so dropdowns/tabs stay selected
        request.setAttribute("roleFilter",   roleFilter);
        request.setAttribute("statusFilter", statusFilter);
        request.setAttribute("searchQuery",  searchQuery);

        // 3. TODO: Fetch users from DAO using filters
        // Example (uncomment when DAO is ready):
        // AdminDAO adminDAO = new AdminDAO();
        // request.setAttribute("users",          adminDAO.getUsers(roleFilter, statusFilter, searchQuery));
        // request.setAttribute("totalUsers",     adminDAO.getTotalUserCount());
        // request.setAttribute("totalCounsellors", adminDAO.getCounsellorCount());
        // request.setAttribute("totalPatients",  adminDAO.getPatientCount());
        // request.setAttribute("suspendedCount", adminDAO.getSuspendedCount());

        // 4. Flash messages from POST
        String successMsg = (String) session.getAttribute("successMsg");
        if (successMsg != null) {
            request.setAttribute("successMsg", successMsg);
            session.removeAttribute("successMsg");
        }

        // 5. Forward to JSP
        request.getRequestDispatcher("/WEB-INF/admin-users.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Security check
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action"); // "suspend", "activate", "delete", "register"
        String userId = request.getParameter("userId");

        // TODO: Connect to DAO for real DB operations
        // AdminDAO adminDAO = new AdminDAO();

        switch (action != null ? action : "") {

            case "suspend":
                // adminDAO.suspendUser(Integer.parseInt(userId));
                session.setAttribute("successMsg", "User ID " + userId + " has been suspended.");
                break;

            case "activate":
                // adminDAO.activateUser(Integer.parseInt(userId));
                session.setAttribute("successMsg", "User ID " + userId + " has been activated.");
                break;

            case "delete":
                // adminDAO.deleteUser(Integer.parseInt(userId));
                session.setAttribute("successMsg", "User ID " + userId + " has been deleted.");
                break;

            case "register":
                // Collect new user form fields
                String fullName = request.getParameter("fullName");
                String email    = request.getParameter("email");
                String phone    = request.getParameter("phone");
                String role     = request.getParameter("role");
                String password = request.getParameter("password");
                // adminDAO.registerUser(fullName, email, phone, role, password);
                session.setAttribute("successMsg", "New user '" + fullName + "' registered successfully.");
                break;

            default:
                session.setAttribute("errorMsg", "Unknown action.");
        }

        // Post-Redirect-Get
        response.sendRedirect(request.getContextPath() + "/admin/users");
    }
}
