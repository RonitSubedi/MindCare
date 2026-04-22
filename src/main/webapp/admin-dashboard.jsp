<%@ page import="com.mindcare.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - MindCare</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="dashboard-layout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-header">MindCare Admin</div>
            <ul class="sidebar-nav">
                <li><a href="admin-dashboard" class="active">Dashboard</a></li>
                <li><a href="#">User Management</a></li>
                <li><a href="#">Approvals</a></li>
                <li><a href="#">Resource Library</a></li>
                <li><a href="#">System Reports</a></li>
            </ul>
            <div style="margin-top: auto;">
                <a href="logout" class="btn btn-secondary">Sign Out</a>
            </div>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <header class="topbar">
                <h1>Overview</h1>
                <div class="user-info">
                    <span style="font-weight: 600;"><%= user.getName() %></span>
                    <span style="background: var(--primary); color: white; padding: 0.25rem 0.75rem; border-radius: 999px; font-size: 0.8rem;">Admin</span>
                </div>
            </header>

            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-title">Total Active Users</div>
                    <div class="stat-value">1,248</div>
                </div>
                <div class="stat-card">
                    <div class="stat-title">Pending Approvals</div>
                    <div class="stat-value" style="color: var(--accent);">15</div>
                </div>
                <div class="stat-card">
                    <div class="stat-title">Sessions Today</div>
                    <div class="stat-value" style="color: var(--secondary);">42</div>
                </div>
            </div>

            <div style="background: white; padding: 2rem; border-radius: 1rem; box-shadow: var(--shadow-sm); border: 1px solid var(--border);">
                <h3 style="margin-bottom: 1rem; color: var(--primary);">Recent Activity</h3>
                <p style="color: var(--text-muted);">Administrative dashboard features will be rendered here, including user management tables, charts of platform-wide mood trends, and appointment ratios.</p>
            </div>
        </main>
    </div>
</body>
</html>
