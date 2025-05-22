<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PrimeHomes Header</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        header {
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .logo {
            font-size: 28px;
            font-weight: 700;
            color: #2c3e50;
        }

        .logo span {
            color: #e74c3c;
        }

        nav ul {
            display: flex;
            list-style: none;
        }

        nav ul li {
            margin-left: 30px;
        }

        nav ul li a {
            text-decoration: none;
            color: #2c3e50;
            font-weight: 500;
            transition: color 0.3s;
            position: relative;
            padding-bottom: 5px;
        }

        nav ul li a:hover {
            color: #e74c3c;
        }

        nav ul li a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: #e74c3c;
            transition: width 0.3s;
        }

        nav ul li a:hover::after {
            width: 100%;
        }

        .user-section {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .auth-buttons {
            display: flex;
            gap: 10px;
        }

        .auth-buttons button {
            padding: 8px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
        }

        .login {
            background: transparent;
            color: #2c3e50;
            border: 1px solid #2c3e50;
        }

        .login:hover {
            background: #f5f5f5;
        }

        .register {
            background: #e74c3c;
            color: white;
        }

        .register:hover {
            background: #c0392b;
        }

        .profile-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #f1f1f1;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            color: #2c3e50;
            border: 1px solid #ddd;
        }

        .profile-icon:hover {
            background-color: #e74c3c;
            color: white;
            transform: scale(1.05);
        }

        .profile-icon svg {
            width: 20px;
            height: 20px;
        }

        .welcome-message {
            font-weight: 500;
            color: #2c3e50;
        }

        .logout-link {
            color: #2c3e50;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
            padding: 8px 0;
        }

        .logout-link:hover {
            color: #e74c3c;
        }

        @media (max-width: 992px) {
            .header-container {
                flex-direction: column;
                padding: 15px;
            }

            nav ul {
                margin: 15px 0;
            }

            nav ul li {
                margin: 0 15px;
            }

            .user-section {
                margin-top: 10px;
            }
        }

        @media (max-width: 576px) {
            nav ul {
                flex-wrap: wrap;
                justify-content: center;
            }

            nav ul li {
                margin: 5px 10px;
            }

            .logo {
                font-size: 24px;
            }

            .auth-buttons {
                flex-direction: column;
                width: 100%;
            }

            .auth-buttons button {
                width: 100%;
                margin: 5px 0;
            }

            .user-section {
                flex-direction: column;
                align-items: center;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <div class="logo">Prime<span>Homes</span></div>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="buy.jsp">Buy</a></li>
                    <li><a href="rent.jsp">Rent</a></li>
                    <li><a href="sell.jsp">Sell</a></li>
                    <li><a href="agents.jsp">Agents</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </nav>
            <div class="user-section">
                <%
                HttpSession userSession = request.getSession(false);
                if (userSession != null && userSession.getAttribute("loggedIn") != null) {
                    String username = (String) userSession.getAttribute("username");
                %>
                    <span class="welcome-message">Welcome, <%= username != null ? username : "User" %></span>
                    <a href="./view_appointments" class="profile-icon" title="Dashboard">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                        </svg>
                    </a>
                    <a href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit();" class="logout-link">Logout</a>
                    <form id="logout-form" action="logout" method="post" style="display: none;"></form>
                <% } else { %>
                    <div class="auth-buttons">
                        <button class="login" onclick="window.location.href='login.jsp'">Login</button>
                        <button class="register" onclick="window.location.href='register.jsp'">Register</button>
                    </div>
                <% } %>
            </div>
        </div>
    </header>
</body>
</html>