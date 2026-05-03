<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MindCare | Counsellor Approvals</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="dashboard-layout">

  <!-- SIDEBAR (same across all admin pages) -->
  <aside class="sidebar">
    <div class="sidebar-header">
      <span>🧠</span> MindCare
      <div style="font-size:0.7rem;color:var(--text-muted);text-transform:uppercase;letter-spacing:.05em;margin-top:2px">Admin Portal</div>
    </div>
    <ul class="sidebar-nav">
      <li><a href="${pageContext.request.contextPath}/admin/dashboard"><span class="nav-icon">▦</span> Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/approvals" class="active"><span class="nav-icon">✔</span> Approvals <span class="nav-badge">12</span></a></li>
      <li><a href="${pageContext.request.contextPath}/admin/users"><span class="nav-icon">👥</span> Manage Users</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/resources"><span class="nav-icon">📚</span> Resources</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/analytics"><span class="nav-icon">📊</span> Analytics</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/notifications"><span class="nav-icon">🔔</span> Notifications</a></li>
    </ul>
    <div style="margin-top:auto;padding-top:1rem;border-top:1px solid var(--border)">
      <a href="${pageContext.request.contextPath}/logout" style="display:flex;align-items:center;gap:.5rem;padding:.75rem 1rem;color:var(--text-muted);border-radius:.5rem;font-weight:500;transition:all .2s">↩ Sign Out</a>
    </div>
  </aside>

  <main class="main-content">

    <!-- Topbar -->
    <div class="topbar">
      <div>
        <h1>Approvals Queue</h1>
        <p style="font-size:.85rem;color:var(--text-muted)">Review and verify credentials for pending counsellor registrations</p>
      </div>
      <div class="user-info">
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
    <div class="stats-grid" style="grid-template-columns:repeat(3,1fr);margin-bottom:1.5rem">
      <div class="stat-card" style="border-left:4px solid #f59e0b">
        <div style="font-size:2rem;padding:.5rem;background:var(--bg-color);border-radius:.75rem">📋</div>
        <div>
          <div class="stat-title">Pending Reviews</div>
          <div class="stat-value">12</div>
        </div>
      </div>
      <div class="stat-card" style="border-left:4px solid #10b981">
        <div style="font-size:2rem;padding:.5rem;background:var(--bg-color);border-radius:.75rem">✅</div>
        <div>
          <div class="stat-title">Approved This Month</div>
          <div class="stat-value">148</div>
        </div>
      </div>
      <div class="stat-card" style="border-left:4px solid #6366f1">
        <div style="font-size:2rem;padding:.5rem;background:var(--bg-color);border-radius:.75rem">⏱</div>
        <div>
          <div class="stat-title">Avg. Response Time</div>
          <div class="stat-value">4.2h</div>
        </div>
      </div>
    </div>

    <!-- Filter bar -->
    <div class="approvals-filterbar">
      <div class="filter-tabs">
        <button class="filter-tab active" onclick="filterApprovals('all',this)">All (12)</button>
        <button class="filter-tab" onclick="filterApprovals('new',this)">New (5)</button>
        <button class="filter-tab" onclick="filterApprovals('review',this)">Under Review (4)</button>
        <button class="filter-tab" onclick="filterApprovals('flagged',this)">Flagged (3)</button>
      </div>
      <input type="text" class="form-control" placeholder="🔍 Search applicant..." style="width:240px;padding:.5rem 1rem;font-size:.875rem" oninput="searchApprovals(this.value)">
    </div>

    <!-- Approval Cards Grid -->
    <div class="approvals-grid" id="approvalsGrid">

      <!-- Card 1 — NEW -->
      <div class="approval-card" data-tag="new">
        <div class="approval-card-header">
          <span class="badge badge-blue">New Submission</span>
          <span class="time-cell">2 mins ago</span>
        </div>
        <div class="counsellor-info">
          <div class="counsellor-avatar" style="background:#6366f1">MC</div>
          <div>
            <div class="counsellor-name">Dr. Michael Chen</div>
            <div class="counsellor-specialty">Clinical Psychologist</div>
            <div class="counsellor-meta">
              <span>🎓 17 Years Exp.</span>
              <span>📄 License: PSY-99203-CA</span>
            </div>
          </div>
        </div>
        <div class="approval-details">
          <div class="detail-row"><span>Specialization:</span><strong>Anxiety &amp; Depression</strong></div>
          <div class="detail-row"><span>License No:</span><strong>PSY-99203-CA</strong></div>
          <div class="detail-row"><span>CV Submitted:</span><strong><a href="#">Michael_Chen_CV.pdf</a></strong></div>
        </div>
        <div class="approval-actions">
          <button class="btn-approve" onclick="handleApproval(this,'approve')">✔ Approve</button>
          <button class="btn-reject" onclick="handleApproval(this,'reject')">✖ Reject</button>
          <button class="btn-view">👁 View Full Profile</button>
        </div>
      </div>

      <!-- Card 2 — NEW -->
      <div class="approval-card" data-tag="new">
        <div class="approval-card-header">
          <span class="badge badge-blue">New Submission</span>
          <span class="time-cell">15 mins ago</span>
        </div>
        <div class="counsellor-info">
          <div class="counsellor-avatar" style="background:#10b981">ER</div>
          <div>
            <div class="counsellor-name">Elena Rodriguez</div>
            <div class="counsellor-specialty">Family Counsellor</div>
            <div class="counsellor-meta">
              <span>🎓 6 Years Exp.</span>
              <span>📄 License: LCO09-0812-13</span>
            </div>
          </div>
        </div>
        <div class="approval-details">
          <div class="detail-row"><span>Specialization:</span><strong>Family Therapy</strong></div>
          <div class="detail-row"><span>License No:</span><strong>LCO09-0812-13</strong></div>
          <div class="detail-row"><span>CV Submitted:</span><strong><a href="#">E_Rodriguez_CV_2024.pdf</a></strong></div>
        </div>
        <div class="approval-actions">
          <button class="btn-approve" onclick="handleApproval(this,'approve')">✔ Approve</button>
          <button class="btn-reject" onclick="handleApproval(this,'reject')">✖ Reject</button>
          <button class="btn-view">👁 View Full Profile</button>
        </div>
      </div>

      <!-- Card 3 — UNDER REVIEW -->
      <div class="approval-card" data-tag="review">
        <div class="approval-card-header">
          <span class="badge badge-amber">Under Review</span>
          <span class="time-cell">1 hr ago</span>
        </div>
        <div class="counsellor-info">
          <div class="counsellor-avatar" style="background:#f59e0b">MT</div>
          <div>
            <div class="counsellor-name">Marcus Thorne</div>
            <div class="counsellor-specialty">CBT Specialist</div>
            <div class="counsellor-meta">
              <span>🎓 8 Years Exp.</span>
              <span>📄 License: LPC-10293-NY</span>
            </div>
          </div>
        </div>
        <div class="approval-details">
          <div class="detail-row"><span>Specialization:</span><strong>Cognitive Behavioral</strong></div>
          <div class="detail-row"><span>License No:</span><strong>LPC-10293-NY</strong></div>
          <div class="detail-row"><span>CV Submitted:</span><strong><a href="#">Thorne_Credentials.zip</a></strong></div>
        </div>
        <div class="approval-actions">
          <button class="btn-approve" onclick="handleApproval(this,'approve')">✔ Approve</button>
          <button class="btn-reject" onclick="handleApproval(this,'reject')">✖ Reject</button>
          <button class="btn-view">👁 View Full Profile</button>
        </div>
      </div>

      <!-- Card 4 — FLAGGED -->
      <div class="approval-card flagged-card" data-tag="flagged">
        <div class="approval-card-header">
          <span class="badge badge-red">⚠ Flagged</span>
          <span class="time-cell">3 hrs ago</span>
        </div>
        <div class="counsellor-info">
          <div class="counsellor-avatar" style="background:#ef4444">AP</div>
          <div>
            <div class="counsellor-name">Aisha Patel</div>
            <div class="counsellor-specialty">Trauma Recovery</div>
            <div class="counsellor-meta">
              <span>🎓 11 Years Exp.</span>
              <span>📄 License: PSY-4430-FL</span>
            </div>
          </div>
        </div>
        <div class="approval-details">
          <div class="detail-row flag-row"><span>⚠ Flag reason:</span><strong style="color:#dc2626">License number could not be verified with NMC Nepal</strong></div>
          <div class="detail-row"><span>CV Submitted:</span><strong><a href="#">Patel_Final_CV.pdf</a></strong></div>
        </div>
        <div class="approval-actions">
          <button class="btn-approve" onclick="handleApproval(this,'approve')">✔ Approve Anyway</button>
          <button class="btn-reject" onclick="handleApproval(this,'reject')">✖ Reject</button>
          <button class="btn-view">👁 View Full Profile</button>
        </div>
      </div>

      <!-- Card 5 — NEW -->
      <div class="approval-card" data-tag="new">
        <div class="approval-card-header">
          <span class="badge badge-blue">New Submission</span>
          <span class="time-cell">5 hrs ago</span>
        </div>
        <div class="counsellor-info">
          <div class="counsellor-avatar" style="background:#8b5cf6">SK</div>
          <div>
            <div class="counsellor-name">Sunita KC</div>
            <div class="counsellor-specialty">Child Psychologist</div>
            <div class="counsellor-meta">
              <span>🎓 4 Years Exp.</span>
              <span>📄 License: NMC-CP-2890</span>
            </div>
          </div>
        </div>
        <div class="approval-details">
          <div class="detail-row"><span>Specialization:</span><strong>Child &amp; Adolescent</strong></div>
          <div class="detail-row"><span>License No:</span><strong>NMC-CP-2890</strong></div>
          <div class="detail-row"><span>CV Submitted:</span><strong><a href="#">Sunita_KC_CV.pdf</a></strong></div>
        </div>
        <div class="approval-actions">
          <button class="btn-approve" onclick="handleApproval(this,'approve')">✔ Approve</button>
          <button class="btn-reject" onclick="handleApproval(this,'reject')">✖ Reject</button>
          <button class="btn-view">👁 View Full Profile</button>
        </div>
      </div>

      <!-- Card 6 — REVIEW -->
      <div class="approval-card" data-tag="review">
        <div class="approval-card-header">
          <span class="badge badge-amber">Under Review</span>
          <span class="time-cell">6 hrs ago</span>
        </div>
        <div class="counsellor-info">
          <div class="counsellor-avatar" style="background:#0ea5e9">BT</div>
          <div>
            <div class="counsellor-name">Bikash Tamrakar</div>
            <div class="counsellor-specialty">Addiction Counsellor</div>
            <div class="counsellor-meta">
              <span>🎓 9 Years Exp.</span>
              <span>📄 License: NMC-AC-1122</span>
            </div>
          </div>
        </div>
        <div class="approval-details">
          <div class="detail-row"><span>Specialization:</span><strong>Addiction &amp; Recovery</strong></div>
          <div class="detail-row"><span>License No:</span><strong>NMC-AC-1122</strong></div>
          <div class="detail-row"><span>CV Submitted:</span><strong><a href="#">Bikash_Tamrakar_CV.pdf</a></strong></div>
        </div>
        <div class="approval-actions">
          <button class="btn-approve" onclick="handleApproval(this,'approve')">✔ Approve</button>
          <button class="btn-reject" onclick="handleApproval(this,'reject')">✖ Reject</button>
          <button class="btn-view">👁 View Full Profile</button>
        </div>
      </div>

    </div><!-- /approvals-grid -->

    <!-- Rejection Modal -->
    <div id="rejectModal" class="modal-overlay" style="display:none">
      <div class="modal-box">
        <h3>Reject Application</h3>
        <p style="color:var(--text-muted);font-size:.875rem;margin:.75rem 0">Please provide a reason for rejection. This will be sent to the applicant.</p>
        <textarea class="form-control" id="rejectReason" rows="4" placeholder="e.g. License number could not be verified with NMC Nepal..."></textarea>
        <div style="display:flex;gap:.75rem;margin-top:1rem;justify-content:flex-end">
          <button class="btn btn-secondary" onclick="closeModal()" style="width:auto;padding:.6rem 1.25rem">Cancel</button>
          <button class="btn btn-primary" onclick="confirmReject()" style="width:auto;padding:.6rem 1.25rem;background:#dc2626;border:none">Confirm Rejection</button>
        </div>
      </div>
    </div>

  </main>
