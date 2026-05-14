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
    <title>Availability Settings - MindCare</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="dashboard-layout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-header">MindCare<br><span style="font-size: 0.75rem; color: var(--text-muted); font-weight: 500;">CLINICAL PORTAL</span></div>
            <ul class="sidebar-nav">
                <li><a href="counsellor-dashboard"><i class="icon">📊</i> Dashboard</a></li>
                <li><a href="availability" class="active"><i class="icon">📅</i> Availability</a></li>
                <li><a href="#"><i class="icon">📝</i> Appointments</a></li>
                <li><a href="#"><i class="icon">🕒</i> Patient History</a></li>
                <li><a href="#"><i class="icon">📄</i> Session Notes</a></li>
            </ul>
            <div style="margin-top: auto;">
                <button class="btn-start-session">Start Session</button>
                <div class="sidebar-footer">
                    <a href="#"><i class="icon">⚙️</i> Settings</a>
                    <a href="#"><i class="icon">❓</i> Support</a>
                    <a href="logout" style="margin-top: 10px; color: #e74c3c;"><i class="icon">🚪</i> Logout</a>
                </div>
            </div>
        </aside>

        <!-- Main Content -->
        <main class="main-content" style="background-color: var(--bg-color);">
            <header class="topbar">
                <h1 class="topbar-title" style="font-size: 1rem; font-weight: 500; color: var(--text-muted);">Availability Settings</h1>
                <div class="topbar-actions">
                    <input type="text" class="search-bar" placeholder="Search calendar...">
                    <span style="font-size: 1.2rem; cursor: pointer;">🔔</span>
                    <div class="user-avatar"></div>
                </div>
            </header>

            <div class="availability-header" style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 2rem;">
                <div class="availability-title">
                    <h2 style="font-size: 1.5rem; margin-bottom: 0.5rem;">Weekly Working Hours</h2>
                    <p style="color: var(--text-muted); max-width: 600px; font-size: 0.875rem;">Define your standard availability for recurring weekly appointments. These hours will be reflected in the patient booking portal.</p>
                </div>
                <div class="availability-actions" style="display: flex; gap: 1rem;">
                </div>
            </div>

            <div class="grid-container" style="grid-template-columns: 2fr 1fr; gap: 2rem; display: grid;">
                <div class="left-col">
                    <div class="working-hours-container" style="background: white; border-radius: 8px; padding: 2rem; border: 1px solid var(--border); margin-bottom: 1.5rem;">
                        <h3 style="margin-bottom: 1.5rem; font-size: 1.25rem;">Add New Schedule</h3>
                        <form action="availability" method="POST">
                            <% if (request.getAttribute("successMessage") != null) { %>
                                <p style="color: green; margin-bottom: 1rem;"><%= request.getAttribute("successMessage") %></p>
                            <% } %>
                            <% if (request.getAttribute("errorMessage") != null) { %>
                                <p style="color: red; margin-bottom: 1rem;"><%= request.getAttribute("errorMessage") %></p>
                            <% } %>
                        
                            <div class="day-row" style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 1.5rem; border-bottom: 1px solid #f1f5f9; padding-bottom: 1.5rem;">
                                <div class="time-inputs" style="display: flex; align-items: center; gap: 1rem; width: 100%;">
                                    <label style="font-weight: 500;">Date:</label>
                                    <input type="date" name="availableDate" required class="time-select" style="padding: 0.5rem; border: 1px solid var(--border); border-radius: 4px; flex-grow: 1;">
                                    
                                    <label style="font-weight: 500;">Start Time:</label>
                                    <input type="time" name="startTime" required class="time-select" style="padding: 0.5rem; border: 1px solid var(--border); border-radius: 4px;">
                                    
                                    <span style="color: var(--text-muted); font-size: 0.875rem;">TO</span>
                                    
                                    <label style="font-weight: 500;">End Time:</label>
                                    <input type="time" name="endTime" required class="time-select" style="padding: 0.5rem; border: 1px solid var(--border); border-radius: 4px;">
                                    
                                    <button type="submit" class="btn-primary" style="background-color: #0F172A; color: white; border: none; padding: 0.5rem 1.5rem; border-radius: 4px; font-weight: 500; cursor: pointer;">Save</button>
                                </div>
                            </div>
                        </form>

                        <h3 style="margin-top: 2rem; margin-bottom: 1rem; font-size: 1.25rem;">Your active schedule</h3>
                        <div class="schedule-list">
                        <%
                            java.util.List<com.mindcare.model.Availability> availabilities = (java.util.List<com.mindcare.model.Availability>) request.getAttribute("availabilities");
                            if (availabilities != null && !availabilities.isEmpty()) {
                                for (com.mindcare.model.Availability a : availabilities) {
                        %>
                            <div class="schedule-item" style="grid-template-columns: 100px 1fr auto; background: #f8fafc; padding: 1rem; border-radius: 6px; border: 1px solid var(--border); margin-bottom: 0.5rem; display: grid; align-items: center; gap: 1rem;">
                                <div class="schedule-time" style="color: #0F172A; font-weight: 600;"><%= a.getAvailableDate() %></div>
                                <div class="schedule-card" style="border-left: none; box-shadow: none; border-radius: 0; padding: 0;">
                                    <div class="schedule-patient">Slot: <%= a.getStartTime() %> - <%= a.getEndTime() %></div>
                                </div>
                                <form action="availability" method="POST" style="margin: 0;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="<%= a.getId() %>">
                                    <button type="submit" style="background: none; border: none; color: #e74c3c; cursor: pointer; font-size: 1rem;" title="Delete">🗑️</button>
                                </form>
                            </div>
                        <%
                                }
                            } else {
                        %>
                            <div style="color: var(--text-muted); font-style: italic;">No schedules set up yet.</div>
                        <%  } %>
                        </div>
                    </div>

                    <div class="break-planner" style="background-color: #1E3A8A; color: white; padding: 2rem; border-radius: 8px;">
                        <h3 style="margin-bottom: 0.5rem; font-size: 1.125rem;">Planning a break?</h3>
                        <p style="margin-bottom: 1.5rem; font-size: 0.875rem; opacity: 0.9; max-width: 400px;">Set temporary unavailable dates for holidays or personal leave without changing your weekly recurring schedule.</p>
                        <button class="btn-white" style="background: white; color: #1E3A8A; border: none; padding: 0.5rem 1rem; border-radius: 4px; font-weight: 600; cursor: pointer;">Add Date Override</button>
                    </div>
                </div>

                <div class="right-col">
                    <div style="background: white; border-radius: 8px; border: 1px solid var(--border); overflow: hidden; margin-bottom: 1.5rem;">
                        <div style="padding: 1.5rem;">
                            <h4 style="margin-bottom: 1rem; font-size: 0.875rem; color: var(--text-muted);">Filter Schedules</h4>
                            <form action="availability" method="GET">
                                <p style="font-size: 0.75rem; font-weight: 600; margin-bottom: 0.5rem; color: var(--text-muted);">FROM DATE</p>
                                <input type="date" name="fromDate" value="<%= request.getParameter("fromDate") != null ? request.getParameter("fromDate") : "" %>" style="width: 100%; padding: 0.5rem; border: 1px solid var(--border); border-radius: 4px; margin-bottom: 1.5rem; box-sizing: border-box;">
                                
                                <p style="font-size: 0.75rem; font-weight: 600; margin-bottom: 0.5rem; color: var(--text-muted);">TO DATE</p>
                                <input type="date" name="toDate" value="<%= request.getParameter("toDate") != null ? request.getParameter("toDate") : "" %>" style="width: 100%; padding: 0.5rem; border: 1px solid var(--border); border-radius: 4px; margin-bottom: 1.5rem; box-sizing: border-box;">

                                <button type="submit" style="width: 100%; background: #0F172A; color: white; border: none; padding: 0.5rem; border-radius: 4px; font-weight: 500; cursor: pointer;">Apply Filter</button>
                                <a href="availability" style="display: block; text-align: center; margin-top: 1rem; font-size: 0.875rem; color: var(--text-muted); text-decoration: none;">Clear Filter</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>