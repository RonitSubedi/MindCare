package com.mindcare.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/admin/resources")
public class AdminResourcesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Security check
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 2. Read filter params
        // e.g. /admin/resources?category=anxiety&type=Article&search=breathing
        String category = request.getParameter("category"); // "anxiety", "depression", etc.
        String type     = request.getParameter("type");     // "Article", "Video", etc.
        String search   = request.getParameter("search");

        request.setAttribute("categoryFilter", category);
        request.setAttribute("typeFilter",     type);
        request.setAttribute("searchQuery",    search);

        // 3. TODO: Fetch resources from DAO
        // Example (uncomment when DAO is ready):
        // ResourceDAO resourceDAO = new ResourceDAO();
        // request.setAttribute("resources", resourceDAO.getResources(category, type, search));

        // 4. Flash messages
        String successMsg = (String) session.getAttribute("successMsg");
        if (successMsg != null) {
            request.setAttribute("successMsg", successMsg);
            session.removeAttribute("successMsg");
        }

        // 5. Forward to JSP
        request.getRequestDispatcher("/WEB-INF/admin-resources.jsp")
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

        String action     = request.getParameter("action");     // "add", "edit", "delete", "publish", "unpublish"
        String resourceId = request.getParameter("resourceId");

        // TODO: Connect to ResourceDAO
        // ResourceDAO resourceDAO = new ResourceDAO();

        switch (action != null ? action : "") {

            case "add":
                String title    = request.getParameter("title");
                String category = request.getParameter("category");
                String resType  = request.getParameter("type");
                String content  = request.getParameter("content");
                String readTime = request.getParameter("readTime");
                String status   = request.getParameter("status"); // "Published" or "Draft"
                // resourceDAO.addResource(title, category, resType, content, readTime, status);
                session.setAttribute("successMsg", "Resource '" + title + "' added successfully.");
                break;

            case "edit":
                String editTitle   = request.getParameter("title");
                String editContent = request.getParameter("content");
                // resourceDAO.updateResource(Integer.parseInt(resourceId), editTitle, editContent, ...);
                session.setAttribute("successMsg", "Resource updated successfully.");
                break;

            case "delete":
                // resourceDAO.deleteResource(Integer.parseInt(resourceId));
                session.setAttribute("successMsg", "Resource ID " + resourceId + " deleted.");
                break;

            case "publish":
                // resourceDAO.setPublishStatus(Integer.parseInt(resourceId), "Published");
                session.setAttribute("successMsg", "Resource published successfully.");
                break;

            case "unpublish":
                // resourceDAO.setPublishStatus(Integer.parseInt(resourceId), "Draft");
                session.setAttribute("successMsg", "Resource unpublished (saved as Draft).");
                break;

            default:
                session.setAttribute("errorMsg", "Unknown action.");
        }

        // Post-Redirect-Get
        response.sendRedirect(request.getContextPath() + "/admin/resources");
    }
}
