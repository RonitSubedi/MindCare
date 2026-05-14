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
    <title>Dashboard Overview - MindCare</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="dashboard-layout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-header">MindCare<br><span style="font-size: 0.75rem; color: var(--text-muted); font-weight: 500;">CLINICAL PORTAL</span></div>
            <ul class="sidebar-nav">
                <li><a href="counsellor-dashboard" class="active"><i class="icon">📊</i> Dashboard</a></li>
                <li><a href="availability"><i class="icon">📅</i> Availability</a></li>
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
                <h1 class="topbar-title">Dashboard Overview</h1>
                <div class="topbar-actions">
                    <input type="text" class="search-bar" placeholder="Search patients or notes...">
                    <span style="font-size: 1.2rem; cursor: pointer;">🔔</span>
                    <div class="user-avatar"></div>
                </div>
            </header>

            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon" style="background-color: #E0E7FF; color: #4F46E5;">👥</div>
                        <span class="stat-trend trend-up">+12%</span>
                    </div>
                    <div class="stat-value"><%= request.getAttribute("totalSessions") != null ? request.getAttribute("totalSessions") : 0 %></div>
                    <div class="stat-title">Total Sessions</div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon" style="background-color: #D1FAE5; color: #10B981;">👤</div>
                        <span class="stat-trend trend-up">+3</span>
                    </div>
                    <div class="stat-value"><%= request.getAttribute("activePatients") != null ? request.getAttribute("activePatients") : 0 %></div>
                    <div class="stat-title">Active Patients</div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon" style="background-color: #EDE9FE; color: #8B5CF6;">⭐</div>
                        <span class="stat-trend">Stable</span>
                    </div>
                    <div class="stat-value">4.92</div>
                    <div class="stat-title">Average Rating</div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon" style="background-color: #FEE2E2; color: #EF4444;">📅</div>
                        <span class="stat-trend trend-down">High</span>
                    </div>
                    <%
                        java.util.List<com.mindcare.model.Appointment> appointments = (java.util.List<com.mindcare.model.Appointment>) request.getAttribute("appointments");
                        int pendingBookings = (appointments != null) ? appointments.size() : 0;
                    %>
                    <div class="stat-value"><%= pendingBookings %></div>
                    <div class="stat-title">Pending Bookings</div>
                </div>
            </div>

            <div class="grid-container">
                <div class="schedule-section">
                    <h3><span>Today's Schedule</span> <a href="#" style="font-size: 0.875rem; font-weight: 500;">View Calendar</a></h3>
                    <p style="color: var(--text-muted); font-size: 0.875rem; margin-top: -1rem; margin-bottom: 1.5rem;">Friday, Oct 24, 2023</p>
                    
                    <div class="schedule-list">
                    <%
                        if (appointments != null && !appointments.isEmpty()) {
                            for (com.mindcare.model.Appointment appt : appointments) {
                    %>
                        <div class="schedule-item">
                            <div class="schedule-time"><%= appt.getAppointmentTime() %></div>
                            <div class="schedule-card" style="border-left-color: #10B981;">
                                <div>
                                    <div class="schedule-patient"><%= appt.getPatientName() %></div>
                                    <div class="schedule-details">Status: <%= appt.getStatus() %></div>
                                </div>
                                <div>
                                    <button class="btn-join">Join Meeting</button>
                                </div>
                            </div>
                        </div>
                    <%
                            }
                        } else {
                    %>
                        <div style="color: var(--text-muted);">No upcoming appointments.</div>
                    <%  } %>
                    </div>
                </div>

                <div class="sidebar-right">
                    <div class="recent-activity">
                        <h3>Recent Activity</h3>
                        <div class="activity-list">
                            <div class="activity-item">
                                <div class="activity-icon"></div>
                                <div class="activity-content">
                                    <div class="activity-title">New Session Note added for Sarah Mitchell</div>
                                    <div class="activity-time">10 MINUTES AGO</div>
                                </div>
                            </div>
                            <div class="activity-item">
                                <div class="activity-icon" style="border-color: #10B981;"></div>
                                <div class="activity-content">
                                    <div class="activity-title">Appointment confirmed with Marcus Vane</div>
                                    <div class="activity-time">2 HOURS AGO</div>
                                </div>
                            </div>
                            <div class="activity-item">
                                <div class="activity-icon" style="border-color: #3B82F6;"></div>
                                <div class="activity-content">
                                    <div class="activity-title">Reschedule Request from Leo Martinez</div>
                                    <div class="activity-actions">
                                        <button class="btn-outline">Approve</button>
                                        <button class="btn-outline" style="border-color: transparent;">Decline</button>
                                    </div>
                                    <div class="activity-time" style="margin-top: 0.5rem;">4 HOURS AGO</div>
                                </div>
                            </div>
                            <div class="activity-item">
                                <div class="activity-icon" style="border-color: #EF4444;"></div>
                                <div class="activity-content">
                                    <div class="activity-title">Missed Session: Elena G.<br>(10:00 AM)</div>
                                    <div class="activity-time">6 HOURS AGO</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="insight-card">
                        <div class="insight-title">💡 WEEKLY INSIGHT</div>
                        <div class="insight-text">Patient retention is up by 8% this month. Your morning sessions show the highest engagement rates.</div>
                        <button class="btn-insight">View Analytics <span style="float: right;">+</span></button>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
