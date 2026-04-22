<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - ManaSewa</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500;600&family=DM+Serif+Display:ital@0;1&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --navy:      #1a2744;
            --navy-mid:  #243358;
            --accent:    #2d6ef6;
            --accent-lt: #e8efff;
            --green:     #edfaf3;
            --green-dk:  #1a7a4a;
            --surface:   #ffffff;
            --panel-bg:  #f4f5f8;
            --border:    #dde2ee;
            --text:      #1c2640;
            --muted:     #7a849e;
            --label:     #8a94ab;
            --radius:    10px;
            --input-h:   44px;
        }

        html, body {
            height: 100%;
            font-family: 'DM Sans', sans-serif;
            background: var(--panel-bg);
            color: var(--text);
        }

        /* ── Layout ── */
        .page {
            display: grid;
            grid-template-columns: 1fr 1.3fr;
            min-height: 100vh;
        }

        /* ── Left hero panel ── */
        .hero {
            background: linear-gradient(160deg, #1a2744 0%, #243358 60%, #1e3a6e 100%);
            display: flex;
            flex-direction: column;
            padding: 2.5rem 3rem;
            position: relative;
            overflow: hidden;
        }
        .hero::before {
            content: '';
            position: absolute;
            inset: 0;
            background: radial-gradient(ellipse at 30% 60%, rgba(45,110,246,0.18) 0%, transparent 65%);
        }
        .hero-logo {
            font-family: 'DM Sans', sans-serif;
            font-weight: 600;
            font-size: 1.3rem;
            color: #fff;
            letter-spacing: -0.02em;
            position: relative;
            z-index: 1;
        }
        .hero-body {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            z-index: 1;
        }
        .hero-badge {
            display: inline-block;
            font-size: 0.7rem;
            font-weight: 600;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: #7faaff;
            border: 1px solid rgba(127,170,255,0.35);
            border-radius: 20px;
            padding: 0.28rem 0.85rem;
            margin-bottom: 1.6rem;
            width: fit-content;
        }
        .hero h1 {
            font-family: 'DM Serif Display', serif;
            font-size: 2.55rem;
            line-height: 1.18;
            color: #fff;
            margin-bottom: 1.2rem;
        }
        .hero h1 em {
            font-style: italic;
            color: #a8c4ff;
        }
        .hero-desc {
            font-size: 0.9rem;
            line-height: 1.7;
            color: rgba(255,255,255,0.65);
            max-width: 320px;
        }
        .testimonial {
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 12px;
            padding: 1.4rem 1.6rem;
            margin-top: 3rem;
            position: relative;
            z-index: 1;
        }
        .testimonial p {
            font-size: 0.84rem;
            line-height: 1.65;
            color: rgba(255,255,255,0.8);
            font-style: italic;
        }
        .testimonial-author {
            display: flex;
            align-items: center;
            gap: 0.7rem;
            margin-top: 1rem;
        }
        .avatar {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            background: linear-gradient(135deg, #4a90e2, #7faaff);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.75rem;
            font-weight: 600;
            color: #fff;
            flex-shrink: 0;
        }
        .author-info { line-height: 1.3; }
        .author-name { font-size: 0.82rem; font-weight: 600; color: #fff; }
        .author-title { font-size: 0.74rem; color: rgba(255,255,255,0.5); }

        .hero-footer {
            font-size: 0.72rem;
            color: rgba(255,255,255,0.3);
            position: relative;
            z-index: 1;
        }

        /* ── Right form panel ── */
        .form-panel {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 3rem 2rem;
            background: var(--surface);
            overflow-y: auto;
        }
        .form-box {
            width: 100%;
            max-width: 480px;
        }
        .form-title {
            font-family: 'DM Serif Display', serif;
            font-size: 1.9rem;
            color: var(--text);
            margin-bottom: 0.35rem;
        }
        .form-subtitle {
            font-size: 0.875rem;
            color: var(--muted);
            margin-bottom: 2rem;
        }

        /* ── Role toggle ── */
        .role-label {
            font-size: 0.68rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--label);
            margin-bottom: 0.65rem;
        }
        .role-toggle {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0.75rem;
            margin-bottom: 1.6rem;
        }
        .role-btn {
            display: flex;
            align-items: center;
            gap: 0.65rem;
            padding: 0.8rem 1rem;
            border: 2px solid var(--border);
            border-radius: var(--radius);
            background: var(--surface);
            cursor: pointer;
            transition: border-color 0.18s, background 0.18s, box-shadow 0.18s;
        }
        .role-btn.active {
            border-color: var(--accent);
            background: var(--accent-lt);
            box-shadow: 0 0 0 3px rgba(45,110,246,0.1);
        }
        .role-icon {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            background: var(--accent-lt);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }
        .role-btn.active .role-icon { background: rgba(45,110,246,0.15); }
        .role-icon svg { width: 16px; height: 16px; stroke: var(--accent); fill: none; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }
        .role-text-wrap .role-name { font-size: 0.9rem; font-weight: 600; color: var(--text); }
        .role-text-wrap .role-sub  { font-size: 0.73rem; color: var(--muted); }

        /* ── Form fields ── */
        .field-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0.9rem;
        }
        .field { margin-bottom: 1rem; }
        .field label {
            display: block;
            font-size: 0.68rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--label);
            margin-bottom: 0.45rem;
        }
        .field input,
        .field select {
            width: 100%;
            height: var(--input-h);
            border: 1.5px solid var(--border);
            border-radius: var(--radius);
            background: #fafbfe;
            font-family: 'DM Sans', sans-serif;
            font-size: 0.875rem;
            color: var(--text);
            padding: 0 0.9rem;
            outline: none;
            transition: border-color 0.18s, box-shadow 0.18s;
            appearance: none;
        }
        .field input::placeholder { color: #c0c8da; }
        .field input:focus,
        .field select:focus {
            border-color: var(--accent);
            background: #fff;
            box-shadow: 0 0 0 3px rgba(45,110,246,0.1);
        }
        .select-wrap { position: relative; }
        .select-wrap::after {
            content: '';
            position: absolute;
            right: 0.9rem;
            top: 50%;
            transform: translateY(-50%);
            border: 5px solid transparent;
            border-top-color: var(--muted);
            pointer-events: none;
        }

        /* ── Counsellor section ── */
        .pro-section {
            border: 1.5px solid var(--border);
            border-radius: var(--radius);
            padding: 1.2rem 1.2rem 0.4rem;
            margin-bottom: 1rem;
            display: none;
        }
        .pro-section.visible { display: block; }
        .pro-section-title {
            font-size: 0.72rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--label);
            margin-bottom: 1rem;
        }

        /* ── Security note ── */
        .security-note {
            display: flex;
            align-items: center;
            gap: 0.55rem;
            background: var(--green);
            border-radius: 8px;
            padding: 0.65rem 0.9rem;
            margin-bottom: 1.25rem;
            font-size: 0.775rem;
            color: var(--green-dk);
        }
        .security-note svg { width: 14px; height: 14px; flex-shrink: 0; fill: var(--green-dk); }

        /* ── Alert ── */
        .alert {
            border-radius: 8px;
            padding: 0.75rem 1rem;
            font-size: 0.84rem;
            margin-bottom: 1.2rem;
        }
        .alert-danger { background: #fff0f0; color: #b00020; border: 1px solid #ffd4d4; }
        .alert-success { background: var(--green); color: var(--green-dk); border: 1px solid #b7eecf; }

        /* ── Submit button ── */
        .btn-submit {
            width: 100%;
            height: 48px;
            background: var(--navy);
            color: #fff;
            font-family: 'DM Sans', sans-serif;
            font-size: 0.9rem;
            font-weight: 600;
            border: none;
            border-radius: var(--radius);
            cursor: pointer;
            transition: background 0.18s, transform 0.1s;
            letter-spacing: 0.02em;
        }
        .btn-submit:hover  { background: var(--accent); }
        .btn-submit:active { transform: scale(0.99); }

        .signin-link {
            text-align: center;
            font-size: 0.82rem;
            color: var(--muted);
            margin-top: 1.1rem;
        }
        .signin-link a { color: var(--accent); font-weight: 600; text-decoration: none; }
        .signin-link a:hover { text-decoration: underline; }

        /* ── Responsive ── */
        @media (max-width: 860px) {
            .page { grid-template-columns: 1fr; }
            .hero { display: none; }
            .form-panel { padding: 2rem 1.2rem; }
        }
    </style>
</head>
<body>

<div class="page">

    <!-- ═══ LEFT HERO ═══ -->
    <aside class="hero">
        <div class="hero-logo">ManaSewa</div>

        <div class="hero-body">
            <span class="hero-badge">Join our community</span>
            <h1>A Sanctuary for<br><em>Mental Clarity.</em></h1>
            <p class="hero-desc">
                Whether you're seeking support or offering it,
                MindCare provides the authoritative tools and
                empathetic space needed for meaningful transformation.
            </p>

            <div class="testimonial">
                <p>"The approach here isn't just clinical. It feels deeply human. It's the standard for modern mental health care."</p>
                <div class="testimonial-author">
                    <div class="avatar">ET</div>
                    <div class="author-info">
                        <div class="author-name">Dr. Ram Nepali</div>
                        <div class="author-title">Clinical Director</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="hero-footer">© 2026 MindCare Behavioral Health Services.</div>
    </aside>

    <!-- ═══ RIGHT FORM ═══ -->
    <main class="form-panel">
        <div class="form-box">

            <h1 class="form-title">Create your account</h1>
            <p class="form-subtitle">Start your journey toward holistic wellness today.</p>

            <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("errorMessage") %></div>
            <% } %>
            <% if (request.getAttribute("successMessage") != null) { %>
            <div class="alert alert-success"><%= request.getAttribute("successMessage") %></div>
            <% } %>

            <!-- Role toggle (visual only — hidden input carries the real value) -->
            <div class="role-label">I am registering as a...</div>
            <div class="role-toggle">
                <button type="button" class="role-btn active" id="btn-patient" onclick="selectRole('PATIENT')">
                    <div class="role-icon">
                        <svg viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                    </div>
                    <div class="role-text-wrap">
                        <div class="role-name">Patient</div>
                        <div class="role-sub">Seeking support</div>
                    </div>
                </button>
                <button type="button" class="role-btn" id="btn-counsellor" onclick="selectRole('COUNSELLOR')">
                    <div class="role-icon">
                        <svg viewBox="0 0 24 24"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 12 19.79 19.79 0 0 1 1.61 3.44 2 2 0 0 1 3.6 1.27h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L7.91 9a16 16 0 0 0 6.1 6.1l1.91-1.91a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
                    </div>
                    <div class="role-text-wrap">
                        <div class="role-name">Counsellor</div>
                        <div class="role-sub">Providing care</div>
                    </div>
                </button>
            </div>

            <form action="register" method="post" onsubmit="return validateForm()">
                <input type="hidden" id="role" name="role" value="PATIENT">

                <div class="field-row">
                    <div class="field">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" required placeholder="John Doe">
                    </div>
                    <div class="field">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" required placeholder="john@example.com">
                    </div>
                </div>

                <div class="field">
                    <label for="phone">Phone Number</label>

                    <div style="display:flex; gap:8px;">
                        <!-- Country Code -->
                        <select id="countryCode" name="countryCode" style="width:120px;">
                            <option value="+977">🇳🇵 +977</option>
                            <option value="+91">🇮🇳 +91</option>
                            <option value="+1">🇺🇸 +1</option>
                            <option value="+44">🇬🇧 +44</option>
                            <option value="+61">🇦🇺 +61</option>
                            <option value="+81">🇯🇵 +81</option>
                            <option value="+49">🇩🇪 +49</option>
                        </select>

                        <!-- Phone Number -->
                        <input type="tel"
                               id="phone"
                               name="phone"
                               required
                               placeholder="Enter number"
                               pattern="[0-9]{6,15}"
                               maxlength="15"
                               title="Enter 6 to 15 digit phone number">
                    </div>
                </div>

                <!-- Counsellor-only credentials -->
                <div class="pro-section" id="proSection">
                    <div class="pro-section-title">Professional Credentials (Counsellors Only)</div>

                    <div class="field-row">
                        <div class="field">
                            <label for="specialization">Specialization</label>
                            <div class="select-wrap">
                                <select id="specialization" name="specialization">
                                    <option value="">Select specialization</option>
                                    <option value="Clinical Psychology">Clinical Psychology</option>
                                    <option value="Cognitive Behavioral Therapy">Cognitive Behavioral Therapy</option>
                                    <option value="Family Therapy">Family Therapy</option>
                                    <option value="Trauma Therapy">Trauma Therapy</option>
                                    <option value="Addiction Counseling">Addiction Counseling</option>
                                    <option value="Child & Adolescent Therapy">Child &amp; Adolescent Therapy</option>
                                    <option value="Grief Counseling">Grief Counseling</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="field">
                            <label for="experienceYears">Experience (Years)</label>
                            <input type="number" id="experienceYears" name="experienceYears" min="0" max="60" placeholder="0">
                        </div>
                    </div>

                    <div class="field">
                        <label for="licenseNumber">License Number</label>
                        <input type="text" id="licenseNumber" name="licenseNumber" placeholder="LIC-12345678">
                    </div>
                </div>

                <div class="field-row">
                    <div class="field">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required minlength="6" placeholder="••••••••">
                    </div>
                    <div class="field">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="••••••••">
                    </div>
                </div>

                <div class="security-note">
                    <svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
                        <path d="M8 1L2 3.5V8c0 3.31 2.58 5.97 6 6.93C11.42 13.97 14 11.31 14 8V3.5L8 1zm-.5 9.5l-2-2 .7-.7 1.3 1.3 2.8-2.8.7.7-3.5 3.5z"/>
                    </svg>
                    Your data is encrypted and protected under healthcare privacy standards.
                </div>

                <button type="submit" class="btn-submit">Complete Registration</button>
            </form>

            <p class="signin-link">Already have an account? <a href="login">Sign in here</a></p>
        </div>
    </main>
</div>

<script>
    function selectRole(role) {
        document.getElementById('role').value = role;

        document.getElementById('btn-patient').classList.toggle('active', role === 'PATIENT');
        document.getElementById('btn-counsellor').classList.toggle('active', role === 'COUNSELLOR');

        var proSection = document.getElementById('proSection');
        var isCounsellor = role === 'COUNSELLOR';
        proSection.classList.toggle('visible', isCounsellor);

        ['specialization', 'licenseNumber', 'experienceYears'].forEach(function(id) {
            var el = document.getElementById(id);
            if (isCounsellor) {
                el.setAttribute('required', 'required');
            } else {
                el.removeAttribute('required');
                el.value = '';
            }
        });
    }

    function validateForm() {
        var pw  = document.getElementById('password').value;
        var cpw = document.getElementById('confirmPassword').value;
        if (pw !== cpw) {
            alert('Passwords do not match. Please try again.');
            document.getElementById('confirmPassword').focus();
            return false;
        }
        return true;
    }
</script>

</body>
</html>