</div>

<style>
  .nav-icon { margin-right:.5rem }
  .nav-badge { margin-left:auto;background:var(--primary);color:white;font-size:.7rem;font-weight:700;padding:2px 7px;border-radius:999px }

  .approvals-filterbar {
    display: flex; justify-content: space-between; align-items: center;
    margin-bottom: 1.5rem; gap: 1rem; flex-wrap: wrap;
  }
  .filter-tabs { display: flex; gap: .5rem; }
  .filter-tab {
    padding: .45rem 1.1rem; border-radius: 999px;
    border: 1px solid var(--border); background: var(--card-bg);
    font-size: .825rem; font-weight: 500; cursor: pointer; transition: all .2s;
  }
  .filter-tab.active, .filter-tab:hover {
    background: var(--primary); color: white; border-color: var(--primary);
  }

  .approvals-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
    gap: 1.25rem;
    margin-bottom: 2rem;
  }

  .approval-card {
    background: var(--card-bg);
    border: 1px solid var(--border);
    border-radius: 1rem;
    padding: 1.25rem;
    box-shadow: var(--shadow-sm);
    transition: box-shadow .2s, transform .2s;
  }
  .approval-card:hover { box-shadow: var(--shadow-md); transform: translateY(-2px); }
  .flagged-card { border-left: 4px solid #ef4444; }

  .approval-card-header {
    display: flex; justify-content: space-between; align-items: center;
    margin-bottom: 1rem;
  }
  .counsellor-info { display: flex; gap: .9rem; align-items: flex-start; margin-bottom: 1rem; }
  .counsellor-avatar {
    width: 52px; height: 52px; border-radius: 50%; flex-shrink: 0;
    color: white; font-size: .95rem; font-weight: 700;
    display: flex; align-items: center; justify-content: center;
  }
  .counsellor-name { font-weight: 700; font-size: 1rem; }
  .counsellor-specialty { font-size: .8rem; color: var(--primary); font-weight: 500; margin-top: 2px; }
  .counsellor-meta { display: flex; flex-direction: column; gap: 3px; margin-top: 5px; }
  .counsellor-meta span { font-size: .75rem; color: var(--text-muted); }

  .approval-details { margin-bottom: 1rem; background: var(--bg-color); border-radius: .5rem; padding: .75rem; }
  .detail-row { display: flex; justify-content: space-between; font-size: .8rem; padding: 3px 0; }
  .detail-row span { color: var(--text-muted); }
  .flag-row { flex-direction: column; gap: 2px; }

  .approval-actions { display: flex; gap: .5rem; flex-wrap: wrap; }
  .btn-approve {
    flex: 1; padding: .55rem; border: none; border-radius: .5rem;
    background: #d1fae5; color: #059669; font-weight: 600; font-size: .8rem; cursor: pointer; transition: all .2s;
  }
  .btn-approve:hover { background: #059669; color: white; }
  .btn-reject {
    flex: 1; padding: .55rem; border: none; border-radius: .5rem;
    background: #fee2e2; color: #dc2626; font-weight: 600; font-size: .8rem; cursor: pointer; transition: all .2s;
  }
  .btn-reject:hover { background: #dc2626; color: white; }
  .btn-view {
    flex: 1; padding: .55rem; border: 1px solid var(--border); border-radius: .5rem;
    background: white; color: var(--text-muted); font-size: .8rem; cursor: pointer; transition: all .2s;
  }
  .btn-view:hover { border-color: var(--primary); color: var(--primary); }

  /* Badges */
  .badge { display:inline-block;padding:3px 10px;border-radius:999px;font-size:.72rem;font-weight:600 }
  .badge-green  { background:#d1fae5;color:#059669 }
  .badge-amber  { background:#fef3c7;color:#d97706 }
  .badge-blue   { background:#ede9fe;color:#4f46e5 }
  .badge-red    { background:#fee2e2;color:#dc2626 }
  .time-cell { color:var(--text-muted);font-size:.8rem }

  /* Modal */
  .modal-overlay {
    position: fixed; inset: 0; background: rgba(0,0,0,.4);
    display: flex; align-items: center; justify-content: center; z-index: 1000;
  }
  .modal-box {
    background: white; border-radius: 1rem; padding: 2rem;
    width: 100%; max-width: 460px; box-shadow: var(--shadow-lg);
  }
  .modal-box h3 { font-size: 1.25rem; font-weight: 700; }

  .stat-card { display:flex;gap:1rem;align-items:flex-start }
</style>

<script>
  let currentRejectBtn = null;

  function filterApprovals(tag, btn) {
    document.querySelectorAll('.filter-tab').forEach(t => t.classList.remove('active'));
    btn.classList.add('active');
    document.querySelectorAll('.approval-card').forEach(card => {
      card.style.display = (tag === 'all' || card.dataset.tag === tag) ? '' : 'none';
    });
  }

  function searchApprovals(val) {
    const q = val.toLowerCase();
    document.querySelectorAll('.approval-card').forEach(card => {
      const name = card.querySelector('.counsellor-name').textContent.toLowerCase();
      card.style.display = name.includes(q) ? '' : 'none';
    });
  }

  function handleApproval(btn, action) {
    if (action === 'approve') {
      const card = btn.closest('.approval-card');
      card.style.opacity = '.4';
      card.style.pointerEvents = 'none';
      const header = card.querySelector('.approval-card-header span:first-child');
      header.textContent = '✅ Approved';
      header.className = 'badge badge-green';
      // In real app: submit to AdminApprovalServlet via fetch/form
    } else {
      currentRejectBtn = btn;
      document.getElementById('rejectModal').style.display = 'flex';
    }
  }

  function closeModal() {
    document.getElementById('rejectModal').style.display = 'none';
    currentRejectBtn = null;
  }

  function confirmReject() {
    if (currentRejectBtn) {
      const card = currentRejectBtn.closest('.approval-card');
      card.style.opacity = '.4';
      card.style.pointerEvents = 'none';
      const header = card.querySelector('.approval-card-header span:first-child');
      header.textContent = '✖ Rejected';
      header.className = 'badge badge-red';
    }
    closeModal();
  }
</script>

</body>
</html>
