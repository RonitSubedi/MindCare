<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindCare | Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <!-- When real: replacing hardcoded values with ${adminName}, ${totalUsers} etc. -->
</head>
<body>
<div class="dashboard-layout">

    <!-- ===== SIDEBAR ===== -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <span class="logo-icon">🧠</span> MindCare
            <div class="sidebar-role">Admin Portal</div>
        </div>
        <ul class="sidebar-nav">
            <li>
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="active">
                    <span class="nav-icon">▦</span> Dashboard
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/approvals">
                    <span class="nav-icon">✔</span> Approvals
                    <span class="nav-badge">12</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/users">
                    <span class="nav-icon">👥</span> Manage Users
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/resources">
                    <span class="nav-icon">📚</span> Resources
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/analytics">
                    <span class="nav-icon">📊</span> Analytics
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/notifications">
                    <span class="nav-icon">🔔</span> Notifications
                </a>
            </li>
        </ul>
        <div class="sidebar-footer">
            <a href="${pageContext.request.contextPath}/logout" class="logout-btn">
                <span>↩</span> Sign Out
            </a>
        </div>
    </aside>

    <!-- ===== MAIN CONTENT ===== -->
    <main class="main-content">

        <!-- Topbar -->
        <div class="topbar">
            <div>
                <h1>Dashboard Overview</h1>
                <p class="topbar-sub">Real-time health indicators and platform metrics</p>
            </div>
            <div class="user-info">
                <button class="btn-icon" title="Notifications">
                    🔔 <span class="notif-dot"></span>
                </button>
                <div class="admin-avatar">
                    <div class="avatar-circle">AS</div>
                    <div>
                        <div class="avatar-name">Admin Sarah</div>
                        <div class="avatar-role">Super Admin</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ===== STAT CARDS ===== -->
        <div class="stats-grid">
            <div class="stat-card stat-blue">
                <div class="stat-icon">👥</div>
                <div class="stat-body">
                    <div class="stat-title">Total Active Users</div>
                    <div class="stat-value">14,284</div>
                    <div class="stat-change positive">▲ +16.3% this month</div>
                    <div class="stat-sub">8,435 Patients &nbsp;·&nbsp; 5,849 Counsellors</div>
                </div>
            </div>
            <div class="stat-card stat-green">
                <div class="stat-icon">📅</div>
                <div class="stat-body">
                    <div class="stat-title">Active Sessions</div>
                    <div class="stat-value">342</div>
                    <div class="stat-change positive">▲ Ongoing right now</div>
                    <div class="stat-sub">Shown by last server report</div>
                </div>
            </div>
            <div class="stat-card stat-amber">
                <div class="stat-icon">⏳</div>
                <div class="stat-body">
                    <div class="stat-title">Pending Approvals</div>
                    <div class="stat-value">18</div>
                    <div class="stat-change warning">⚠ 1 flagged for immediate review</div>
                    <div class="stat-sub">Counsellor registrations</div>
                </div>
            </div>
            <div class="stat-card stat-purple">
                <div class="stat-icon">🏥</div>
                <div class="stat-body">
                    <div class="stat-title">System Health</div>
                    <div class="stat-value">Operational</div>
                    <div class="stat-change positive">▲ All systems normal</div>
                    <div class="stat-sub">Uptime: 99.68%</div>
                </div>
            </div>
        </div>

        <!-- ===== MIDDLE ROW ===== -->
        <div class="mid-row">

            <!-- Appointment Growth Chart (CSS-based sparkline) -->
            <div class="card chart-card">
                <div class="card-header">
                    <div>
                        <div class="card-title">Appointment Growth</div>
                        <div class="card-sub">Monthly trend across all counsellors</div>
                    </div>
                    <select class="filter-select">
                        <option>Last 28 Days</option>
                        <option>Last 3 Months</option>
                        <option>Last Year</option>
                    </select>
                </div>
                <div class="chart-area">
                    <!-- CSS bar chart — swap with a real chart library (Chart.js) later -->
                    <div class="bar-chart">
                        <div class="bar-group">
                            <div class="bar" style="height:45%"><span class="bar-tip">210</span></div>
                            <div class="bar-label">Oct W1</div>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height:60%"><span class="bar-tip">288</span></div>
                            <div class="bar-label">Oct W2</div>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height:55%"><span class="bar-tip">264</span></div>
                            <div class="bar-label">Oct W3</div>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height:72%"><span class="bar-tip">346</span></div>
                            <div class="bar-label">Oct W4</div>
                        </div>
                        <div class="bar-group">
                            <div class="bar bar-highlight" style="height:88%"><span class="bar-tip">422</span></div>
                            <div class="bar-label">Nov W1</div>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height:78%"><span class="bar-tip">374</span></div>
                            <div class="bar-label">Nov W2</div>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height:95%"><span class="bar-tip">456</span></div>
                            <div class="bar-label">Nov W3</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- System Health Panel -->
            <div class="card health-card">
                <div class="card-header">
                    <div class="card-title">System Health</div>
                    <span class="badge badge-green">● Live</span>
                </div>
                <div class="health-items">
                    <div class="health-item">
                        <div class="health-label">API Response</div>
                        <div class="health-bar-wrap">
                            <div class="health-bar" style="width:82%"></div>
                        </div>
                        <div class="health-value good">124ms</div>
                    </div>
                    <div class="health-item">
                        <div class="health-label">Database Load</div>
                        <div class="health-bar-wrap">
                            <div class="health-bar health-bar-amber" style="width:12%"></div>
                        </div>
                        <div class="health-value good">12%</div>
                    </div>
                    <div class="health-item">
                        <div class="health-label">Uptime (Last 24h)</div>
                        <div class="health-bar-wrap">
                            <div class="health-bar" style="width:99%"></div>
                        </div>
                        <div class="health-value good">99.68%</div>
                    </div>
                    <div class="health-item">
                        <div class="health-label">Active Connections</div>
                        <div class="health-bar-wrap">
                            <div class="health-bar health-bar-amber" style="width:55%"></div>
                        </div>
                        <div class="health-value warn">342 / 600</div>
                    </div>
                </div>
                <div class="health-status-row">
                    <span class="dot-green"></span> Operational
                </div>
            </div>
        </div>

        <!-- ===== RECENT ACTIVITIES ===== -->
        <div class="card activity-card">
            <div class="card-header">
                <div class="card-title">Recent Activities</div>
                <a href="${pageContext.request.contextPath}/admin/approvals" class="view-all-link">View All →</a>
            </div>
            <table class="activity-table">
                <thead>
                <tr>
                    <th>User</th>
                    <th>Action</th>
                    <th>Time</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <div class="user-cell">
                            <div class="mini-avatar" style="background:#6366f1">MT</div>
                            Marcus Thorne
                        </div>
                    </td>
                    <td>New counsellor registration submitted</td>
                    <td class="time-cell">2 mins ago</td>
                    <td><span class="badge badge-amber">Pending</span></td>
                </tr>
                <tr>
                    <td>
                        <div class="user-cell">
                            <div class="mini-avatar" style="background:#10b981">ER</div>
                            Dr. Elena Rodriguez
                        </div>
                    </td>
                    <td>Submitted credentials for annual review</td>
                    <td class="time-cell">15 mins ago</td>
                    <td>
                        <span class="badge badge-blue">Review</span>
                        <button class="inline-btn approve">Approve</button>
                        <button class="inline-btn reject">Reject</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="user-cell">
                            <div class="mini-avatar" style="background:#f59e0b">JM</div>
                            James Miller
                        </div>
                    </td>
                    <td>Completed appointment — 3 sessions this week</td>
                    <td class="time-cell">1 hr ago</td>
                    <td><span class="badge badge-green">Completed</span></td>
                </tr>
                <tr>
                    <td>
                        <div class="user-cell">
                            <div class="mini-avatar" style="background:#ef4444">AP</div>
                            Aisha Patel
                        </div>
                    </td>
                    <td>Account deactivation request received</td>
                    <td class="time-cell">3 hrs ago</td>
                    <td><span class="badge badge-red">Action Needed</span></td>
                </tr>
                <tr>
                    <td>
                        <div class="user-cell">
                            <div class="mini-avatar" style="background:#8b5cf6">RK</div>
                            Ramesh Kumar
                        </div>
                    </td>
                    <td>New patient registered via platform</td>
                    <td class="time-cell">5 hrs ago</td>
                    <td><span class="badge badge-green">Active</span></td>
                </tr>
                </tbody>
            </table>
        </div>

    </main>
