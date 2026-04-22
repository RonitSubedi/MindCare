<%@ page import="com.mindcare.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"PATIENT".equals(user.getRole())) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard - ManaSewa</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500;600;700&family=DM+Serif+Display&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg: #F4F3F0;
            --sidebar-bg: #1C1C1E;
            --sidebar-text: #A0A0A8;
            --sidebar-active: #FFFFFF;
            --sidebar-active-bg: rgba(255,255,255,0.1);
            --card-bg: #FFFFFF;
            --accent-blue: #4A6CF7;
            --accent-green: #2ECC8A;
            --accent-teal: #0EA5E9;
            --text-main: #1C1C1E;
            --text-muted: #6B6B70;
            --border: #E8E8E4;
            --next-session-bg: #1C2B4A;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'DM Sans', sans-serif;
            background: var(--bg);
            color: var(--text-main);
            display: flex;
            min-height: 100vh;
        }

        /* ── SIDEBAR ── */
        .sidebar {
            width: 220px;
            min-width: 220px;
            background: var(--sidebar-bg);
            display: flex;
            flex-direction: column;
            padding: 28px 0;
            position: fixed;
            top: 0; left: 0; bottom: 0;
            z-index: 100;
        }

        .sidebar-brand {
            padding: 0 24px 28px;
            border-bottom: 1px solid rgba(255,255,255,0.07);
        }

        .sidebar-brand .brand-name {
            font-size: 1.1rem;
            font-weight: 700;
            color: #fff;
            letter-spacing: 0.02em;
        }

        .sidebar-brand .brand-sub {
            font-size: 0.65rem;
            color: var(--sidebar-text);
            letter-spacing: 0.12em;
            text-transform: uppercase;
            margin-top: 2px;
        }

        .sidebar-nav {
            list-style: none;
            padding: 20px 12px;
            flex: 1;
        }

        .sidebar-nav li { margin-bottom: 2px; }

        .sidebar-nav a {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 9px 12px;
            border-radius: 8px;
            color: var(--sidebar-text);
            font-size: 0.875rem;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.15s;
        }

        .sidebar-nav a:hover {
            background: var(--sidebar-active-bg);
            color: #fff;
        }

        .sidebar-nav a.active {
            background: var(--sidebar-active-bg);
            color: var(--sidebar-active);
        }

        .sidebar-nav .nav-icon {
            width: 16px;
            height: 16px;
            opacity: 0.7;
            flex-shrink: 0;
        }

        .sidebar-nav a.active .nav-icon,
        .sidebar-nav a:hover .nav-icon { opacity: 1; }

        .sidebar-bottom {
            padding: 16px 12px;
            border-top: 1px solid rgba(255,255,255,0.07);
        }

        .sidebar-bottom a {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 9px 12px;
            border-radius: 8px;
            color: var(--sidebar-text);
            font-size: 0.875rem;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.15s;
        }

        .sidebar-bottom a:hover { background: rgba(255,255,255,0.08); color: #fff; }

        /* ── MAIN ── */
        .main {
            margin-left: 220px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        /* ── TOPBAR ── */
        .topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 32px;
            background: var(--bg);
            border-bottom: 1px solid var(--border);
            position: sticky;
            top: 0;
            z-index: 50;
        }

        .search-box {
            display: flex;
            align-items: center;
            gap: 8px;
            background: var(--card-bg);
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 8px 14px;
            width: 280px;
        }

        .search-box input {
            border: none;
            outline: none;
            font-size: 0.85rem;
            color: var(--text-muted);
            background: transparent;
            width: 100%;
            font-family: 'DM Sans', sans-serif;
        }

        .search-icon { color: var(--text-muted); flex-shrink: 0; }

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .avatar {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            background: var(--accent-blue);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 0.8rem;
            font-weight: 600;
        }

        /* ── CONTENT ── */
        .content {
            padding: 32px;
            display: grid;
            grid-template-columns: 1fr 300px;
            gap: 24px;
            align-items: start;
        }

        /* ── GREETING ── */
        .greeting {
            margin-bottom: 6px;
        }

        .greeting h1 {
            font-family: 'DM Serif Display', serif;
            font-size: 1.9rem;
            font-weight: 400;
            color: var(--text-main);
        }

        .greeting p {
            font-size: 0.875rem;
            color: var(--text-muted);
            margin-top: 4px;
        }

        /* ── MOOD CARD ── */
        .mood-card {
            background: var(--card-bg);
            border-radius: 14px;
            padding: 22px 24px;
            margin-top: 20px;
            border: 1px solid var(--border);
        }

        .mood-card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 6px;
        }

        .mood-card-header h3 {
            font-size: 0.95rem;
            font-weight: 600;
        }

        .mood-badge-row {
            display: flex;
            gap: 8px;
        }

        .badge {
            font-size: 0.72rem;
            font-weight: 600;
            padding: 4px 10px;
            border-radius: 20px;
        }

        .badge-green { background: #D1FAE5; color: #059669; }
        .badge-gray  { background: #F3F4F6; color: #6B7280; }

        .mood-subtitle {
            font-size: 0.8rem;
            color: var(--text-muted);
            margin-bottom: 18px;
        }

        /* Chart */
        .chart-wrap { width: 100%; height: 110px; position: relative; }

        .chart-wrap svg { width: 100%; height: 100%; }

        .chart-days {
            display: flex;
            justify-content: space-between;
            margin-top: 8px;
            padding: 0 4px;
        }

        .chart-days span {
            font-size: 0.7rem;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        /* ── TWO COLUMN LOWER ── */
        .lower-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 20px;
        }

        /* ── JOURNAL CARD ── */
        .journal-card {
            background: var(--card-bg);
            border-radius: 14px;
            padding: 22px 24px;
            border: 1px solid var(--border);
        }

        .card-title {
            font-size: 0.95rem;
            font-weight: 600;
            margin-bottom: 16px;
        }

        .journal-entry { margin-bottom: 16px; }

        .journal-date {
            font-size: 0.68rem;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.08em;
            margin-bottom: 4px;
        }

        .journal-title {
            font-size: 0.875rem;
            font-weight: 600;
            color: var(--text-main);
            margin-bottom: 4px;
        }

        .journal-preview {
            font-size: 0.8rem;
            color: var(--text-muted);
            line-height: 1.5;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .view-all {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            font-size: 0.8rem;
            font-weight: 600;
            color: var(--accent-blue);
            text-decoration: none;
            margin-top: 4px;
        }

        /* ── RESOURCES CARD ── */
        .resources-card {
            background: var(--card-bg);
            border-radius: 14px;
            padding: 22px 24px;
            border: 1px solid var(--border);
        }

        .resource-item {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 14px;
        }

        .resource-icon {
            width: 38px;
            height: 38px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .resource-icon.blue  { background: #EFF6FF; }
        .resource-icon.green { background: #F0FDF4; }

        .resource-info { flex: 1; }

        .resource-name {
            font-size: 0.83rem;
            font-weight: 600;
            color: var(--text-main);
        }

        .resource-meta {
            font-size: 0.72rem;
            color: var(--text-muted);
            margin-top: 1px;
        }

        /* ── RIGHT COLUMN ── */
        .right-col { display: flex; flex-direction: column; gap: 20px; }

        /* ── NEXT SESSION CARD ── */
        .session-card {
            background: var(--next-session-bg);
            border-radius: 14px;
            padding: 22px;
            color: white;
        }

        .session-label {
            font-size: 0.68rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            color: rgba(255,255,255,0.5);
            margin-bottom: 14px;
        }

        .counsellor-row {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 18px;
        }

        .counsellor-avatar {
            width: 46px;
            height: 46px;
            border-radius: 50%;
            background: var(--accent-teal);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
            font-weight: 700;
            color: white;
            flex-shrink: 0;
        }

        .counsellor-name {
            font-size: 1rem;
            font-weight: 700;
        }

        .counsellor-role {
            font-size: 0.75rem;
            color: rgba(255,255,255,0.55);
            margin-top: 2px;
        }

        .session-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-bottom: 18px;
        }

        .session-detail-box {
            background: rgba(255,255,255,0.08);
            border-radius: 8px;
            padding: 10px 12px;
        }

        .session-detail-label {
            font-size: 0.65rem;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: rgba(255,255,255,0.45);
            margin-bottom: 4px;
        }

        .session-detail-value {
            font-size: 0.85rem;
            font-weight: 600;
        }

        .btn-reschedule {
            display: block;
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.15);
            color: rgba(255,255,255,0.8);
            font-size: 0.8rem;
            font-weight: 500;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
            margin-top: 8px;
            transition: background 0.15s;
            font-family: 'DM Sans', sans-serif;
        }

        .btn-reschedule:hover { background: rgba(255,255,255,0.15); color: white; }

        /* ── SUPPORT CARD ── */
        .support-card {
            background: var(--card-bg);
            border-radius: 14px;
            padding: 22px;
            border: 1px solid var(--border);
        }

        .support-card h3 {
            font-size: 0.95rem;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .support-card p {
            font-size: 0.8rem;
            color: var(--text-muted);
            line-height: 1.5;
            margin-bottom: 16px;
        }

        .support-btn {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 14px;
            border-radius: 8px;
            border: 1px solid var(--border);
            margin-bottom: 8px;
            font-size: 0.82rem;
            font-weight: 500;
            color: var(--text-main);
            text-decoration: none;
            transition: background 0.15s;
        }

        .support-btn:hover { background: #F9F9F9; color: var(--text-main); }

        .support-btn-icon {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .support-btn-icon .dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
        }

        .dot-blue  { background: var(--accent-blue); }
        .dot-red   { background: #EF4444; }

        .chevron { color: var(--text-muted); font-size: 0.75rem; }
    </style>
</head>
<body>

<!-- SIDEBAR -->
<aside class="sidebar">
    <div class="sidebar-brand">
        <div class="brand-name">ManaSewa</div>
        <div class="brand-sub">Editorial Serenity</div>
    </div>
    <ul class="sidebar-nav">
        <li>
            <a href="patient-dashboard" class="active">
                <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1" stroke-width="2"/><rect x="14" y="3" width="7" height="7" rx="1" stroke-width="2"/><rect x="3" y="14" width="7" height="7" rx="1" stroke-width="2"/><rect x="14" y="14" width="7" height="7" rx="1" stroke-width="2"/></svg>
                Dashboard
            </a>
        </li>
        <li>
            <a href="find-counsellors">
                <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><circle cx="11" cy="11" r="8" stroke-width="2"/><path d="m21 21-4.35-4.35" stroke-width="2" stroke-linecap="round"/></svg>
                Find Counsellors
            </a>
        </li>
        <li>
            <a href="appointments">
                <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><rect x="3" y="4" width="18" height="18" rx="2" stroke-width="2"/><path d="M16 2v4M8 2v4M3 10h18" stroke-width="2" stroke-linecap="round"/></svg>
                Appointments
            </a>
        </li>
        <li>
            <a href="mood-tracker">
                <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" stroke-width="2"/><path d="M8 14s1.5 2 4 2 4-2 4-2" stroke-width="2" stroke-linecap="round"/><line x1="9" y1="9" x2="9.01" y2="9" stroke-width="2.5" stroke-linecap="round"/><line x1="15" y1="9" x2="15.01" y2="9" stroke-width="2.5" stroke-linecap="round"/></svg>
                Mood Tracker
            </a>
        </li>
        <li>
            <a href="resources">
                <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20" stroke-width="2" stroke-linecap="round"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z" stroke-width="2"/></svg>
                Resources
            </a>
        </li>
        <li>
            <a href="wishlist">
                <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" stroke-width="2"/></svg>
                Wishlist
            </a>
        </li>
        <li>
            <a href="profile">
                <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" stroke-width="2" stroke-linecap="round"/><circle cx="12" cy="7" r="4" stroke-width="2"/></svg>
                Profile
            </a>
        </li>
    </ul>
    <div class="sidebar-bottom">
        <a href="#">
            <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10" stroke-width="2"/><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3" stroke-width="2" stroke-linecap="round"/><line x1="12" y1="17" x2="12.01" y2="17" stroke-width="2.5" stroke-linecap="round"/></svg>
            Help Center
        </a>
        <a href="logout">
            <svg class="nav-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" stroke-width="2" stroke-linecap="round"/><polyline points="16 17 21 12 16 7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><line x1="21" y1="12" x2="9" y2="12" stroke-width="2" stroke-linecap="round"/></svg>
            Sign Out
        </a>
    </div>
</aside>

<!-- MAIN -->
<div class="main">

    <!-- TOPBAR -->
    <div class="topbar">
        <div class="search-box">
            <svg class="search-icon" width="14" height="14" fill="none" stroke="currentColor" viewBox="0 0 24 24"><circle cx="11" cy="11" r="8" stroke-width="2"/><path d="m21 21-4.35-4.35" stroke-width="2" stroke-linecap="round"/></svg>
            <input type="text" placeholder="Search resources or counsellors...">
        </div>
        <div class="topbar-right">
            <div class="avatar"><%= user.getName().substring(0,1).toUpperCase() %></div>
        </div>
    </div>

    <!-- CONTENT -->
    <div class="content">

        <!-- LEFT COLUMN -->
        <div class="left-col">

            <!-- Greeting -->
            <div class="greeting">
                <h1>Good morning, <%= user.getName() %>.</h1>
                <p>Take a deep breath. You're doing great today.</p>
            </div>

            <!-- Weekly Mood Summary -->
            <div class="mood-card">
                <div class="mood-card-header">
                    <h3>Weekly Mood Summary</h3>
                    <div class="mood-badge-row">
                        <span class="badge badge-green">Resilient</span>
                        <span class="badge badge-gray">Last 7 Days</span>
                    </div>
                </div>
                <div class="mood-subtitle">Your emotional clarity has improved by 12% this week.</div>
                <div class="chart-wrap">
                    <svg viewBox="0 0 600 110" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
                        <defs>
                            <linearGradient id="moodGrad" x1="0" y1="0" x2="0" y2="1">
                                <stop offset="0%" stop-color="#2ECC8A" stop-opacity="0.25"/>
                                <stop offset="100%" stop-color="#2ECC8A" stop-opacity="0"/>
                            </linearGradient>
                        </defs>
                        <path d="M0,75 C60,70 100,45 150,40 C200,35 230,55 280,35 C330,15 370,25 420,20 C470,15 530,30 600,25"
                              fill="none" stroke="#2ECC8A" stroke-width="2.5" stroke-linecap="round"/>
                        <path d="M0,75 C60,70 100,45 150,40 C200,35 230,55 280,35 C330,15 370,25 420,20 C470,15 530,30 600,25 L600,110 L0,110 Z"
                              fill="url(#moodGrad)"/>
                        <circle cx="420" cy="20" r="4" fill="#2ECC8A"/>
                    </svg>
                </div>
                <div class="chart-days">
                    <span>Mon</span><span>Tue</span><span>Wed</span><span>Thu</span><span>Fri</span><span>Sat</span><span>Sun</span>
                </div>
            </div>

            <!-- Lower grid -->
            <div class="lower-grid">

                <!-- Recent Journaling -->
                <div class="journal-card">
                    <div class="card-title">Recent Journaling</div>

                    <div class="journal-entry">
                        <div class="journal-date">Yesterday</div>
                        <div class="journal-title">Overcoming anxiety in social spaces</div>
                        <div class="journal-preview">Today I felt a bit overwhelmed at the market, but I used the...</div>
                    </div>

                    <div class="journal-entry">
                        <div class="journal-date">Oct 12</div>
                        <div class="journal-title">Morning reflections on gratitude</div>
                        <div class="journal-preview">The sun was shining and I felt a profound sense of peace. I a...</div>
                    </div>

                    <a href="journal" class="view-all">
                        View Journal
                        <svg width="12" height="12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M5 12h14M12 5l7 7-7 7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    </a>
                </div>

                <!-- Recommended Resources -->
                <div class="resources-card">
                    <div class="card-title">Recommended Resources</div>

                    <div class="resource-item">
                        <div class="resource-icon blue">
                            <svg width="18" height="18" fill="none" stroke="#4A6CF7" viewBox="0 0 24 24"><path d="M9 18V5l12-2v13" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><circle cx="6" cy="18" r="3" stroke-width="2"/><circle cx="18" cy="16" r="3" stroke-width="2"/></svg>
                        </div>
                        <div class="resource-info">
                            <div class="resource-name">Mindful Breathing</div>
                            <div class="resource-meta">10 min audio • Guided</div>
                        </div>
                    </div>

                    <div class="resource-item">
                        <div class="resource-icon green">
                            <svg width="18" height="18" fill="none" stroke="#2ECC8A" viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20" stroke-width="2" stroke-linecap="round"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z" stroke-width="2"/></svg>
                        </div>
                        <div class="resource-info">
                            <div class="resource-name">Cognitive Reframing</div>
                            <div class="resource-meta">5 min read • Article</div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- RIGHT COLUMN -->
        <div class="right-col">

            <!-- Next Session Card  -->
            <div class="session-card">
                <div class="session-label">Next Session</div>
                <div class="counsellor-row">
                    <div class="counsellor-avatar">SJ</div>
                    <div>
                        <div class="counsellor-name">Dr. Hari Nepali</div>
                        <div class="counsellor-role">Clinical Psychologist</div>
                    </div>
                </div>
                <div class="session-details">
                    <div class="session-detail-box">
                        <div class="session-detail-label">Date</div>
                        <div class="session-detail-value">Oct 24, 2023</div>
                    </div>
                    <div class="session-detail-box">
                        <div class="session-detail-label">Time</div>
                        <div class="session-detail-value">10:30 AM</div>
                    </div>
                </div>
                <a href="appointments" class="btn-reschedule">Reschedule Session</a>
            </div>

            <!-- Need Support -->
            <div class="support-card">
                <h3>Need Support?</h3>
                <p>Looking for a new perspective? Our specialists are available for immediate consultation.</p>
                <a href="find-counsellors" class="support-btn">
                    <div class="support-btn-icon">
                        <span class="dot dot-blue"></span>
                        Browse Counsellors
                    </div>
                    <span class="chevron">›</span>
                </a>
                <a href="crisis-hotline" class="support-btn">
                    <div class="support-btn-icon">
                        <span class="dot dot-red"></span>
                        24/7 Crisis Hotline
                    </div>
                    <span class="chevron">›</span>
                </a>
            </div>

        </div>
    </div>
</div>

</body>
</html>
