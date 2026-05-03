<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MindCare | Manage Users</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="dashboard-layout">

  <!-- SIDEBAR -->
  <aside class="sidebar">
    <div class="sidebar-header">
      <span>🧠</span> MindCare
      <div style="font-size:.7rem;color:var(--text-muted);text-transform:uppercase;letter-spacing:.05em;margin-top:2px">Admin Portal</div>
    </div>
    <ul class="sidebar-nav">
      <li><a href="${pageContext.request.contextPath}/admin/dashboard"><span class="nav-icon">▦</span> Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/approvals"><span class="nav-icon">✔</span> Approvals <span class="nav-badge">12</span></a></li>
      <li><a href="${pageContext.request.contextPath}/admin/users" class="active"><span class="nav-icon">👥</span> Manage Users</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/resources"><span class="nav-icon">📚</span> Resources</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/analytics"><span class="nav-icon">📊</span> Analytics</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/notifications"><span class="nav-icon">🔔</span> Notifications</a></li>
    </ul>
    <div style="margin-top:auto;padding-top:1rem;border-top:1px solid var(--border)">
      <a href="${pageContext.request.contextPath}/logout" style="display:flex;align-items:center;gap:.5rem;padding:.75rem 1rem;color:var(--text-muted);border-radius:.5rem;font-weight:500">↩ Sign Out</a>
    </div>
  </aside>

  <main class="main-content">

    <!-- Topbar -->
    <div class="topbar">
      <div>
        <h1>Manage Users</h1>
        <p style="font-size:.85rem;color:var(--text-muted)">View, filter and manage all registered patients and counsellors</p>
      </div>
      <div class="user-info">
        <button class="mu-register-btn" onclick="openRegisterModal()">+ Register New User</button>
        <div style="display:flex;align-items:center;gap:.75rem">
          <div style="width:40px;height:40px;border-radius:50%;background:var(--primary);color:white;display:flex;align-items:center;justify-content:center;font-weight:700">AS</div>
          <div>
            <div style="font-weight:600;font-size:.9rem">Admin Sarah</div>
            <div style="font-size:.75rem;color:var(--text-muted)">Super Admin</div>
          </div>
        </div>
      </div>
    </div>

    <!-- Summary stats -->
    <div class="stats-grid" style="grid-template-columns:repeat(4,1fr);margin-bottom:1.5rem">
      <div class="stat-card" style="border-left:4px solid #4f46e5">
        <div style="font-size:2rem;padding:.5rem;background:var(--bg-color);border-radius:.75rem">👥</div>
        <div><div class="stat-title">Total Users</div><div class="stat-value">1,248</div><div style="font-size:.75rem;color:#059669;margin-top:4px">▲ +14% this month</div></div>
      </div>
      <div class="stat-card" style="border-left:4px solid #10b981">
        <div style="font-size:2rem;padding:.5rem;background:var(--bg-color);border-radius:.75rem">🤝</div>
        <div><div class="stat-title">Counsellors</div><div class="stat-value">87</div><div style="font-size:.75rem;color:#059669;margin-top:4px">Active &amp; Approved</div></div>
      </div>
      <div class="stat-card" style="border-left:4px solid #f59e0b">
        <div style="font-size:2rem;padding:.5rem;background:var(--bg-color);border-radius:.75rem">🧑‍⚕️</div>
        <div><div class="stat-title">Patients</div><div class="stat-value">1,161</div><div style="font-size:.75rem;color:#d97706;margin-top:4px">87% Active</div></div>
      </div>
      <div class="stat-card" style="border-left:4px solid #ef4444">
        <div style="font-size:2rem;padding:.5rem;background:var(--bg-color);border-radius:.75rem">🚫</div>
        <div><div class="stat-title">Suspended</div><div class="stat-value">14</div><div style="font-size:.75rem;color:#dc2626;margin-top:4px">Requires review</div></div>
      </div>
    </div>

    <!-- Controls row -->
    <div class="mu-controls">
      <!-- Role tabs -->
      <div class="filter-tabs">
        <button class="filter-tab active" onclick="filterRole('all',this)">All Users</button>
        <button class="filter-tab" onclick="filterRole('counsellor',this)">Counsellors</button>
        <button class="filter-tab" onclick="filterRole('patient',this)">Patients</button>
      </div>
      <div class="mu-right-controls">
        <input type="text" class="form-control" placeholder="🔍 Search users..." style="width:220px;padding:.5rem 1rem;font-size:.875rem" oninput="searchUsers(this.value)">
        <select class="form-control" style="width:150px;padding:.5rem .75rem;font-size:.875rem" onchange="filterStatus(this.value)">
          <option value="all">All Statuses</option>
          <option value="Active">Active</option>
          <option value="Pending">Pending</option>
          <option value="Suspended">Suspended</option>
        </select>
      </div>
    </div>

    <!-- Users Table -->
    <div class="card" style="padding:0;overflow:hidden;margin-bottom:1.5rem">
      <table class="mu-table" id="usersTable">
        <thead>
        <tr>
          <th><input type="checkbox" id="selectAll" onchange="toggleSelectAll(this)"></th>
          <th>User</th>
          <th>Role</th>
          <th>Email</th>
          <th>Status</th>
          <th>Joined</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody id="usersBody">
        <!-- Row 1 -->
        <tr data-role="counsellor" data-status="Active">
          <td><input type="checkbox" class="row-check"></td>
          <td>
            <div class="mu-user-cell">
              <div class="mini-av" style="background:#6366f1">SM</div>
              <div>
                <div class="mu-username">Sarah Miller</div>
                <div class="mu-userid">ID #41,425 · MSC</div>
              </div>
            </div>
          </td>
          <td><span class="role-tag counsellor-tag">Counsellor</span></td>
          <td class="mu-email">s.miller@serenity.care</td>
          <td><span class="status-dot active"></span> Active</td>
          <td class="mu-date">Oct 12, 2023</td>
          <td class="mu-actions">
            <button class="action-btn view-btn" onclick="viewUser('Sarah Miller')">👁</button>
            <button class="action-btn edit-btn" onclick="editUser('Sarah Miller')">✏️</button>
            <button class="action-btn suspend-btn" onclick="suspendUser(this)">🚫</button>
          </td>
        </tr>
        <!-- Row 2 -->
        <tr data-role="patient" data-status="Pending">
          <td><input type="checkbox" class="row-check"></td>
          <td>
            <div class="mu-user-cell">
              <div class="mini-av" style="background:#f59e0b">DC</div>
              <div>
                <div class="mu-username">David Chen</div>
                <div class="mu-userid">ID #41,289 · TGS</div>
              </div>
            </div>
          </td>
          <td><span class="role-tag patient-tag">Patient</span></td>
          <td class="mu-email">d.chen@gmail.com</td>
          <td><span class="status-dot pending"></span> Pending</td>
          <td class="mu-date">Nov 03, 2023</td>
          <td class="mu-actions">
            <button class="action-btn view-btn" onclick="viewUser('David Chen')">👁</button>
            <button class="action-btn edit-btn">✏️</button>
            <button class="action-btn suspend-btn" onclick="suspendUser(this)">🚫</button>
          </td>
        </tr>
        <!-- Row 3 -->
        <tr data-role="counsellor" data-status="Suspended">
          <td><input type="checkbox" class="row-check"></td>
          <td>
            <div class="mu-user-cell">
              <div class="mini-av" style="background:#ef4444">JW</div>
              <div>
                <div class="mu-username">Jessica Wong</div>
                <div class="mu-userid">ID #40,334 · ANN</div>
              </div>
            </div>
          </td>
          <td><span class="role-tag counsellor-tag">Counsellor</span></td>
          <td class="mu-email">jessica.w@serenity.care</td>
          <td><span class="status-dot suspended"></span> Suspended</td>
          <td class="mu-date">Aug 29, 2023</td>
          <td class="mu-actions">
            <button class="action-btn view-btn">👁</button>
            <button class="action-btn edit-btn">✏️</button>
            <button class="action-btn activate-btn" onclick="activateUser(this)">✔</button>
          </td>
        </tr>
        <!-- Row 4 -->
        <tr data-role="patient" data-status="Active">
          <td><input type="checkbox" class="row-check"></td>
          <td>
            <div class="mu-user-cell">
              <div class="mini-av" style="background:#10b981">MT</div>
              <div>
                <div class="mu-username">Marcus Thorne</div>
                <div class="mu-userid">ID #41,425 · TGA</div>
              </div>
            </div>
          </td>
          <td><span class="role-tag patient-tag">Patient</span></td>
          <td class="mu-email">m.thorne@outlook.com</td>
          <td><span class="status-dot active"></span> Active</td>
          <td class="mu-date">Jan 15, 2024</td>
          <td class="mu-actions">
            <button class="action-btn view-btn">👁</button>
            <button class="action-btn edit-btn">✏️</button>
            <button class="action-btn suspend-btn" onclick="suspendUser(this)">🚫</button>
          </td>
        </tr>
        <!-- Row 5 -->
        <tr data-role="patient" data-status="Active">
          <td><input type="checkbox" class="row-check"></td>
          <td>
            <div class="mu-user-cell">
              <div class="mini-av" style="background:#8b5cf6">EL</div>
              <div>
                <div class="mu-username">Elena Lopez</div>
                <div class="mu-userid">ID #40,211 · SMT</div>
              </div>
            </div>
          </td>
          <td><span class="role-tag patient-tag">Patient</span></td>
          <td class="mu-email">elena.l@gmail.com</td>
          <td><span class="status-dot active"></span> Active</td>
          <td class="mu-date">Dec 05, 2023</td>
          <td class="mu-actions">
            <button class="action-btn view-btn">👁</button>
            <button class="action-btn edit-btn">✏️</button>
            <button class="action-btn suspend-btn" onclick="suspendUser(this)">🚫</button>
          </td>
        </tr>
        <!-- Row 6 -->
        <tr data-role="counsellor" data-status="Active">
          <td><input type="checkbox" class="row-check"></td>
          <td>
            <div class="mu-user-cell">
              <div class="mini-av" style="background:#0ea5e9">BT</div>
              <div>
                <div class="mu-username">Bikash Tamrakar</div>
                <div class="mu-userid">ID #39,980 · NMC</div>
              </div>
            </div>
          </td>
          <td><span class="role-tag counsellor-tag">Counsellor</span></td>
          <td class="mu-email">b.tamrakar@mindcare.np</td>
          <td><span class="status-dot active"></span> Active</td>
          <td class="mu-date">Feb 18, 2024</td>
          <td class="mu-actions">
            <button class="action-btn view-btn">👁</button>
            <button class="action-btn edit-btn">✏️</button>
            <button class="action-btn suspend-btn" onclick="suspendUser(this)">🚫</button>
          </td>
        </tr>
        </tbody>
      </table>
      <!-- Pagination -->
      <div class="mu-pagination">
        <span style="font-size:.85rem;color:var(--text-muted)">Showing 1–6 of 1,248 users</span>
        <div class="page-btns">
          <button class="page-btn" disabled>‹</button>
          <button class="page-btn active">1</button>
          <button class="page-btn">2</button>
          <button class="page-btn">3</button>
          <span style="padding:.4rem">…</span>
          <button class="page-btn">42</button>
          <button class="page-btn">›</button>
        </div>
      </div>
    </div>

    <!-- Bulk action bar (shown when rows selected) -->
    <div id="bulkBar" class="bulk-bar" style="display:none">
      <span id="selectedCount">0 users selected</span>
      <button class="bulk-btn suspend">🚫 Suspend Selected</button>
      <button class="bulk-btn activate">✔ Activate Selected</button>
      <button class="bulk-btn danger">🗑 Delete Selected</button>
    </div>

    <!-- Register Modal -->
    <div id="registerModal" class="modal-overlay" style="display:none">
      <div class="modal-box" style="max-width:500px">
        <h3>Register New User</h3>
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;margin-top:1rem">
          <div class="form-group"><label>Full Name</label><input type="text" class="form-control" placeholder="Ramesh Shrestha"></div>
          <div class="form-group"><label>Email</label><input type="email" class="form-control" placeholder="name@example.com"></div>
          <div class="form-group"><label>Phone</label><input type="text" class="form-control" placeholder="+977-98XXXXXXXX"></div>
          <div class="form-group"><label>Role</label>
            <select class="form-control"><option>Patient</option><option>Counsellor</option></select>
          </div>
        </div>
        <div class="form-group"><label>Temporary Password</label><input type="password" class="form-control" placeholder="••••••••"></div>
        <div style="display:flex;gap:.75rem;margin-top:1rem;justify-content:flex-end">
          <button class="btn btn-secondary" onclick="closeRegisterModal()" style="width:auto;padding:.6rem 1.25rem">Cancel</button>
          <button class="btn btn-primary" onclick="closeRegisterModal()" style="width:auto;padding:.6rem 1.25rem">Create User</button>
        </div>
      </div>
    </div>

  </main>
