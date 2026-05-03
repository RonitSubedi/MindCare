<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindCare | Resource Management</title>
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
            <li><a href="${pageContext.request.contextPath}/admin/users"><span class="nav-icon">👥</span> Manage Users</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/resources" class="active"><span class="nav-icon">📚</span> Resources</a></li>
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
                <h1>Resource Library</h1>
                <p style="font-size:.85rem;color:var(--text-muted)">Manage mental health articles, guided meditations, and therapeutic toolkits</p>
            </div>
            <div class="user-info">
                <button class="res-add-btn" onclick="openAddModal()">+ Add New Resource</button>
                <div style="display:flex;align-items:center;gap:.75rem">
                    <div style="width:40px;height:40px;border-radius:50%;background:var(--primary);color:white;display:flex;align-items:center;justify-content:center;font-weight:700">AS</div>
                    <div>
                        <div style="font-weight:600;font-size:.9rem">Admin Sarah</div>
                        <div style="font-size:.75rem;color:var(--text-muted)">Super Admin</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Filter and Search bar -->
        <div class="res-controls">
            <div class="filter-tabs">
                <button class="filter-tab active" onclick="filterRes('all',this)">All</button>
                <button class="filter-tab" onclick="filterRes('anxiety',this)">Anxiety</button>
                <button class="filter-tab" onclick="filterRes('depression',this)">Depression</button>
                <button class="filter-tab" onclick="filterRes('mindfulness',this)">Mindfulness</button>
                <button class="filter-tab" onclick="filterRes('sleep',this)">Sleep</button>
                <button class="filter-tab" onclick="filterRes('trauma',this)">Trauma</button>
            </div>
            <div style="display:flex;gap:.75rem">
                <input type="text" class="form-control" placeholder="🔍 Search resources..." style="width:220px;padding:.5rem 1rem;font-size:.875rem" oninput="searchRes(this.value)">
                <select class="form-control" style="width:130px;padding:.5rem .75rem;font-size:.875rem">
                    <option>All Types</option>
                    <option>Article</option>
                    <option>Video</option>
                    <option>Audio Guide</option>
                    <option>Checklist</option>
                </select>
            </div>
        </div>

        <!-- Resource Cards Grid -->
        <div class="res-grid" id="resGrid">

            <!-- Resource 1 -->
            <div class="res-card" data-cat="mindfulness">
                <div class="res-card-top" style="background:linear-gradient(135deg,#4f46e5,#7c3aed)">
                    <span class="res-type-icon">🎧</span>
                    <span class="res-badge-new">NEW</span>
                </div>
                <div class="res-card-body">
                    <div class="res-category-tag mindfulness-tag">Mindfulness</div>
                    <div class="res-title">Mindfulness for Busy Professionals</div>
                    <div class="res-desc">A comprehensive 10-minute guide designed for workplace stress reduction.</div>
                    <div class="res-meta">
                        <span>🎧 Audio Guide · 10 min</span>
                        <span class="res-status published">Published</span>
                    </div>
                </div>
                <div class="res-card-actions">
                    <button class="res-btn edit" onclick="editResource('Mindfulness for Busy Professionals')">✏️ Edit</button>
                    <button class="res-btn unpublish" onclick="togglePublish(this)">📤 Unpublish</button>
                    <button class="res-btn delete" onclick="deleteResource(this)">🗑</button>
                </div>
            </div>

            <!-- Resource 2 -->
            <div class="res-card" data-cat="anxiety">
                <div class="res-card-top" style="background:linear-gradient(135deg,#059669,#10b981)">
                    <span class="res-type-icon">📄</span>
                </div>
                <div class="res-card-body">
                    <div class="res-category-tag anxiety-tag">Anxiety</div>
                    <div class="res-title">Rooting Techniques for Anxiety</div>
                    <div class="res-desc">Cognitive behavioral therapy grounding methods for panic and anxiety attacks.</div>
                    <div class="res-meta">
                        <span>📄 Article · 5 min read</span>
                        <span class="res-status published">Published</span>
                    </div>
                </div>
                <div class="res-card-actions">
                    <button class="res-btn edit">✏️ Edit</button>
                    <button class="res-btn unpublish" onclick="togglePublish(this)">📤 Unpublish</button>
                    <button class="res-btn delete" onclick="deleteResource(this)">🗑</button>
                </div>
            </div>

            <!-- Resource 3 -->
            <div class="res-card" data-cat="sleep">
                <div class="res-card-top" style="background:linear-gradient(135deg,#0ea5e9,#38bdf8)">
                    <span class="res-type-icon">📋</span>
                </div>
                <div class="res-card-body">
                    <div class="res-category-tag sleep-tag">Sleep</div>
                    <div class="res-title">Sleep Hygiene Checklist</div>
                    <div class="res-desc">A daily routine designed to improve circadian rhythm and sleep quality.</div>
                    <div class="res-meta">
                        <span>📋 Checklist · 3 min</span>
                        <span class="res-status published">Published</span>
                    </div>
                </div>
                <div class="res-card-actions">
                    <button class="res-btn edit">✏️ Edit</button>
                    <button class="res-btn unpublish" onclick="togglePublish(this)">📤 Unpublish</button>
                    <button class="res-btn delete" onclick="deleteResource(this)">🗑</button>
                </div>
            </div>

            <!-- Resource 4 -->
            <div class="res-card" data-cat="depression">
                <div class="res-card-top" style="background:linear-gradient(135deg,#7c3aed,#a78bfa)">
                    <span class="res-type-icon">📓</span>
                </div>
                <div class="res-card-body">
                    <div class="res-category-tag depression-tag">Depression</div>
                    <div class="res-title">Behavioural Activation Log</div>
                    <div class="res-desc">Interactive tracking tool for monitoring activities and energy levels over time.</div>
                    <div class="res-meta">
                        <span>📓 Interactive · 5 min</span>
                        <span class="res-status draft">Draft</span>
                    </div>
                </div>
                <div class="res-card-actions">
                    <button class="res-btn edit">✏️ Edit</button>
                    <button class="res-btn publish" onclick="togglePublish(this)">📥 Publish</button>
                    <button class="res-btn delete" onclick="deleteResource(this)">🗑</button>
                </div>
            </div>

            <!-- Resource 5 -->
            <div class="res-card" data-cat="trauma">
                <div class="res-card-top" style="background:linear-gradient(135deg,#d97706,#f59e0b)">
                    <span class="res-type-icon">🎬</span>
                </div>
                <div class="res-card-body">
                    <div class="res-category-tag trauma-tag">Trauma</div>
                    <div class="res-title">Understanding PTSD: A Guide</div>
                    <div class="res-desc">An informative video guide on post-traumatic stress disorder and recovery paths.</div>
                    <div class="res-meta">
                        <span>🎬 Video · 18 min</span>
                        <span class="res-status published">Published</span>
                    </div>
                </div>
                <div class="res-card-actions">
                    <button class="res-btn edit">✏️ Edit</button>
                    <button class="res-btn unpublish" onclick="togglePublish(this)">📤 Unpublish</button>
                    <button class="res-btn delete" onclick="deleteResource(this)">🗑</button>
                </div>
            </div>

            <!-- Resource 6 -->
            <div class="res-card" data-cat="anxiety">
                <div class="res-card-top" style="background:linear-gradient(135deg,#ef4444,#f87171)">
                    <span class="res-type-icon">🧘</span>
                </div>
                <div class="res-card-body">
                    <div class="res-category-tag anxiety-tag">Anxiety</div>
                    <div class="res-title">Box Breathing Technique</div>
                    <div class="res-desc">Step-by-step guided breathing exercise used by clinicians to manage acute anxiety.</div>
                    <div class="res-meta">
                        <span>🎧 Audio Guide · 7 min</span>
                        <span class="res-status published">Published</span>
                    </div>
                </div>
                <div class="res-card-actions">
                    <button class="res-btn edit">✏️ Edit</button>
                    <button class="res-btn unpublish" onclick="togglePublish(this)">📤 Unpublish</button>
                    <button class="res-btn delete" onclick="deleteResource(this)">🗑</button>
                </div>
            </div>

        </div><!-- /res-grid -->

        <!-- Add/Edit Resource Modal -->
        <div id="addModal" class="modal-overlay" style="display:none">
            <div class="modal-box" style="max-width:560px">
                <h3>Add New Resource</h3>
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;margin-top:1.25rem">
                    <div class="form-group" style="grid-column:1/-1">
                        <label>Resource Title</label>
                        <input type="text" class="form-control" placeholder="e.g., 5-Step Morning Clarity Ritual">
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <select class="form-control">
                            <option>Anxiety</option><option>Depression</option>
                            <option>Mindfulness</option><option>Sleep</option><option>Trauma</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Type</label>
                        <select class="form-control">
                            <option>Article</option><option>Audio Guide</option>
                            <option>Video</option><option>Checklist</option><option>Interactive</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Estimated Reading Time (min)</label>
                        <input type="number" class="form-control" value="5" min="1">
                    </div>
                    <div class="form-group">
                        <label>Publish Status</label>
                        <select class="form-control"><option>Published</option><option>Draft</option></select>
                    </div>
                    <div class="form-group" style="grid-column:1/-1">
                        <label>Content / Description</label>
                        <textarea class="form-control" rows="4" placeholder="Begin writing therapeutic content here..."></textarea>
                    </div>
                    <div class="form-group" style="grid-column:1/-1">
                        <label>Visible to</label>
                        <div style="display:flex;gap:1.5rem;margin-top:.5rem;font-size:.875rem">
                            <label><input type="checkbox" checked style="margin-right:.4rem"> All Patients</label>
                            <label><input type="checkbox" style="margin-right:.4rem"> Counsellors Only</label>
                            <label><input type="checkbox" checked style="margin-right:.4rem"> Featured on Homepage</label>
                        </div>
                    </div>
                </div>
                <div style="display:flex;gap:.75rem;margin-top:1rem;justify-content:flex-end">
                    <button class="btn btn-secondary" onclick="closeAddModal()" style="width:auto;padding:.6rem 1.25rem">Cancel</button>
                    <button class="btn" onclick="closeAddModal()" style="width:auto;padding:.6rem 1.25rem;background:#d1fae5;color:#059669;border:none;font-weight:600">Save as Draft</button>
                    <button class="btn btn-primary" onclick="closeAddModal()" style="width:auto;padding:.6rem 1.25rem">Save Resource</button>
                </div>
            </div>
        </div>

    </main>
