<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.r3sys.model.Volunteer" %>

<%
    Volunteer volunteer = (Volunteer) session.getAttribute("volunteer");
    if (volunteer == null) {
        response.sendRedirect("volunteerLoginPage.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Volunteer Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
         
        }

        /* Top Navbar */
        .top-navbar {
            background-color: #2c3e50;
            color: white;
            padding: 12px 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        }

        .top-navbar .left {
            font-size: 20px;
            font-weight: bold;
            color: #f39c12;
        }

        .top-navbar .right {
            font-size: 16px;
        }

        /* Sidebar */
        .sidebar {
            width: 220px;
            height: 100vh;
            background-color: #2c3e50;
            padding-top: 70px; /* Leave space for navbar */
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 2px 0 6px rgba(0,0,0,0.2);
        }

        .sidebar a {
            display: block;
            padding: 14px 20px;
            color: white;
            text-decoration: none;
            font-weight: 500;
            font-size: 15px;
            transition: background 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #34495e;
        }

        /* Main content */
        .main {
            margin-left: 240px;
            padding: 100px 30px 30px;
        }

        h2 {
            color: #2c3e50;
        }

        /* Services Section */
        .services {
            margin-top: 30px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
        }

        .service-card {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .service-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .service-card i {
            font-size: 32px;
            color: #2c3e50;
            margin-bottom: 12px;
        }

        .service-card h3 {
            margin: 10px 0;
            color: #2c3e50;
        }

        .service-card p {
            color: #555;
            font-size: 14px;
        }
    </style>
</head>
<body>

<!-- Top Navbar -->
<div class="top-navbar">
    <div class="left"><i class="fas fa-hands-helping"></i> Volunteer Panel</div>
    <div class="right">Welcome, <%= volunteer.getName() %> <i class="fas fa-user-circle"></i></div>
</div>

<!-- Sidebar -->
<div class="sidebar">
    <a href="viewNearbyDeliveryTasks"><i class="fas fa-map-marker-alt"></i> Nearby Tasks</a>
    <a href="acceptAndMarkDelivered"><i class="fas fa-check-circle"></i> Accept & Deliver</a>
    <a href="trackTaskHistory"><i class="fas fa-history"></i> Task History</a>
    <a href="volunteerChangePasswordPage"><i class="fas fa-key"></i> Change Password</a>
    <a href="volunteerLoginPage"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>

<!-- Main Content -->
<div class="main">

    <!-- Services Section -->
    <div class="services">
        <div class="service-card">
            <i class="fas fa-truck"></i>
            <h3>Delivery Support</h3>
            <p>Pick up and deliver donations to NGOs and beneficiaries efficiently.</p>
        </div>
        <div class="service-card">
            <i class="fas fa-map"></i>
            <h3>Nearby Tasks</h3>
            <p>View tasks assigned near your location for quicker delivery management.</p>
        </div>
        <div class="service-card">
            <i class="fas fa-clipboard-check"></i>
            <h3>Task Management</h3>
            <p>Accept, track, and complete your assigned delivery tasks on time.</p>
        </div>
        <div class="service-card">
            <i class="fas fa-history"></i>
            <h3>History Tracking</h3>
            <p>Maintain records of your completed tasks and deliveries.</p>
        </div>
    </div>
</div>

</body>
</html>
