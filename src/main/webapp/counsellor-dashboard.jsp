<%@ page import="com.mindcare.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"COUNSELLOR".equals(user.getRole())) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counsellor Dashboard - MindCare</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="dashboard-layout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-header">MindCare Pro</div>
            <ul class="sidebar-nav">
                <li><a href="counsellor-dashboard" class="active">Dashboard</a></li>
                <li><a href="#">My schedule</a></li>
                <li><a href="#">Appointments</a></li>
                <li><a href="#">Patient History</a></li>
            </ul>
            <div style="margin-top: auto;">
                <a href="logout" class="btn btn-secondary">Sign Out</a>
            </div>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <header class="topbar">
                <h1>Welcome, Dr. <%= user.getName() %></h1>
                <div class="user-info">
                    <span style="background: var(--secondary); color: white; padding: 0.25rem 0.75rem; border-radius: 999px; font-size: 0.8rem;">Licensed Counsellor</span>
                </div>
            </header>

            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-title">Today's Sessions</div>
                    <div class="stat-value">5</div>
                </div>
                <div class="stat-card">
                    <div class="stat-title">Pending Requests</div>
                    <div class="stat-value" style="color: var(--accent);">3</div>
                </div>
                <div class="stat-card">
                    <div class="stat-title">Patient Rating</div>
                    <div class="stat-value" style="color: var(--primary);">4.9/5</div>
                </div>
            </div>

            <div style="background: white; padding: 2rem; border-radius: 1rem; box-shadow: var(--shadow-sm); border: 1px solid var(--border);">
                <h3 style="margin-bottom: 1rem; color: var(--primary);">Upcoming Appointments</h3>
                <p style="color: var(--text-muted);">Here you will manage your schedule, confirm sessions, and document private session notes.</p>
            </div>
        </main>
    </div>
</body>
</html>
