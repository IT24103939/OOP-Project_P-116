<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PrimeHomes Footer</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        footer {
            background: #1a252f;
            color: #ecf0f1;
            padding: 60px 0 20px;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }

        .footer-col h3 {
            font-size: 18px;
            margin-bottom: 20px;
            color: white;
        }

        .footer-col ul {
            list-style: none;
        }

        .footer-col ul li {
            margin-bottom: 10px;
        }

        .footer-col ul li a {
            color: #bdc3c7;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-col ul li a:hover {
            color: #e74c3c;
        }

        .footer-col p {
            color: #bdc3c7;
            margin-bottom: 20px;
        }

        .social-links {
            display: flex;
            gap: 15px;
        }

        .social-links a {
            color: white;
            background: #2c3e50;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: background 0.3s;
        }

        .social-links a:hover {
            background: #e74c3c;
        }

        .copyright {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid #2c3e50;
            color: #bdc3c7;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <footer>
        <div class="container">
            <div class="footer-grid">
                <div class="footer-col">
                    <h3>PrimeHomes</h3>
                    <p>Your trusted partner in real estate for over 15 years. We're committed to helping you find the perfect property.</p>
                    <div class="social-links">
                        <a href="#"><i>📱</i></a>
                        <a href="#"><i>📘</i></a>
                        <a href="#"><i>📸</i></a>
                        <a href="#"><i>💼</i></a>
                    </div>
                </div>

                <div class="footer-col">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="about.jsp">About Us</a></li>
                        <li><a href="properties.jsp">Properties</a></li>
                        <li><a href="agents.jsp">Agents</a></li>
                        <li><a href="blog.jsp">Blog</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                    </ul>
                </div>

                <div class="footer-col">
                    <h3>Services</h3>
                    <ul>
                        <li><a href="buy.jsp">Buy Property</a></li>
                        <li><a href="sell.jsp">Sell Property</a></li>
                        <li><a href="rent.jsp">Rent Property</a></li>
                        <li><a href="management.jsp">Property Management</a></li>
                        <li><a href="valuation.jsp">Valuation</a></li>
                        <li><a href="investment.jsp">Investment Advice</a></li>
                    </ul>
                </div>

                <div class="footer-col">
                    <h3>Contact Us</h3>
                    <ul>
                        <li>123 Real Estate Avenue</li>
                        <li>New York, NY 10001</li>
                        <li>Phone: (555) 123-4567</li>
                        <li>Email: info@primehomes.com</li>
                        <li>Hours: Mon-Fri 9am-6pm</li>
                    </ul>
                </div>
            </div>

            <div class="copyright">
                &copy; <%= java.time.Year.now().getValue() %> PrimeHomes Real Estate. All rights reserved.
            </div>
        </div>
    </footer>
</body>
</html>