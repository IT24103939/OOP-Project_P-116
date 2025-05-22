<%@ page import="appointment.Appointment" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Property Consultations | PrimeHomes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #2563eb;
            --primary-light: #3b82f6;
            --secondary: #1e40af;
            --accent: #60a5fa;
            --success: #10b981;
            --warning: #f59e0b;
            --danger: #ef4444;
            --light: #f8fafc;
            --dark: #1e293b;
            --gray-100: #f1f5f9;
            --gray-200: #e2e8f0;
            --gray-300: #cbd5e1;
            --gray-500: #64748b;
            --gray-700: #334155;
            --text: #0f172a;
            --border-radius: 0.75rem;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --transition: all 0.15s cubic-bezier(0.4, 0, 0.2, 1);
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: var(--gray-100);
            color: var(--text);
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
            margin: 0;
            padding: 0;
        }

        .consultation-wrapper {
            max-width: 96rem;
            margin: 2rem auto;
            padding: 0 1.5rem;
        }

        .consultation-header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .consultation-header {
            color: var(--dark);
            font-size: 1.75rem;
            font-weight: 700;
            margin: 0;
            position: relative;
        }

        .empty-consultations {
            text-align: center;
            padding: 2rem;
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-sm);
            color: var(--gray-500);
            max-width: 40rem;
            margin: 0 auto;
        }

        .empty-consultations p {
            font-size: 1.125rem;
            margin: 0;
        }

        .consultation-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(28rem, 1fr));
            gap: 1.5rem;
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .consultation-card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-md);
            overflow: hidden;
            transition: var(--transition);
            border: 1px solid var(--gray-200);
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .consultation-card:hover {
            transform: translateY(-0.125rem);
            box-shadow: var(--shadow-lg);
        }

        .consultation-client {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            padding: 1rem 1.5rem;
            margin: 0;
            font-size: 1.125rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .consultation-content {
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .consultation-details {
            padding: 1.25rem 1.5rem;
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 1rem 1.5rem;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
            min-width: 0;
        }

        .detail-label {
            font-size: 0.75rem;
            color: var(--gray-500);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            font-weight: 600;
            margin-bottom: 0.25rem;
            white-space: nowrap;
        }

        .detail-value {
            font-weight: 500;
            color: var(--gray-700);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.9375rem;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .detail-value i {
            color: var(--primary);
            width: 1rem;
            text-align: center;
            flex-shrink: 0;
        }

        .consultation-notes {
            padding: 0 1.5rem 1.25rem;
            font-size: 0.875rem;
            color: var(--gray-700);
            line-height: 1.5;
            margin-top: -0.5rem;
        }

        .consultation-notes strong {
            color: var(--dark);
            font-weight: 600;
        }

        .consultation-footer {
            margin-top: auto;
        }

        .consultation-actions {
            display: flex;
            border-top: 1px solid var(--gray-200);
            padding: 0.75rem 1.5rem;
            gap: 0.75rem;
            background: var(--gray-100);
        }

        .action-btn {
            flex: 1;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 0.375rem;
            font-weight: 500;
            font-size: 0.875rem;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            min-height: 2.25rem;
        }

        .reschedule-action {
            background-color: var(--warning);
            color: white;
        }

        .reschedule-action:hover {
            background-color: #e6900e;
        }

        .cancel-action {
            background-color: var(--danger);
            color: white;
        }

        .cancel-action:hover {
            background-color: #dc2626;
        }

        .consultation-timestamp {
            font-size: 0.75rem;
            color: var(--gray-500);
            padding: 0.5rem 1.5rem;
            background-color: white;
            border-top: 1px solid var(--gray-200);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        @media (max-width: 1024px) {
            .consultation-list {
                grid-template-columns: repeat(auto-fill, minmax(24rem, 1fr));
            }
        }

        @media (max-width: 768px) {
            .consultation-wrapper {
                padding: 0 1rem;
                margin: 1.5rem auto;
            }

            .consultation-header {
                font-size: 1.5rem;
            }

            .consultation-list {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .consultation-details {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .consultation-actions {
                flex-direction: column;
            }

            .action-btn {
                width: 100%;
            }
        }
    </style>
    <script>
        function confirmReschedule() {
            return confirm("Are you sure you want to reschedule this consultation?");
        }
        function confirmCancel() {
            return confirm("Are you sure you want to cancel this consultation?");
        }
    </script>
</head>
<body class="consultation-container">
<jsp:include page="navbar.jsp" />

<div class="consultation-wrapper">
    <div class="consultation-header-container">
        <h2 class="consultation-header">Scheduled Consultations</h2>
    </div>

    <%
        if (appointments == null || appointments.isEmpty()) {
    %>
    <div class="empty-consultations">
        <p>No property consultations scheduled yet.</p>
    </div>
    <%
        } else {
    %>
    <ul class="consultation-list">
        <% for (Appointment a : appointments) {
            String fullName = a.getFirstName() + " " + a.getLastName();
            String service;
            switch (a.getService()) {
                case "buy": service = "Buying Consultation"; break;
                case "sell": service = "Selling Consultation"; break;
                case "rent": service = "Rental Consultation"; break;
                case "valuation": service = "Valuation Service"; break;
                default: service = "Property Consultation";
            }

            String formattedTime;
            switch (a.getTime()) {
                case "9-10": formattedTime = "9:00 - 10:00 AM"; break;
                case "10-11": formattedTime = "10:00 - 11:00 AM"; break;
                case "11-12": formattedTime = "11:00 AM - 12:00 PM"; break;
                case "1-2": formattedTime = "1:00 - 2:00 PM"; break;
                case "2-3": formattedTime = "2:00 - 3:00 PM"; break;
                case "3-4": formattedTime = "3:00 - 4:00 PM"; break;
                default: formattedTime = a.getTime();
            }
        %>
        <li class="consultation-card">
            <h3 class="consultation-client">
                <i class="fas fa-user"></i> <%= fullName %>
            </h3>

            <div class="consultation-content">
                <div class="consultation-details">
                    <div class="detail-item">
                        <strong class="detail-label">Service</strong>
                        <span class="detail-value"><i class="fas fa-home"></i> <%= service %></span>
                    </div>
                    <div class="detail-item">
                        <strong class="detail-label">Property</strong>
                        <span class="detail-value"><i class="fas fa-building"></i> <%= a.getPropertyType() == null || a.getPropertyType().isEmpty() ? "Not specified" : a.getPropertyType() %></span>
                    </div>
                    <div class="detail-item">
                        <strong class="detail-label">Date</strong>
                        <span class="detail-value"><i class="far fa-calendar-alt"></i> <%= a.getDate() %></span>
                    </div>
                    <div class="detail-item">
                        <strong class="detail-label">Time</strong>
                        <span class="detail-value"><i class="far fa-clock"></i> <%= formattedTime %></span>
                    </div>
                    <div class="detail-item">
                        <strong class="detail-label">Contact</strong>
                        <span class="detail-value"><i class="fas fa-phone"></i> <%= a.getPhone() %></span>
                    </div>
                    <div class="detail-item">
                        <strong class="detail-label">Email</strong>
                        <span class="detail-value"><i class="fas fa-envelope"></i> <%= a.getEmail() %></span>
                    </div>
                </div>

                <% if (a.getNotes() != null && !a.getNotes().isEmpty()) { %>
                <div class="consultation-notes">
                    <strong>Notes:</strong> <%= a.getNotes() %>
                </div>
                <% } %>
            </div>

            <div class="consultation-footer">
                <div class="consultation-actions">
                    <form action='get_consultation' method='get'>
                        <input type='hidden' name='appointmentId' value='<%= a.getId() %>'>
                        <button type='submit' class='action-btn reschedule-action' onclick="return confirmReschedule()">
                            <i class="fas fa-calendar-alt"></i> Reschedule
                        </button>
                    </form>
                    <form action='delete_consultation' method='post'>
                        <input type='hidden' name='appointmentId' value='<%= a.getId() %>'>
                        <button type='submit' class='action-btn cancel-action' onclick="return confirmCancel()">
                            <i class="fas fa-times"></i> Cancel
                        </button>
                    </form>
                </div>

                <div class="consultation-timestamp">
                    <i class="far fa-calendar-check"></i> Scheduled on <%= a.getTimestamp() %>
                </div>
            </div>
        </li>
        <% } %>
    </ul>
    <% } %>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>