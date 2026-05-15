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

           <!-- TAB BUTTONS -->
           <div style="display:flex;gap:8px;margin-bottom:20px">
               <button onclick="showTab('history')" id="btn-history"
                   style="padding:8px 18px;border-radius:8px;border:none;background:#4f46e5;color:white;font-weight:600;cursor:pointer;">
                   Patient History & Notes
               </button>
               <button onclick="showTab('appointments')" id="btn-appointments"
                   style="padding:8px 18px;border-radius:8px;border:1px solid #ddd;background:white;color:#555;font-weight:600;cursor:pointer;">
                   Manage Appointments
               </button>
           </div>

           <!-- PANEL 1: PATIENT HISTORY & NOTES -->
           <div id="tab-history" style="display:block">

               <!-- Patient Card -->
               <div style="background:white;border-radius:12px;padding:20px;box-shadow:0 2px 8px rgba(0,0,0,0.08);display:flex;align-items:center;gap:20px;margin-bottom:20px">
                   <div style="width:60px;height:60px;border-radius:50%;background:linear-gradient(135deg,#6c8fff,#a78bfa);display:flex;align-items:center;justify-content:center;color:white;font-size:22px;font-weight:700;">SJ</div>
                   <div style="flex:1">
                       <h2 style="font-size:18px;margin-bottom:6px">Sarah Jenkins</h2>
                       <div style="display:flex;gap:8px;margin-bottom:6px">
                           <span style="background:#dcfce7;color:#16a34a;padding:2px 10px;border-radius:20px;font-size:11px;font-weight:600">New Client</span>
                           <span style="background:#fef9c3;color:#ca8a04;padding:2px 10px;border-radius:20px;font-size:11px;font-weight:600">Anxiety</span>
                           <span style="background:#fee2e2;color:#dc2626;padding:2px 10px;border-radius:20px;font-size:11px;font-weight:600">OCD</span>
                       </div>
                       <div style="font-size:12px;color:#888">
                           <span style="margin-right:16px">Patient ID: #4562-89023</span>
                           <span style="margin-right:16px">Since: Oct 24, 2023</span>
                           <span>Risk: <strong style="color:#16a34a">Minimal</strong></span>
                       </div>
                   </div>
                   <div style="background:#f8f9ff;border-radius:10px;padding:14px 20px;text-align:center;min-width:160px">
                       <div style="font-size:11px;color:#888;margin-bottom:8px;text-transform:uppercase;letter-spacing:0.5px">Therapeutic Progress</div>
                       <div style="background:#e5e7eb;border-radius:4px;height:6px;margin-bottom:6px">
                           <div style="height:6px;border-radius:4px;background:linear-gradient(90deg,#4ade80,#6c8fff);width:65%"></div>
                       </div>
                       <div style="font-size:11px;color:#16a34a;font-weight:600">Significant Improvement</div>
                   </div>
               </div>

               <!-- Two Column Grid -->
               <div style="display:grid;grid-template-columns:1fr 1fr;gap:20px;margin-bottom:20px">

                   <!-- Clinical Timeline -->
                   <div style="background:white;border-radius:12px;padding:20px;box-shadow:0 2px 8px rgba(0,0,0,0.08)">
                       <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px">
                           <strong style="font-size:13px;color:#888;text-transform:uppercase;letter-spacing:0.5px">Clinical Timeline</strong>
                           <button style="padding:4px 10px;border-radius:6px;border:1px solid #ddd;background:white;font-size:11px;cursor:pointer">+ Filter</button>
                       </div>

                       <div style="display:flex;gap:12px;margin-bottom:16px">
                           <div style="width:10px;height:10px;border-radius:50%;background:#4ade80;margin-top:4px;flex-shrink:0"></div>
                           <div>
                               <div style="font-size:11px;color:#aaa;margin-bottom:2px">Nov 12, 2023</div>
                               <div style="font-size:13px;font-weight:600;margin-bottom:2px">Exposure Therapy Recap</div>
                               <div style="font-size:12px;color:#888">Patient successfully navigated household anxiety triggers during the session.</div>
                           </div>
                       </div>

                       <div style="display:flex;gap:12px;margin-bottom:16px">
                           <div style="width:10px;height:10px;border-radius:50%;background:#6c8fff;margin-top:4px;flex-shrink:0"></div>
                           <div>
                               <div style="font-size:11px;color:#aaa;margin-bottom:2px">Oct 30, 2023</div>
                               <div style="font-size:13px;font-weight:600;margin-bottom:2px">Initial Assessment - OCD</div>
                               <div style="font-size:12px;color:#888">Comprehensive review of intrusive thoughts. Patient reported moderate distress.</div>
                           </div>
                       </div>

                       <div style="display:flex;gap:12px">
                           <div style="width:10px;height:10px;border-radius:50%;background:#fbbf24;margin-top:4px;flex-shrink:0"></div>
                           <div>
                               <div style="font-size:11px;color:#aaa;margin-bottom:2px">Oct 24, 2023</div>
                               <div style="font-size:13px;font-weight:600;margin-bottom:2px">First Consultation</div>
                               <div style="font-size:12px;color:#888">Introduced patient to cognitive behavioural framework.</div>
                           </div>
                       </div>
                   </div>

                   <!-- Session Notes Form -->
                   <div style="background:white;border-radius:12px;padding:20px;box-shadow:0 2px 8px rgba(0,0,0,0.08)">
                       <strong style="font-size:13px;color:#888;text-transform:uppercase;letter-spacing:0.5px">New Session Notes</strong>

                       <div style="margin-top:14px">
                           <label style="font-size:11px;font-weight:600;color:#888;display:block;margin-bottom:4px">PRIORITY / FOCUS</label>
                           <input type="text" placeholder="e.g. Priority Management" style="width:100%;padding:8px 12px;border:1px solid #ddd;border-radius:8px;font-size:13px;outline:none"/>
                       </div>

                       <div style="display:grid;grid-template-columns:1fr 1fr;gap:10px;margin-top:10px">
                           <div>
                               <label style="font-size:11px;font-weight:600;color:#888;display:block;margin-bottom:4px">FOLLOW-UP DATE</label>
                               <input type="date" style="width:100%;padding:8px 12px;border:1px solid #ddd;border-radius:8px;font-size:13px;outline:none"/>
                           </div>
                           <div>
                               <label style="font-size:11px;font-weight:600;color:#888;display:block;margin-bottom:4px">NEXT APPOINTMENT</label>
                               <input type="text" placeholder="MM/DD/YYYY" style="width:100%;padding:8px 12px;border:1px solid #ddd;border-radius:8px;font-size:13px;outline:none"/>
                           </div>
                       </div>

                       <div style="margin-top:10px">
                           <label style="font-size:11px;font-weight:600;color:#888;display:block;margin-bottom:4px">CLINICAL OBSERVATIONS</label>
                           <textarea placeholder="Describe clinical observations, patient mood, discussion points..." style="width:100%;padding:8px 12px;border:1px solid #ddd;border-radius:8px;font-size:13px;outline:none;min-height:70px;resize:vertical"></textarea>
                       </div>

                       <div style="margin-top:10px">
                           <label style="font-size:11px;font-weight:600;color:#888;display:block;margin-bottom:4px">RECOMMENDATIONS</label>
                           <textarea placeholder="Action items for the patient..." style="width:100%;padding:8px 12px;border:1px solid #ddd;border-radius:8px;font-size:13px;outline:none;min-height:50px;resize:vertical"></textarea>
                       </div>

                       <div style="display:flex;justify-content:flex-end;gap:8px;margin-top:12px">
                           <button style="padding:8px 16px;border-radius:8px;border:1px solid #ddd;background:white;cursor:pointer;font-size:13px">Save Draft</button>
                           <button style="padding:8px 16px;border-radius:8px;border:none;background:#4ade80;color:#0f1117;font-weight:600;cursor:pointer;font-size:13px">Finalise Note</button>
                       </div>
                   </div>
               </div>

               <!-- Bottom Stats -->
               <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:16px">
                   <div style="background:white;border-radius:12px;padding:16px;text-align:center;box-shadow:0 2px 8px rgba(0,0,0,0.08)">
                       <div style="font-size:22px;margin-bottom:6px">💊</div>
                       <div style="font-size:11px;color:#888;margin-bottom:4px">Prescriptions</div>
                       <div style="font-weight:700;color:#6c8fff">3 Active</div>
                       <div style="font-size:11px;color:#aaa;margin-top:2px">Update Meds →</div>
                   </div>
                   <div style="background:white;border-radius:12px;padding:16px;text-align:center;box-shadow:0 2px 8px rgba(0,0,0,0.08)">
                       <div style="font-size:22px;margin-bottom:6px">😊</div>
                       <div style="font-size:11px;color:#888;margin-bottom:4px">Mood Score</div>
                       <div style="font-weight:700;color:#4ade80">7.4 / 10</div>
                       <div style="font-size:11px;color:#aaa;margin-top:2px">New Insights ↑</div>
                   </div>
                   <div style="background:white;border-radius:12px;padding:16px;text-align:center;box-shadow:0 2px 8px rgba(0,0,0,0.08)">
                       <div style="font-size:22px;margin-bottom:6px">👥</div>
                       <div style="font-size:11px;color:#888;margin-bottom:4px">Support Circle</div>
                       <div style="font-weight:700;color:#fbbf24">4 Contacts</div>
                       <div style="font-size:11px;color:#aaa;margin-top:2px">Contact List →</div>
                   </div>
                   <div style="background:white;border-radius:12px;padding:16px;text-align:center;box-shadow:0 2px 8px rgba(0,0,0,0.08)">
                       <div style="font-size:22px;margin-bottom:6px">⚠️</div>
                       <div style="font-size:11px;color:#888;margin-bottom:4px">Risk Assessment</div>
                       <div style="font-weight:700;color:#4ade80">Low Risk</div>
                       <div style="font-size:11px;color:#aaa;margin-top:2px">Full Report →</div>
                   </div>
               </div>
           </div>

           <!-- PANEL 2: MANAGE APPOINTMENTS -->
           <div id="tab-appointments" style="display:none">

               <!-- Focus Box -->
               <div style="background:white;border-radius:12px;padding:20px;box-shadow:0 2px 8px rgba(0,0,0,0.08);display:flex;align-items:center;justify-content:space-between;margin-bottom:20px">
                   <div>
                       <h3 style="font-size:16px;font-weight:700;margin-bottom:4px">Today's Focus</h3>
                       <p style="font-size:13px;color:#888;margin-bottom:10px">You have 4 confirmed sessions today</p>
                       <span style="background:#fef9c3;color:#ca8a04;border:1px solid #fde68a;border-radius:8px;padding:6px 12px;font-size:12px;font-weight:600">🕐 3 Meeting Requests</span>
                   </div>
                   <div style="display:flex;align-items:center;gap:20px">
                       <div style="text-align:center">
                           <div style="font-size:28px;font-weight:700;color:#6c8fff">4</div>
                           <div style="font-size:12px;color:#888">Confirmed Sessions</div>
                       </div>
                       <button style="background:#6c8fff;color:white;border:none;padding:10px 18px;border-radius:8px;font-weight:600;font-size:13px;cursor:pointer">View Today's Schedule</button>
                       <div style="text-align:right">
                           <div style="font-size:24px;font-weight:700;color:#4ade80">94%</div>
                           <div style="font-size:11px;color:#888">Attendance Rate</div>
                       </div>
                   </div>
               </div>

               <!-- Filter Tabs -->
               <div style="display:flex;gap:6px;margin-bottom:16px">
                   <button style="padding:7px 14px;border-radius:8px;border:1px solid #6c8fff;background:#eff2ff;color:#6c8fff;font-weight:600;font-size:13px;cursor:pointer">All Appointments</button>
                   <button style="padding:7px 14px;border-radius:8px;border:1px solid #ddd;background:white;color:#888;font-weight:500;font-size:13px;cursor:pointer">Pending</button>
                   <button style="padding:7px 14px;border-radius:8px;border:1px solid #ddd;background:white;color:#888;font-weight:500;font-size:13px;cursor:pointer">Completed</button>
               </div>

               <!-- Appointments Table -->
               <div style="background:white;border-radius:12px;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,0.08);margin-bottom:20px">
                   <!-- Header -->
                   <div style="display:grid;grid-template-columns:2fr 1fr 1fr 1.2fr 1fr 1fr;padding:12px 20px;background:#f8f9fa;font-size:11px;font-weight:700;color:#888;text-transform:uppercase;letter-spacing:0.5px;border-bottom:1px solid #eee">
                       <span>Patient Name</span><span>Date</span><span>Time</span><span>Status</span><span>Payment</span><span>Actions</span>
                   </div>

                   <!-- Row 1 -->
                   <div style="display:grid;grid-template-columns:2fr 1fr 1fr 1.2fr 1fr 1fr;padding:14px 20px;align-items:center;border-bottom:1px solid #f0f0f0">
                       <div style="display:flex;align-items:center;gap:10px">
                           <div style="width:32px;height:32px;border-radius:50%;background:linear-gradient(135deg,#6c8fff,#a78bfa);display:flex;align-items:center;justify-content:center;color:white;font-size:12px;font-weight:700">SC</div>
                           <div><div style="font-size:13px;font-weight:600">Sarah Chen</div><div style="font-size:11px;color:#aaa">Anxiety Session</div></div>
                       </div>
                       <div style="font-size:13px;color:#888">Oct 29, 2024</div>
                       <div style="font-size:13px;color:#888">11:00 AM</div>
                       <div><span style="background:#fef9c3;color:#ca8a04;padding:3px 10px;border-radius:20px;font-size:11px;font-weight:600">PENDING</span></div>
                       <div style="font-size:13px;color:#4ade80;font-weight:600">Paid</div>
                       <div><button style="background:#4ade80;color:#0f1117;border:none;padding:5px 12px;border-radius:6px;font-size:11px;font-weight:600;cursor:pointer">Accept</button></div>
                   </div>

                   <!-- Row 2 -->
                   <div style="display:grid;grid-template-columns:2fr 1fr 1fr 1.2fr 1fr 1fr;padding:14px 20px;align-items:center;border-bottom:1px solid #f0f0f0">
                       <div style="display:flex;align-items:center;gap:10px">
                           <div style="width:32px;height:32px;border-radius:50%;background:linear-gradient(135deg,#f472b6,#fb7185);display:flex;align-items:center;justify-content:center;color:white;font-size:12px;font-weight:700">MR</div>
                           <div><div style="font-size:13px;font-weight:600">Michael Ross</div><div style="font-size:11px;color:#aaa">Depression Follow-up</div></div>
                       </div>
                       <div style="font-size:13px;color:#888">Today</div>
                       <div style="font-size:13px;color:#888">11:30 AM</div>
                       <div><span style="background:#dcfce7;color:#16a34a;padding:3px 10px;border-radius:20px;font-size:11px;font-weight:600">CONFIRMED</span></div>
                       <div style="font-size:13px;color:#888">--</div>
                       <div><button style="background:#eff2ff;color:#6c8fff;border:none;padding:5px 12px;border-radius:6px;font-size:11px;font-weight:600;cursor:pointer">Reschedule</button></div>
                   </div>

                   <!-- Row 3 -->
                   <div style="display:grid;grid-template-columns:2fr 1fr 1fr 1.2fr 1fr 1fr;padding:14px 20px;align-items:center;border-bottom:1px solid #f0f0f0">
                       <div style="display:flex;align-items:center;gap:10px">
                           <div style="width:32px;height:32px;border-radius:50%;background:linear-gradient(135deg,#4ade80,#22d3ee);display:flex;align-items:center;justify-content:center;color:white;font-size:12px;font-weight:700">JM</div>
                           <div><div style="font-size:13px;font-weight:600">Jennifer Miller</div><div style="font-size:11px;color:#aaa">OCD Therapy</div></div>
                       </div>
                       <div style="font-size:13px;color:#888">Oct 25, 2022</div>
                       <div style="font-size:13px;color:#888">02:00 PM</div>
                       <div><span style="background:#eff2ff;color:#6c8fff;padding:3px 10px;border-radius:20px;font-size:11px;font-weight:600">COMPLETED</span></div>
                       <div style="font-size:13px;color:#4ade80;font-weight:600">Paid</div>
                       <div><button style="background:#f3f4f6;color:#555;border:none;padding:5px 12px;border-radius:6px;font-size:11px;font-weight:600;cursor:pointer">View</button></div>
                   </div>

                   <!-- Row 4 -->
                   <div style="display:grid;grid-template-columns:2fr 1fr 1fr 1.2fr 1fr 1fr;padding:14px 20px;align-items:center;border-bottom:1px solid #f0f0f0">
                       <div style="display:flex;align-items:center;gap:10px">
                           <div style="width:32px;height:32px;border-radius:50%;background:linear-gradient(135deg,#fbbf24,#f97316);display:flex;align-items:center;justify-content:center;color:white;font-size:12px;font-weight:700">DJ</div>
                           <div><div style="font-size:13px;font-weight:600">David Jones</div><div style="font-size:11px;color:#aaa">Stress Management</div></div>
                       </div>
                       <div style="font-size:13px;color:#888">Oct 24, 2024</div>
                       <div style="font-size:13px;color:#888">03:30 PM</div>
                       <div><span style="background:#fee2e2;color:#dc2626;padding:3px 10px;border-radius:20px;font-size:11px;font-weight:600">CANCELLED</span></div>
                       <div style="font-size:13px;color:#dc2626;font-weight:600">Unpaid</div>
                       <div><button style="background:#f3f4f6;color:#555;border:none;padding:5px 12px;border-radius:6px;font-size:11px;font-weight:600;cursor:pointer">View</button></div>
                   </div>

                   <!-- Row 5 -->
                   <div style="display:grid;grid-template-columns:2fr 1fr 1fr 1.2fr 1fr 1fr;padding:14px 20px;align-items:center">
                       <div style="display:flex;align-items:center;gap:10px">
                           <div style="width:32px;height:32px;border-radius:50%;background:linear-gradient(135deg,#a78bfa,#ec4899);display:flex;align-items:center;justify-content:center;color:white;font-size:12px;font-weight:700">ET</div>
                           <div><div style="font-size:13px;font-weight:600">Emma Thompson</div><div style="font-size:11px;color:#aaa">Initial Consultation</div></div>
                       </div>
                       <div style="font-size:13px;color:#888">Apr 25, 2025</div>
                       <div style="font-size:13px;color:#888">07:00 AM</div>
                       <div><span style="background:#dcfce7;color:#16a34a;padding:3px 10px;border-radius:20px;font-size:11px;font-weight:600">CONFIRMED</span></div>
                       <div style="font-size:13px;color:#888">Pending</div>
                       <div><button style="background:#f3f4f6;color:#555;border:none;padding:5px 12px;border-radius:6px;font-size:11px;font-weight:600;cursor:pointer">View</button></div>
                   </div>
               </div>

               <!-- Bottom 3 boxes -->
               <div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:16px">
                   <div style="background:white;border-radius:12px;padding:20px;box-shadow:0 2px 8px rgba(0,0,0,0.08)">
                       <h4 style="margin-bottom:10px">🤖 SmartInsight</h4>
                       <p style="font-size:13px;color:#888;line-height:1.6">Michael Ross has consistently attended for the last 3 sessions. Today's session is recommended for <strong style="color:#6c8fff">Resilience Building</strong>.</p>
                   </div>
                   <div style="background:white;border-radius:12px;padding:20px;box-shadow:0 2px 8px rgba(0,0,0,0.08)">
                       <h4 style="margin-bottom:10px">📅 Upcoming Availability</h4>
                       <div style="text-align:center">
                           <span style="display:inline-block;width:34px;height:34px;line-height:34px;text-align:center;border-radius:8px;font-size:13px;font-weight:600;margin:3px;background:#eff2ff;color:#6c8fff">26</span>
                           <span style="display:inline-block;width:34px;height:34px;line-height:34px;text-align:center;border-radius:8px;font-size:13px;font-weight:600;margin:3px;background:#6c8fff;color:white">27</span>
                           <span style="display:inline-block;width:34px;height:34px;line-height:34px;text-align:center;border-radius:8px;font-size:13px;font-weight:600;margin:3px;background:#dcfce7;color:#16a34a">28</span>
                           <span style="display:inline-block;width:34px;height:34px;line-height:34px;text-align:center;border-radius:8px;font-size:13px;font-weight:600;margin:3px;background:#fee2e2;color:#dc2626">29</span>
                           <span style="display:inline-block;width:34px;height:34px;line-height:34px;text-align:center;border-radius:8px;font-size:13px;font-weight:600;margin:3px;background:#dcfce7;color:#16a34a">30</span>
                       </div>
                   </div>
                   <div style="background:white;border-radius:12px;padding:20px;box-shadow:0 2px 8px rgba(0,0,0,0.08)">
                       <h4 style="margin-bottom:10px">📋 Job Calendar</h4>
                       <div style="display:flex;flex-direction:column;gap:8px">
                           <div style="display:flex;justify-content:space-between;font-size:12px"><span style="color:#888">Morning Sessions</span><span style="color:#4ade80;font-weight:600">3 slots</span></div>
                           <div style="display:flex;justify-content:space-between;font-size:12px"><span style="color:#888">Afternoon Sessions</span><span style="color:#fbbf24;font-weight:600">1 slot</span></div>
                           <div style="display:flex;justify-content:space-between;font-size:12px"><span style="color:#888">Pending Reviews</span><span style="color:#dc2626;font-weight:600">2 pending</span></div>
                       </div>
                   </div>
               </div>
           </div>

           <script>
           function showTab(tab) {
               document.getElementById('tab-history').style.display = tab === 'history' ? 'block' : 'none';
               document.getElementById('tab-appointments').style.display = tab === 'appointments' ? 'block' : 'none';
               document.getElementById('btn-history').style.background = tab === 'history' ? '#4f46e5' : 'white';
               document.getElementById('btn-history').style.color = tab === 'history' ? 'white' : '#555';
               document.getElementById('btn-appointments').style.background = tab === 'appointments' ? '#4f46e5' : 'white';
               document.getElementById('btn-appointments').style.color = tab === 'appointments' ? 'white' : '#555';
           }
           </script>
        </main>
    </div>
</body>
</html>
