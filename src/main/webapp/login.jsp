<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ManaSewa Login</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #dbeafe, #e2e8f0);
        }

        .container {
            text-align: center;
        }

        .logo {
            width: 45px;
            height: 45px;
            background: #1e3a8a;
            border-radius: 12px;
            margin: 0 auto 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }

        h1 {
            color: #1e3a8a;
            margin-bottom: 5px;
        }

        .subtitle {
            color: #6b7280;
            margin-bottom: 25px;
            font-size: 14px;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            width: 360px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            text-align: left;
        }

        .section-title {
            font-size: 12px;
            color: #6b7280;
            margin-bottom: 10px;
            text-transform: uppercase;
        }

        /* ROLE BUTTONS */
        .roles {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .role {
            flex: 1;
            padding: 10px;
            margin: 0 5px;
            text-align: center;
            border-radius: 8px;
            cursor: pointer;
            border: 1px solid #ddd;
            font-size: 13px;
            color: #374151;
        }

        .role.active {
            background: #1e3a8a;
            color: white;
            border: none;
        }

        label {
            font-size: 13px;
            color: #374151;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ddd;
        }

        .password-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .forgot {
            font-size: 12px;
            color: #1e3a8a;
            text-decoration: none;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: #1e3a8a;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            margin-top: 10px;
        }

        .bottom-text {
            text-align: center;
            margin-top: 15px;
            font-size: 13px;
        }

        .bottom-text a {
            color: #1e3a8a;
            text-decoration: none;
        }

        .footer {
            margin-top: 20px;
            font-size: 11px;
            color: #9ca3af;
            text-align: center;
        }

    </style>

    <script>
        function selectRole(element, roleValue) {
            let roles = document.querySelectorAll(".role");
            roles.forEach(r => r.classList.remove("active"));

            element.classList.add("active");
            document.getElementById("role").value = roleValue;
        }
    </script>

</head>

<body>

<div class="container">

    <div class="logo">🧠</div>

    <h1>ManaSewa</h1>
    <p class="subtitle">Welcome back to your space of serenity.</p>

    <div class="card">

        <div class="section-title">Identity Access</div>

        <!-- ROLE SELECT -->
        <div class="roles">
            <div class="role" onclick="selectRole(this,'patient')">Patient</div>
            <div class="role active" onclick="selectRole(this,'counsellor')">Counsellor</div>
            <div class="role" onclick="selectRole(this,'admin')">Admin</div>
        </div>

        <form action="login" method="post">

            <input type="hidden" name="role" id="role" value="counsellor">

            <label>Email Address</label>
            <input type="email" name="email" placeholder="name@example.com" required>

            <div class="password-row">
                <label>Password</label>
                <a href="#" class="forgot">Forgot Password?</a>
            </div>

            <input type="password" name="password" placeholder="••••••••" required>

            <button type="submit" class="btn">Secure Access →</button>

        </form>

        <div class="bottom-text">
            Don’t have an account? <a href="register.jsp">Register</a>
        </div>

    </div>

    <div class="footer">
        PRIVACY POLICY • TERMS OF SERVICE • SUPPORT
    </div>

</div>

</body>
</html>