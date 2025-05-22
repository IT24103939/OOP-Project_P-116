<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PrimeHomes | Find Your Dream Property</title>
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            color: #333;
            line-height: 1.6;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .btn {
            display: inline-block;
            background: #e74c3c;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            text-decoration: none;
            transition: background 0.3s;
        }

        .btn:hover {
            background: #c0392b;
        }

        /* Header Styles */
        header {
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
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
        }

        nav ul li a:hover {
            color: #e74c3c;
        }

        .auth-buttons button {
            padding: 8px 20px;
            margin-left: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
        }

        .login {
            background: transparent;
            color: #2c3e50;
        }

        .register {
            background: #e74c3c;
            color: white;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://images.unsplash.com/photo-1560518883-ce09059eeffa');
            background-size: cover;
            background-position: center;
            height: 70vh;
            display: flex;
            align-items: center;
            color: white;
            text-align: center;
        }

        .hero-content {
            max-width: 800px;
            margin: 0 auto;
        }

        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 18px;
            margin-bottom: 30px;
        }

        /* Featured Properties */
        .featured {
            padding: 80px 0;
        }

        .section-title {
            text-align: center;
            margin-bottom: 50px;
        }

        .section-title h2 {
            font-size: 36px;
            color: #2c3e50;
            margin-bottom: 15px;
        }

        .section-title p {
            color: #7f8c8d;
            max-width: 700px;
            margin: 0 auto;
        }

        .properties-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 30px;
        }

        .property-card {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }

        .property-card:hover {
            transform: translateY(-5px);
        }

        .property-img {
            height: 250px;
            overflow: hidden;
        }

        .property-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }

        .property-card:hover .property-img img {
            transform: scale(1.05);
        }

        .property-info {
            padding: 20px;
        }

        .price {
            font-size: 22px;
            font-weight: 700;
            color: #e74c3c;
            margin-bottom: 10px;
        }

        .address {
            color: #7f8c8d;
            margin-bottom: 15px;
        }

        .features {
            display: flex;
            justify-content: space-between;
            border-top: 1px solid #eee;
            padding-top: 15px;
            margin-top: 15px;
        }

        .feature {
            text-align: center;
        }

        .feature span {
            display: block;
            color: #7f8c8d;
            font-size: 14px;
        }

        .feature i {
            color: #e74c3c;
            margin-bottom: 5px;
        }

        /* Services Section */
        .services {
            background: #f9f9f9;
            padding: 80px 0;
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .service-card {
            text-align: center;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        }

        .service-icon {
            font-size: 50px;
            color: #e74c3c;
            margin-bottom: 20px;
        }

        .service-card h3 {
            margin-bottom: 15px;
            color: #2c3e50;
        }

        /* Testimonials */
        .testimonials {
            padding: 80px 0;
        }

        .testimonial-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .testimonial-card {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        }

        .testimonial-text {
            font-style: italic;
            margin-bottom: 20px;
        }

        .client-info {
            display: flex;
            align-items: center;
        }

        .client-img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            overflow: hidden;
            margin-right: 15px;
        }

        .client-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .client-name {
            font-weight: 600;
            color: #2c3e50;
        }

        /* Call to Action */
        .cta {
            background: #2c3e50;
            color: white;
            padding: 80px 0;
            text-align: center;
        }

        .cta h2 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .cta p {
            max-width: 700px;
            margin: 0 auto 30px;
            color: #ecf0f1;
        }
    </style>
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <div class="hero-content">
                <h1>Find Your Dream Home Today</h1>
                <p>Discover the perfect property that matches your lifestyle and budget with our expert real estate agents.</p>
                <a href="#contact" class="btn">Book Your Appointment</a>
            </div>
        </div>
    </section>

    <!-- Featured Properties -->
    <section class="featured">
        <div class="container">
            <div class="section-title">
                <h2>Featured Properties</h2>
                <p>Explore our handpicked selection of premium properties in top locations</p>
            </div>

            <div class="properties-grid">
                <!-- Property 1 -->
                <div class="property-card">
                    <div class="property-img">
                        <img src="https://images.unsplash.com/photo-1564013799919-ab600027ffc6" alt="Modern House">
                    </div>
                    <div class="property-info">
                        <div class="price">$450,000</div>
                        <h3>Modern Family Home</h3>
                        <div class="address">123 Park Avenue, Greenville</div>
                        <div class="features">
                            <div class="feature">
                                <i>🛏️</i>
                                <span>4 Beds</span>
                            </div>
                            <div class="feature">
                                <i>🚿</i>
                                <span>3 Baths</span>
                            </div>
                            <div class="feature">
                                <i>📐</i>
                                <span>2,100 sqft</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Property 2 -->
                <div class="property-card">
                    <div class="property-img">
                        <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c" alt="Luxury Apartment">
                    </div>
                    <div class="property-info">
                        <div class="price">$320,000</div>
                        <h3>Luxury Downtown Apartment</h3>
                        <div class="address">456 Central Blvd, Metropolis</div>
                        <div class="features">
                            <div class="feature">
                                <i>🛏️</i>
                                <span>2 Beds</span>
                            </div>
                            <div class="feature">
                                <i>🚿</i>
                                <span>2 Baths</span>
                            </div>
                            <div class="feature">
                                <i>📐</i>
                                <span>1,500 sqft</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Property 3 -->
                <div class="property-card">
                    <div class="property-img">
                        <img src="https://images.unsplash.com/photo-1605276374104-dee2a0ed3cd6" alt="Suburban Home">
                    </div>
                    <div class="property-info">
                        <div class="price">$375,000</div>
                        <h3>Charming Suburban Home</h3>
                        <div class="address">789 Oak Street, Springfield</div>
                        <div class="features">
                            <div class="feature">
                                <i>🛏️</i>
                                <span>3 Beds</span>
                            </div>
                            <div class="feature">
                                <i>🚿</i>
                                <span>2.5 Baths</span>
                            </div>
                            <div class="feature">
                                <i>📐</i>
                                <span>1,800 sqft</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section class="services">
        <div class="container">
            <div class="section-title">
                <h2>Our Services</h2>
                <p>Comprehensive real estate services to meet all your property needs</p>
            </div>

            <div class="services-grid">
                <div class="service-card">
                    <div class="service-icon">🏠</div>
                    <h3>Property Sales</h3>
                    <p>Expert assistance in buying or selling residential and commercial properties at the best market prices.</p>
                </div>

                <div class="service-card">
                    <div class="service-icon">🔑</div>
                    <h3>Property Rental</h3>
                    <p>Find your perfect rental home or commercial space with our extensive listings and expert agents.</p>
                </div>

                <div class="service-card">
                    <div class="service-icon">💰</div>
                    <h3>Property Valuation</h3>
                    <p>Accurate market valuations to help you make informed decisions about your property investments.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials -->
    <section class="testimonials">
        <div class="container">
            <div class="section-title">
                <h2>What Our Clients Say</h2>
                <p>Hear from our satisfied customers about their experiences with PrimeHomes</p>
            </div>

            <div class="testimonial-grid">
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "PrimeHomes made the entire home buying process seamless. Their agent was knowledgeable and helped us find our dream home within our budget."
                    </div>
                    <div class="client-info">
                        <div class="client-img">
                            <img src="https://randomuser.me/api/portraits/women/45.jpg" alt="Sarah Johnson">
                        </div>
                        <div>
                            <div class="client-name">Sarah Johnson</div>
                            <div>Home Buyer</div>
                        </div>
                    </div>
                </div>

                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "I was able to sell my property for 15% above market value thanks to the excellent marketing strategy of PrimeHomes. Highly recommended!"
                    </div>
                    <div class="client-info">
                        <div class="client-img">
                            <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Michael Chen">
                        </div>
                        <div>
                            <div class="client-name">Michael Chen</div>
                            <div>Property Seller</div>
                        </div>
                    </div>
                </div>

                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "As a first-time renter, I was nervous about the process. The team at PrimeHomes guided me through every step and found me the perfect apartment."
                    </div>
                    <div class="client-info">
                        <div class="client-img">
                            <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="Emily Rodriguez">
                        </div>
                        <div>
                            <div class="client-name">Emily Rodriguez</div>
                            <div>Apartment Renter</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action -->
    <section class="cta" id="contact">
        <div class="container">
            <h2>Ready to Find Your Dream Home?</h2>
            <p>Schedule a consultation with one of our expert agents to begin your property journey today.</p>
            <a href="appointmentform.jsp" class="btn">Book Your Appointment</a>
        </div>
    </section>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />
</body>
</html>