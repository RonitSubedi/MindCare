<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MindCare - Mental Health Appointment & Monitoring</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .hero {
            background: linear-gradient(135deg, rgba(79, 70, 229, 0.9) 0%, rgba(16, 185, 129, 0.9) 100%), url('https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 8rem 2rem;
            text-align: center;
            border-bottom-left-radius: 50% 10%;
            border-bottom-right-radius: 50% 10%;
        }
        .hero h1 {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1rem;
        }
        .hero p {
            font-size: 1.25rem;
            max-width: 600px;
            margin: 0 auto 2rem auto;
            opacity: 0.9;
        }
        .hero-btns {
            display: flex;
            gap: 1rem;
            justify-content: center;
        }
        .hero-btns .btn {
            width: auto;
            min-width: 150px;
        }
        .features {
            padding: 5rem 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }
        .features-header {
            text-align: center;
            margin-bottom: 3rem;
        }
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }
        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: var(--shadow-md);
            text-align: center;
            transition: transform 0.3s;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
        .feature-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        .nav-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.5rem 3rem;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            position: absolute;
            top: 0; left: 0; right: 0;
            z-index: 10;
        }
        .nav-brand {
            font-size: 1.5rem;
            font-weight: 700;
            color: white;
            text-decoration: none;
        }
        .nav-links a {
            color: white;
            margin-left: 2rem;
            font-weight: 500;
        }
    </style>
</head>
<body>

    <nav class="nav-bar">
        <a href="#" class="nav-brand">MindCare</a>
        <div class="nav-links">
            <a href="login">Login</a>
            <a href="register">Register</a>
        </div>
    </nav>

    <header class="hero">
        <h1>Prioritize Your Mental Health</h1>
        <p>Connect with licensed professionals, track your daily mood, and access a rich library of resources right from your fingertips.</p>
        <div class="hero-btns">
            <a href="register" class="btn" style="background: white; color: var(--primary);">Get Started</a>
            <a href="login" class="btn" style="background: transparent; border: 2px solid white; color: white;">Sign In</a>
        </div>
    </header>

    <section class="features">
        <div class="features-header">
            <h2 style="font-size: 2.25rem; color: var(--primary);">Why MindCare?</h2>
            <p style="color: var(--text-muted); margin-top: 0.5rem;">Empowering your journey to well-being.</p>
        </div>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">👩‍⚕️</div>
                <h3>Licensed Counsellors</h3>
                <p>Find and book appointments with certified professionals in transparent, real-time availability.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">📈</div>
                <h3>Mood Monitoring</h3>
                <p>Log your daily emotional states and visualize trends to build long-term self-awareness.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">📚</div>
                <h3>Curated Library</h3>
                <p>Access self-help materials and mental health articles tailored to your needs.</p>
            </div>
        </div>
    </section>

</body>
</html>
