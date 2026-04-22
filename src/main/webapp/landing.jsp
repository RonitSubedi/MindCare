<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ManaSewa</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,700;1,700&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

        :root {
            --navy:   #0f2351;
            --indigo: #4f46e5;
            --light-indigo: #eef0fd;
            --green:  #22c55e;
            --light-green: #dcfce7;
            --text:   #1f2937;
            --muted:  #6b7280;
            --border: #e5e7eb;
            --bg:     #f8fafc;
            --white:  #ffffff;
        }

        body { font-family: 'Inter', sans-serif; background: var(--bg); color: var(--text); }
        a { text-decoration: none; color: inherit; }

        /* ── NAVBAR ── */
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 18px 64px; background: var(--white); border-bottom: 1px solid var(--border); position: sticky; top: 0; z-index: 100; }
        .logo { font-weight: 700; font-size: 1.15rem; color: var(--navy); letter-spacing: -0.02em; }
        .nav-links { display: flex; align-items: center; gap: 32px; }
        .nav-links a { font-size: 0.875rem; color: var(--muted); font-weight: 500; transition: color 0.2s; }
        .nav-links a:hover { color: var(--navy); }
        .nav-links .btn-login { background: var(--navy); color: white; padding: 8px 20px; border-radius: 8px; font-size: 0.875rem; font-weight: 600; transition: background 0.2s; }
        .nav-links .btn-login:hover { background: #1a3a7a; color: white; }

        /* ── HERO ── */
        .hero { display: flex; align-items: center; justify-content: space-between; padding: 80px 64px; gap: 48px; background: var(--white); }
        .hero-left { flex: 1; max-width: 520px; }
        .hero-left h1 { font-family: 'Playfair Display', serif; font-size: 3rem; line-height: 1.15; color: var(--navy); margin-bottom: 20px; }
        .hero-left p { font-size: 1rem; color: var(--muted); line-height: 1.7; margin-bottom: 32px; max-width: 420px; }
        .hero-btns { display: flex; gap: 12px; align-items: center; }
        .btn-primary { background: var(--navy); color: white; padding: 12px 26px; border-radius: 8px; font-size: 0.9rem; font-weight: 600; border: none; cursor: pointer; transition: background 0.2s; display: inline-block; }
        .btn-primary:hover { background: #1a3a7a; color: white; }
        .btn-outline { background: transparent; color: var(--navy); padding: 12px 26px; border-radius: 8px; font-size: 0.9rem; font-weight: 600; border: 1.5px solid var(--navy); cursor: pointer; transition: all 0.2s; display: inline-block; }
        .btn-outline:hover { background: var(--navy); color: white; }
        .hero-right { flex: 1; max-width: 480px; position: relative; }
        .hero-right img { width: 100%; border-radius: 16px; object-fit: cover; display: block; max-height: 420px; }
        .hero-float-card { position: absolute; bottom: 24px; left: -24px; background: white; border-radius: 12px; padding: 14px 18px; box-shadow: 0 8px 32px rgba(0,0,0,0.12); display: flex; align-items: center; gap: 10px; min-width: 200px; }
        .float-avatar { width: 40px; height: 40px; border-radius: 50%; background: var(--light-indigo); display: flex; align-items: center; justify-content: center; font-size: 1.1rem; flex-shrink: 0; }
        .float-info .float-name { font-size: 0.82rem; font-weight: 600; color: var(--text); }
        .float-info .float-role { font-size: 0.72rem; color: var(--muted); margin-top: 1px; }

        /* ── BRIDGING SECTION ── */
        .bridge-section { text-align: center; padding: 72px 64px 48px; background: var(--bg); }
        .bridge-section .label { font-size: 0.72rem; font-weight: 700; letter-spacing: 0.12em; text-transform: uppercase; color: var(--indigo); margin-bottom: 14px; }
        .bridge-section h2 { font-family: 'Playfair Display', serif; font-size: 1.9rem; color: var(--navy); margin-bottom: 16px; line-height: 1.3; }
        .bridge-section p { font-size: 0.9rem; color: var(--muted); max-width: 560px; margin: 0 auto; line-height: 1.7; }

        /* ── STATS ROW ── */
        .stats-row { display: flex; justify-content: center; gap: 64px; padding: 40px 64px; background: var(--bg); }
        .stat-item { text-align: center; }
        .stat-num { font-size: 2rem; font-weight: 700; color: var(--navy); line-height: 1; }
        .stat-label { font-size: 0.8rem; color: var(--muted); margin-top: 4px; }

        /* ── FEATURE CARDS ── */
        .features-section { padding: 16px 64px 72px; background: var(--bg); }
        .features-label { font-size: 0.72rem; font-weight: 700; letter-spacing: 0.12em; text-transform: uppercase; color: var(--indigo); margin-bottom: 20px; }
        .features-grid { display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 20px; }
        .feat-card { background: var(--white); border-radius: 14px; padding: 28px; border: 1px solid var(--border); box-shadow: 0 2px 8px rgba(0,0,0,0.04); }
        .feat-card.highlight { background: var(--indigo); color: white; border-color: var(--indigo); }
        .feat-icon { width: 40px; height: 40px; border-radius: 10px; display: flex; align-items: center; justify-content: center; margin-bottom: 16px; font-size: 1.1rem; }
        .feat-card:not(.highlight) .feat-icon { background: var(--light-indigo); }
        .feat-card.highlight .feat-icon { background: rgba(255,255,255,0.15); }
        .feat-card h3 { font-size: 1rem; font-weight: 600; margin-bottom: 8px; }
        .feat-card p { font-size: 0.82rem; line-height: 1.6; color: var(--muted); }
        .feat-card.highlight p { color: rgba(255,255,255,0.75); }
        .feat-card .feat-count { font-size: 2rem; font-weight: 700; color: var(--navy); margin-bottom: 6px; }
        .feat-card .feat-sub { font-size: 0.75rem; color: var(--muted); margin-bottom: 12px; }

        /* ── TWO COL ── */
        .two-col-section { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; padding: 0 64px 72px; background: var(--bg); }
        .two-card { background: var(--white); border-radius: 14px; padding: 28px; border: 1px solid var(--border); }
        .two-card .tc-icon { width: 44px; height: 44px; border-radius: 12px; display: flex; align-items: center; justify-content: center; margin-bottom: 16px; font-size: 1.2rem; }
        .tc-icon-green { background: var(--light-green); }
        .tc-icon-indigo { background: var(--light-indigo); }
        .two-card h3 { font-size: 1rem; font-weight: 600; margin-bottom: 8px; color: var(--text); }
        .two-card p { font-size: 0.82rem; color: var(--muted); line-height: 1.6; }

        /* ── TESTIMONIALS ── */
        .testimonials-section { padding: 72px 64px; background: var(--white); }
        .testimonials-section .label { font-size: 0.72rem; font-weight: 700; letter-spacing: 0.12em; text-transform: uppercase; color: var(--indigo); margin-bottom: 12px; }
        .testimonials-section h2 { font-family: 'Playfair Display', serif; font-size: 1.7rem; color: var(--navy); margin-bottom: 32px; }
        .testimonial-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .t-card { background: var(--bg); border-radius: 14px; padding: 28px; border: 1px solid var(--border); }
        .stars { color: #f59e0b; font-size: 0.85rem; margin-bottom: 14px; letter-spacing: 2px; }
        .t-card blockquote { font-size: 0.88rem; color: var(--text); line-height: 1.7; margin-bottom: 18px; font-style: italic; }
        .t-author { display: flex; align-items: center; gap: 10px; }
        .t-avatar { width: 36px; height: 36px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 0.8rem; font-weight: 700; color: white; flex-shrink: 0; }
        .t-name { font-size: 0.82rem; font-weight: 600; color: var(--text); }
        .t-role { font-size: 0.72rem; color: var(--muted); }

        /* ── CTA ── */
        .cta-section { background: var(--navy); padding: 80px 64px; text-align: center; }
        .cta-section .label { font-size: 0.72rem; font-weight: 700; letter-spacing: 0.12em; text-transform: uppercase; color: rgba(255,255,255,0.5); margin-bottom: 14px; }
        .cta-section h2 { font-family: 'Playfair Display', serif; font-size: 2rem; color: white; margin-bottom: 14px; }
        .cta-section p { font-size: 0.9rem; color: rgba(255,255,255,0.65); margin-bottom: 32px; }
        .btn-white { background: white; color: var(--navy); padding: 13px 30px; border-radius: 8px; font-size: 0.9rem; font-weight: 700; border: none; cursor: pointer; display: inline-block; transition: opacity 0.2s; }
        .btn-white:hover { opacity: 0.92; color: var(--navy); }

        /* ── FOOTER ── */
        .footer { background: #0f172a; color: white; padding: 56px 64px 36px; }
        .footer-grid { display: grid; grid-template-columns: 2fr 1fr 1fr 1fr 1fr; gap: 40px; margin-bottom: 48px; }
        .footer-brand .footer-logo { font-size: 1.1rem; font-weight: 700; margin-bottom: 10px; }
        .footer-brand p { font-size: 0.8rem; color: #9ca3af; line-height: 1.6; max-width: 220px; }
        .footer-col h4 { font-size: 0.8rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.08em; color: #9ca3af; margin-bottom: 14px; }
        .footer-col a { display: block; font-size: 0.82rem; color: #d1d5db; margin-bottom: 8px; transition: color 0.2s; }
        .footer-col a:hover { color: white; }
        .footer-bottom { border-top: 1px solid rgba(255,255,255,0.08); padding-top: 24px; font-size: 0.78rem; color: #6b7280; }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar">
    <div class="logo">ManaSewa</div>
    <div class="nav-links">
        <a href="#">Features</a>
        <a href="#">Resources</a>
        <a href="#">About</a>
        <a href="login" class="btn-login">Login</a>
    </div>
</nav>

<!-- HERO -->
<section class="hero">
    <div class="hero-left">
        <h1>Your Mental Well-being, Our Priority</h1>
        <p>Empowering individuals with accessible mental health support, connect with certified counsellors, and build a healthier mind every day.</p>
        <div class="hero-btns">
            <a href="register" class="btn-primary">Get Started</a>
            <a href="login" class="btn-outline">Login</a>
        </div>
    </div>
    <div class="hero-right">
        <img src="image/mental.png" alt="Mental Health">
        <div class="hero-float-card">
            <div class="float-avatar">👩‍⚕️</div>
            <div class="float-info">
                <div class="float-name">Dr. Sita Nepali </div>
                <div class="float-role">Clinical Psychologist</div>
            </div>
        </div>
    </div>
</section>

<!-- BRIDGING SECTION -->
<section class="bridge-section">
    <div class="label">Our Mission</div>
    <h2>Bridging the gap between clinical<br>excellence and compassionate care</h2>
    <p>At MindCare, we believe the best outcomes are built on balance. A modern, user-centric platform designed to support individuals, connect with professionals, and help you reclaim your wellbeing.</p>
</section>

<!-- STATS — live from database via LandingServlet -->
<div class="stats-row">
    <div class="stat-item">
        <div class="stat-num">${counsellorCount}</div>
        <div class="stat-label">Professional Counsellors</div>
    </div>
    <div class="stat-item">
        <div class="stat-num">${patientCount}+</div>
        <div class="stat-label">Patients Supported</div>
    </div>
</div>

<!-- FEATURE CARDS -->
<section class="features-section">
    <div class="features-label">Recognised for Clarity</div>
    <div class="features-grid">

        <div class="feat-card">
            <div class="feat-count">${counsellorCount}</div>
            <div class="feat-sub">Professional Counsellors</div>
            <div class="feat-icon">👥</div>
            <h3>Professional Counselling</h3>
            <p>Connect with certified experts for personalized, evidence-based mental health guidance tailored to your needs.</p>
        </div>

        <div class="feat-card highlight">
            <div class="feat-icon">📊</div>
            <h3>Mood Tracking</h3>
            <p>Monitor your emotional patterns, log daily moods, and improve your overall wellbeing with intelligent insights.</p>
        </div>

        <div class="feat-card">
            <div class="feat-icon">📚</div>
            <h3>Resource Library</h3>
            <p>Explore curated articles, guided audio, and self-help tools crafted by mental health professionals.</p>
        </div>

    </div>
</section>

<!-- RESOURCE & PROVIDER CARDS -->
<section class="two-col-section">
    <div class="two-card">
        <div class="tc-icon tc-icon-green">🔒</div>
        <h3>Resource Library</h3>
        <p>Access a rich collection of mental wellness resources — articles, breathing exercises, guided meditations, and more — available anytime.</p>
    </div>
    <div class="two-card">
        <div class="tc-icon tc-icon-indigo">🤝</div>
        <h3>Secure & Private</h3>
        <p>Your data is encrypted and protected under healthcare privacy standards. Your journey stays completely confidential.</p>
    </div>
</section>

<!-- TESTIMONIALS -->
<section class="testimonials-section">
    <div class="label">Real Stories</div>
    <h2>Shared Journeys</h2>
    <div class="testimonial-grid">
        <div class="t-card">
            <div class="stars">★★★★★</div>
            <blockquote>"I had always struggled with anxiety in social settings. Thanks to MindCare, I found a trusted counsellor and finally began to heal. The mood tracker kept me honest with myself."</blockquote>
            <div class="t-author">
                <div class="t-avatar" style="background:#4f46e5;">A</div>
                <div>
                    <div class="t-name">Alex M.</div>
                    <div class="t-role">Patient · 6 months</div>
                </div>
            </div>
        </div>
        <div class="t-card">
            <div class="stars">★★★★★</div>
            <blockquote>"The resources here are a game changer. I felt a profound sense of peace learning to reframe my thoughts. The counsellors here genuinely care."</blockquote>
            <div class="t-author">
                <div class="t-avatar" style="background:#22c55e;">S</div>
                <div>
                    <div class="t-name">Sarah K.</div>
                    <div class="t-role">Patient · 3 months</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA -->
<section class="cta-section">
    <div class="label">Get Started Today</div>
    <h2>Ready to start your journey?</h2>
    <p>Take the first step towards better mental health. It only takes a minute to create your free account.</p>
    <a href="register" class="btn-white">Start Your Free Trial</a>
</section>

<!-- FOOTER -->
<footer class="footer">
    <div class="footer-grid">
        <div class="footer-brand">
            <div class="footer-logo">ManaSewa</div>
            <p>Helping you achieve balance, clarity, and a healthier mind every day.</p>
        </div>
        <div class="footer-col">
            <h4>Product</h4>
            <a href="#">Features</a>
            <a href="#">Pricing</a>
            <a href="#">Resources</a>
            <a href="#">Updates</a>
        </div>
        <div class="footer-col">
            <h4>Company</h4>
            <a href="#">About</a>
            <a href="#">Blog</a>
            <a href="#">Careers</a>
            <a href="#">Press</a>
        </div>
        <div class="footer-col">
            <h4>Support</h4>
            <a href="#">Help Center</a>
            <a href="#">Contact</a>
            <a href="#">Crisis Support</a>
            <a href="#">Community</a>
        </div>
        <div class="footer-col">
            <h4>Legal</h4>
            <a href="#">Privacy</a>
            <a href="#">Terms</a>
            <a href="#">Cookies</a>
            <a href="#">Licenses</a>
        </div>
    </div>
    <div class="footer-bottom">© 2026 MindCare Behavioral Health Services. All rights reserved.</div>
</footer>

</body>
</html>