</div>

<style>
  .nav-icon { margin-right:.5rem }
  .nav-badge { margin-left:auto;background:var(--primary);color:white;font-size:.7rem;font-weight:700;padding:2px 7px;border-radius:999px }

  .mu-register-btn {
    padding:.55rem 1.25rem; background:var(--primary); color:white;
    border:none; border-radius:.5rem; font-weight:600; font-size:.875rem; cursor:pointer;
  }
  .mu-register-btn:hover { background:var(--primary-hover); }

  .mu-controls { display:flex;justify-content:space-between;align-items:center;margin-bottom:1rem;flex-wrap:wrap;gap:.75rem }
  .mu-right-controls { display:flex;gap:.75rem;align-items:center }

  .filter-tabs { display:flex;gap:.5rem }
  .filter-tab { padding:.45rem 1.1rem;border-radius:999px;border:1px solid var(--border);background:var(--card-bg);font-size:.825rem;font-weight:500;cursor:pointer;transition:all .2s }
  .filter-tab.active,.filter-tab:hover { background:var(--primary);color:white;border-color:var(--primary) }

  .mu-table { width:100%;border-collapse:collapse;font-size:.875rem }
  .mu-table thead th { text-align:left;padding:.9rem 1rem;font-size:.75rem;text-transform:uppercase;color:var(--text-muted);border-bottom:2px solid var(--border);background:var(--bg-color) }
  .mu-table tbody td { padding:.85rem 1rem;border-bottom:1px solid var(--border);vertical-align:middle }
  .mu-table tbody tr:hover td { background:rgba(79,70,229,.03) }
  .mu-table tbody tr:last-child td { border-bottom:none }

  .mu-user-cell { display:flex;align-items:center;gap:.65rem }
  .mini-av { width:36px;height:36px;border-radius:50%;color:white;font-size:.72rem;font-weight:700;display:flex;align-items:center;justify-content:center;flex-shrink:0 }
  .mu-username { font-weight:600;font-size:.875rem }
  .mu-userid { font-size:.72rem;color:var(--text-muted) }
  .mu-email { color:var(--text-muted);font-size:.82rem }
  .mu-date { color:var(--text-muted);font-size:.82rem }

  .role-tag { display:inline-block;padding:3px 10px;border-radius:999px;font-size:.72rem;font-weight:600 }
  .counsellor-tag { background:#ede9fe;color:#4f46e5 }
  .patient-tag { background:#d1fae5;color:#059669 }

  .status-dot { display:inline-block;width:8px;height:8px;border-radius:50%;margin-right:5px }
  .status-dot.active { background:#10b981 }
  .status-dot.pending { background:#f59e0b }
  .status-dot.suspended { background:#ef4444 }

  .mu-actions { display:flex;gap:.35rem }
  .action-btn { width:32px;height:32px;border:1px solid var(--border);border-radius:.4rem;background:white;cursor:pointer;font-size:.8rem;display:flex;align-items:center;justify-content:center;transition:all .2s }
  .action-btn:hover { border-color:var(--primary) }
  .suspend-btn:hover { background:#fee2e2;border-color:#ef4444 }
  .activate-btn { background:#d1fae5;color:#059669;border-color:#10b981 }

  .mu-pagination { display:flex;justify-content:space-between;align-items:center;padding:1rem 1.5rem;border-top:1px solid var(--border) }
  .page-btns { display:flex;gap:.3rem;align-items:center }
  .page-btn { padding:.35rem .65rem;border:1px solid var(--border);border-radius:.4rem;background:white;cursor:pointer;font-size:.8rem }
  .page-btn.active { background:var(--primary);color:white;border-color:var(--primary) }
  .page-btn:disabled { opacity:.4;cursor:not-allowed }

  .bulk-bar {
    position:fixed;bottom:2rem;left:50%;transform:translateX(-50%);
    background:#1f2937;color:white;border-radius:1rem;
    padding:.75rem 1.5rem;display:flex;align-items:center;gap:1rem;
    box-shadow:var(--shadow-lg);font-size:.875rem;font-weight:500;z-index:100;
  }
  .bulk-btn { padding:.4rem .9rem;border:none;border-radius:.4rem;cursor:pointer;font-size:.8rem;font-weight:600 }
  .bulk-btn.suspend { background:#fef3c7;color:#d97706 }
  .bulk-btn.activate { background:#d1fae5;color:#059669 }
  .bulk-btn.danger { background:#fee2e2;color:#dc2626 }

  .stat-card { display:flex;gap:1rem;align-items:flex-start }

  .modal-overlay { position:fixed;inset:0;background:rgba(0,0,0,.4);display:flex;align-items:center;justify-content:center;z-index:1000 }
  .modal-box { background:white;border-radius:1rem;padding:2rem;width:100%;box-shadow:var(--shadow-lg) }
  .modal-box h3 { font-size:1.25rem;font-weight:700 }
</style>

<script>
  function filterRole(role, btn) {
    document.querySelectorAll('.filter-tab').forEach(t => t.classList.remove('active'));
    btn.classList.add('active');
    document.querySelectorAll('#usersBody tr').forEach(row => {
      row.style.display = (role === 'all' || row.dataset.role === role) ? '' : 'none';
    });
  }

  function filterStatus(val) {
    document.querySelectorAll('#usersBody tr').forEach(row => {
      row.style.display = (val === 'all' || row.dataset.status === val) ? '' : 'none';
    });
  }

  function searchUsers(val) {
    const q = val.toLowerCase();
    document.querySelectorAll('#usersBody tr').forEach(row => {
      const name = row.querySelector('.mu-username').textContent.toLowerCase();
      row.style.display = name.includes(q) ? '' : 'none';
    });
  }

  function toggleSelectAll(cb) {
    document.querySelectorAll('.row-check').forEach(c => c.checked = cb.checked);
    updateBulkBar();
  }

  document.addEventListener('change', function(e) {
    if (e.target.classList.contains('row-check')) updateBulkBar();
  });

  function updateBulkBar() {
    const checked = document.querySelectorAll('.row-check:checked').length;
    const bar = document.getElementById('bulkBar');
    bar.style.display = checked > 0 ? 'flex' : 'none';
    document.getElementById('selectedCount').textContent = checked + ' user' + (checked > 1 ? 's' : '') + ' selected';
  }

  function suspendUser(btn) {
    const row = btn.closest('tr');
    const statusCell = row.cells[4];
    statusCell.innerHTML = '<span class="status-dot suspended"></span> Suspended';
    row.dataset.status = 'Suspended';
    btn.textContent = '✔';
    btn.className = 'action-btn activate-btn';
    btn.onclick = function(){ activateUser(this); };
  }

  function activateUser(btn) {
    const row = btn.closest('tr');
    const statusCell = row.cells[4];
    statusCell.innerHTML = '<span class="status-dot active"></span> Active';
    row.dataset.status = 'Active';
    btn.textContent = '🚫';
    btn.className = 'action-btn suspend-btn';
    btn.onclick = function(){ suspendUser(this); };
  }

  function viewUser(name) { alert('Viewing profile: ' + name + '\n(Connect to AdminUserServlet for real data)'); }
  function editUser(name) { alert('Edit form for: ' + name + '\n(Connect to AdminUserServlet for real data)'); }
  function openRegisterModal() { document.getElementById('registerModal').style.display = 'flex'; }
  function closeRegisterModal() { document.getElementById('registerModal').style.display = 'none'; }
</script>

</body>
</html>