</div>

<style>
    .nav-icon { margin-right:.5rem }
    .nav-badge { margin-left:auto;background:var(--primary);color:white;font-size:.7rem;font-weight:700;padding:2px 7px;border-radius:999px }

    .res-add-btn { padding:.55rem 1.25rem;background:var(--primary);color:white;border:none;border-radius:.5rem;font-weight:600;font-size:.875rem;cursor:pointer }
    .res-add-btn:hover { background:var(--primary-hover) }

    .res-controls { display:flex;justify-content:space-between;align-items:center;margin-bottom:1.5rem;flex-wrap:wrap;gap:.75rem }

    .filter-tabs { display:flex;gap:.5rem;flex-wrap:wrap }
    .filter-tab { padding:.4rem 1rem;border-radius:999px;border:1px solid var(--border);background:var(--card-bg);font-size:.8rem;font-weight:500;cursor:pointer;transition:all .2s }
    .filter-tab.active,.filter-tab:hover { background:var(--primary);color:white;border-color:var(--primary) }

    .res-grid { display:grid;grid-template-columns:repeat(auto-fill,minmax(280px,1fr));gap:1.25rem;margin-bottom:2rem }

    .res-card { background:var(--card-bg);border:1px solid var(--border);border-radius:1rem;overflow:hidden;box-shadow:var(--shadow-sm);transition:transform .2s,box-shadow .2s }
    .res-card:hover { transform:translateY(-3px);box-shadow:var(--shadow-md) }

    .res-card-top { height:100px;display:flex;align-items:flex-start;justify-content:space-between;padding:1rem;position:relative }
    .res-type-icon { font-size:2rem }
    .res-badge-new { background:white;color:var(--primary);font-size:.65rem;font-weight:700;padding:3px 8px;border-radius:999px;text-transform:uppercase;letter-spacing:.05em }

    .res-card-body { padding:1rem 1.1rem .75rem }
    .res-category-tag { display:inline-block;padding:2px 9px;border-radius:999px;font-size:.7rem;font-weight:600;margin-bottom:.5rem }
    .mindfulness-tag { background:#ede9fe;color:#4f46e5 }
    .anxiety-tag { background:#d1fae5;color:#059669 }
    .sleep-tag { background:#dbeafe;color:#1d4ed8 }
    .depression-tag { background:#f3e8ff;color:#7c3aed }
    .trauma-tag { background:#fef3c7;color:#d97706 }

    .res-title { font-weight:700;font-size:.95rem;margin-bottom:.4rem;color:var(--text-main) }
    .res-desc { font-size:.8rem;color:var(--text-muted);line-height:1.5;margin-bottom:.75rem }
    .res-meta { display:flex;justify-content:space-between;align-items:center;font-size:.75rem;color:var(--text-muted) }
    .res-status { font-weight:600;font-size:.72rem;padding:2px 9px;border-radius:999px }
    .res-status.published { background:#d1fae5;color:#059669 }
    .res-status.draft { background:#fef3c7;color:#d97706 }

    .res-card-actions { display:flex;gap:.4rem;padding:.75rem 1.1rem 1rem;border-top:1px solid var(--border) }
    .res-btn { flex:1;padding:.4rem;border:none;border-radius:.4rem;font-size:.75rem;font-weight:600;cursor:pointer;transition:all .2s }
    .res-btn.edit { background:#ede9fe;color:#4f46e5 }
    .res-btn.edit:hover { background:#4f46e5;color:white }
    .res-btn.unpublish,.res-btn.publish { background:#fef3c7;color:#d97706 }
    .res-btn.unpublish:hover { background:#d97706;color:white }
    .res-btn.publish:hover { background:#059669;color:white }
    .res-btn.delete { background:#fee2e2;color:#dc2626;flex:0 0 auto;padding:.4rem .7rem }
    .res-btn.delete:hover { background:#dc2626;color:white }

    .modal-overlay { position:fixed;inset:0;background:rgba(0,0,0,.4);display:flex;align-items:center;justify-content:center;z-index:1000 }
    .modal-box { background:white;border-radius:1rem;padding:2rem;width:100%;box-shadow:var(--shadow-lg);max-height:90vh;overflow-y:auto }
    .modal-box h3 { font-size:1.25rem;font-weight:700 }
</style>

<script>
    function filterRes(cat, btn) {
        document.querySelectorAll('.filter-tab').forEach(t => t.classList.remove('active'));
        btn.classList.add('active');
        document.querySelectorAll('.res-card').forEach(card => {
            card.style.display = (cat === 'all' || card.dataset.cat === cat) ? '' : 'none';
        });
    }

    function searchRes(val) {
        const q = val.toLowerCase();
        document.querySelectorAll('.res-card').forEach(card => {
            const title = card.querySelector('.res-title').textContent.toLowerCase();
            card.style.display = title.includes(q) ? '' : 'none';
        });
    }

    function togglePublish(btn) {
        const statusEl = btn.closest('.res-card').querySelector('.res-status');
        if (statusEl.classList.contains('published')) {
            statusEl.textContent = 'Draft';
            statusEl.className = 'res-status draft';
            btn.textContent = '📥 Publish';
            btn.className = 'res-btn publish';
            btn.onclick = function(){ togglePublish(this); };
        } else {
            statusEl.textContent = 'Published';
            statusEl.className = 'res-status published';
            btn.textContent = '📤 Unpublish';
            btn.className = 'res-btn unpublish';
            btn.onclick = function(){ togglePublish(this); };
        }
    }

    function deleteResource(btn) {
        if (confirm('Delete this resource? This cannot be undone.')) {
            const card = btn.closest('.res-card');
            card.style.transition = 'opacity .3s, transform .3s';
            card.style.opacity = '0';
            card.style.transform = 'scale(.95)';
            setTimeout(() => card.remove(), 300);
        }
    }

    function editResource(title) {
        document.querySelector('#addModal h3').textContent = 'Edit: ' + title;
        openAddModal();
    }

    function openAddModal() { document.getElementById('addModal').style.display = 'flex'; }
    function closeAddModal() {
        document.getElementById('addModal').style.display = 'none';
        document.querySelector('#addModal h3').textContent = 'Add New Resource';
    }
</script>

</body>
</html>
