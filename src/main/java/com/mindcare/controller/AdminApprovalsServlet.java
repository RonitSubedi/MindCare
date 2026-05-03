
package com.mindcare.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/admin/approvals")
public class AdminApprovalsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Security check
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 2. TODO: Fetch pending counsellor applications from DAO
        // Example (uncomment when DAO is ready):
        // AdminDAO adminDAO = new AdminDAO();
        // request.setAttribute("pendingCounsellors",  adminDAO.getPendingCounsellors());
        // request.setAttribute("approvedThisMonth",   adminDAO.getApprovedCountThisMonth());
        // request.setAttribute("avgResponseTimeHrs",  adminDAO.getAvgApprovalResponseTime());

        // 3. Check if there's a success/error message from a previous POST
        // (Set by the POST handler below after approve/reject action)
        String successMsg = (String) session.getAttribute("successMsg");
        String errorMsg   = (String) session.getAttribute("errorMsg");
        if (successMsg != null) {
            request.setAttribute("successMsg", successMsg);
            session.removeAttribute("successMsg");
        }
        if (errorMsg != null) {
            request.setAttribute("errorMsg", errorMsg);
            session.removeAttribute("errorMsg");
        }

        // 4. Forward to JSP
        request.getRequestDispatcher("/WEB-INF/admin-approvals.jsp")
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

        String action       = request.getParameter("action");       // "approve" or "reject"
        String counsellorId = request.getParameter("counsellorId"); // ID of the counsellor
        String rejectReason = request.getParameter("rejectReason"); // Only for reject

        // TODO: Call DAO to update counsellor status in DB
        // Example (uncomment when DAO is ready):
        // AdminDAO adminDAO = new AdminDAO();
        // if ("approve".equals(action)) {
        //     adminDAO.approveCounsellor(Integer.parseInt(counsellorId));
        //     session.setAttribute("successMsg", "Counsellor approved successfully.");
        // } else if ("reject".equals(action)) {
        //     adminDAO.rejectCounsellor(Integer.parseInt(counsellorId), rejectReason);
        //     session.setAttribute("successMsg", "Counsellor application rejected.");
        // }

        // Dummy feedback for now
        if ("approve".equals(action)) {
            session.setAttribute("successMsg", "Counsellor ID " + counsellorId + " approved.");
        } else if ("reject".equals(action)) {
            session.setAttribute("successMsg", "Counsellor ID " + counsellorId + " rejected. Reason: " + rejectReason);
        }

        // Post-Redirect-Get: redirect back to GET to avoid form resubmission
        response.sendRedirect(request.getContextPath() + "/admin/approvals");
    }
}