</div>

<style>
    /* ========== ADMIN-SPECIFIC STYLES ========== */
    /* These extend style.css — save separately as admin.css or inline here */

    .sidebar-role {
        font-size: 0.7rem;
        color: var(--text-muted);
        font-weight: 500;
        letter-spacing: 0.05em;
        text-transform: uppercase;
        margin-top: 2px;
    }

    .logo-icon { font-size: 1.2rem; }

    .nav-icon { font-size: 1rem; margin-right: 0.5rem; }

    .nav-badge {
        margin-left: auto;
        background: var(--primary);
        color: white;
        font-size: 0.7rem;
        font-weight: 700;
        padding: 2px 7px;
        border-radius: 999px;
    }

    .sidebar-footer { margin-top: auto; padding-top: 1rem; border-top: 1px solid var(--border); }

    .logout-btn {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        padding: 0.75rem 1rem;
        color: var(--text-muted);
        border-radius: 0.5rem;
        font-weight: 500;
        transition: all 0.2s;
    }
    .logout-btn:hover { background: #fee2e2; color: #dc2626; }

    .topbar-sub { font-size: 0.85rem; color: var(--text-muted); margin-top: 2px; }

    .btn-icon {
        background: none; border: 1px solid var(--border);
        padding: 0.5rem 0.75rem; border-radius: 0.5rem; cursor: pointer;
        font-size: 1rem; position: relative;
    }
    .notif-dot {
        position: absolute; top: 6px; right: 6px;
        width: 8px; height: 8px; background: #ef4444; border-radius: 50%;
    }

    .admin-avatar { display: flex; align-items: center; gap: 0.75rem; }
    .avatar-circle {
        width: 40px; height: 40px; border-radius: 50%;
        background: var(--primary); color: white;
        display: flex; align-items: center; justify-content: center;
        font-weight: 700; font-size: 0.9rem;
    }
    .avatar-name { font-weight: 600; font-size: 0.9rem; }
    .avatar-role { font-size: 0.75rem; color: var(--text-muted); }

    /* Stat cards */
    .stats-grid { grid-template-columns: repeat(4, 1fr); }

    .stat-card { display: flex; gap: 1rem; align-items: flex-start; }
    .stat-icon { font-size: 2rem; padding: 0.5rem; background: var(--bg-color); border-radius: 0.75rem; }
    .stat-body { flex: 1; }
    .stat-change { font-size: 0.8rem; margin-top: 0.25rem; font-weight: 500; }
    .stat-change.positive { color: #059669; }
    .stat-change.warning { color: #d97706; }
    .stat-sub { font-size: 0.75rem; color: var(--text-muted); margin-top: 4px; }

    .stat-blue  { border-left: 4px solid #4F46E5; }
    .stat-green { border-left: 4px solid #10B981; }
    .stat-amber { border-left: 4px solid #F59E0B; }
    .stat-purple{ border-left: 4px solid #8B5CF6; }

    /* Mid row */
    .mid-row {
        display: grid;
        grid-template-columns: 2fr 1fr;
        gap: 1.5rem;
        margin-bottom: 1.5rem;
    }

    .card {
        background: var(--card-bg);
        border: 1px solid var(--border);
        border-radius: 1rem;
        padding: 1.5rem;
        box-shadow: var(--shadow-sm);
    }

    .card-header {
        display: flex; justify-content: space-between; align-items: flex-start;
        margin-bottom: 1.25rem;
    }
    .card-title { font-weight: 700; font-size: 1rem; color: var(--text-main); }
    .card-sub { font-size: 0.8rem; color: var(--text-muted); margin-top: 2px; }

    .filter-select {
        padding: 0.35rem 0.75rem;
        border: 1px solid var(--border);
        border-radius: 0.5rem;
        font-size: 0.8rem;
        color: var(--text-main);
        cursor: pointer;
    }

    /* Bar chart */
    .chart-area { padding: 0.5rem 0; }
    .bar-chart {
        display: flex;
        align-items: flex-end;
        gap: 0.75rem;
        height: 160px;
        padding: 0 0.5rem;
    }
    .bar-group { flex: 1; display: flex; flex-direction: column; align-items: center; gap: 6px; height: 100%; justify-content: flex-end; }
    .bar {
        width: 100%; background: rgba(79,70,229,0.25);
        border-radius: 6px 6px 0 0;
        position: relative;
        transition: background 0.2s;
        cursor: pointer;
    }
    .bar:hover { background: rgba(79,70,229,0.5); }
    .bar-highlight { background: var(--primary) !important; }
    .bar-tip {
        position: absolute; top: -22px; left: 50%; transform: translateX(-50%);
        font-size: 0.65rem; font-weight: 600; color: var(--primary);
        background: white; border: 1px solid var(--border);
        padding: 1px 5px; border-radius: 4px; white-space: nowrap;
        opacity: 0; transition: opacity 0.2s;
    }
    .bar:hover .bar-tip { opacity: 1; }
    .bar-label { font-size: 0.68rem; color: var(--text-muted); text-align: center; }

    /* Health card */
    .health-items { display: flex; flex-direction: column; gap: 1rem; }
    .health-item { }
    .health-label { font-size: 0.8rem; color: var(--text-muted); margin-bottom: 4px; }
    .health-bar-wrap { background: var(--bg-color); border-radius: 999px; height: 8px; overflow: hidden; margin-bottom: 2px; }
    .health-bar { height: 100%; background: var(--primary); border-radius: 999px; transition: width 0.6s ease; }
    .health-bar-amber { background: var(--accent); }
    .health-value { font-size: 0.78rem; font-weight: 600; }
    .health-value.good { color: #059669; }
    .health-value.warn { color: #d97706; }
    .health-status-row { margin-top: 1rem; padding-top: 1rem; border-top: 1px solid var(--border); display: flex; align-items: center; gap: 0.5rem; font-size: 0.85rem; font-weight: 600; color: #059669; }
    .dot-green { width: 10px; height: 10px; background: #10b981; border-radius: 50%; display: inline-block; }

    /* Activity table */
    .activity-card { margin-bottom: 1.5rem; }
    .activity-table { width: 100%; border-collapse: collapse; font-size: 0.88rem; }
    .activity-table th {
        text-align: left; padding: 0.6rem 1rem;
        font-size: 0.75rem; text-transform: uppercase;
        color: var(--text-muted); border-bottom: 1px solid var(--border);
    }
    .activity-table td { padding: 0.9rem 1rem; border-bottom: 1px solid var(--border); vertical-align: middle; }
    .activity-table tr:last-child td { border-bottom: none; }
    .activity-table tr:hover td { background: var(--bg-color); }

    .user-cell { display: flex; align-items: center; gap: 0.6rem; font-weight: 500; }
    .mini-avatar {
        width: 32px; height: 32px; border-radius: 50%;
        color: white; font-size: 0.7rem; font-weight: 700;
        display: flex; align-items: center; justify-content: center;
        flex-shrink: 0;
    }
    .time-cell { color: var(--text-muted); font-size: 0.8rem; }

    /* Badges */
    .badge {
        display: inline-block; padding: 3px 10px; border-radius: 999px;
        font-size: 0.72rem; font-weight: 600;
    }
    .badge-green  { background: #d1fae5; color: #059669; }
    .badge-amber  { background: #fef3c7; color: #d97706; }
    .badge-blue   { background: #ede9fe; color: #4f46e5; }
    .badge-red    { background: #fee2e2; color: #dc2626; }

    .inline-btn {
        display: inline-block; padding: 3px 10px; border-radius: 6px;
        font-size: 0.72rem; font-weight: 600; border: none; cursor: pointer;
        margin-left: 4px; transition: opacity 0.2s;
    }
    .inline-btn:hover { opacity: 0.8; }
    .inline-btn.approve { background: #d1fae5; color: #059669; }
    .inline-btn.reject  { background: #fee2e2; color: #dc2626; }

    .view-all-link { font-size: 0.85rem; color: var(--primary); font-weight: 500; }

    /* Responsive tweak */
    @media (max-width: 1100px) {
        .stats-grid { grid-template-columns: repeat(2, 1fr); }
        .mid-row { grid-template-columns: 1fr; }
    }
    @media (max-width: 700px) {
        .sidebar { display: none; }
        .main-content { padding: 1rem; }
    }
</style>

</body>
</html>
