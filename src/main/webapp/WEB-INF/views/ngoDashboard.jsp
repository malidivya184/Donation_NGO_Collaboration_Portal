<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.r3sys.model.Ngo" %>
<%@ page session="true" %>
<%
    Ngo ngo = (Ngo) session.getAttribute("ngo");
    if (ngo == null) {
        response.sendRedirect("ngoLoginPage.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NGO Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, sans-serif;
          
        }

        /* Topbar */
        .topbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #2c3e50;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 40px;
            z-index: 1000;
        }

        .topbar .logo {
            color: #f39c12;
            font-size: 22px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .topbar .menu {
            display: flex;
            gap: 20px;
        }

        .topbar .menu a {
            color: white;
            text-decoration: none;
            font-size: 15px;
            padding: 8px 14px;
            border-radius: 6px;
            transition: background 0.3s ease;
        }

        .topbar .menu a:hover {
            background-color: #34495e;
        }

        /* Content */
        .container {
            margin-top: 90px;
            padding: 30px;
            max-width: 1100px;
            margin-left: auto;
            margin-right: auto;
        }

        .card {
            background: rgba(255,255,255,0.95);
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.15);
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            margin-top: 0;
            color: #2c3e50;
        }

        .services {
            display: grid;
            grid-template-columns: repeat(auto-fit,minmax(250px,1fr));
            gap: 20px;
        }

        .service-box {
            background: #fff8f0;
            border-radius: 10px;
            padding: 18px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }

        .service-box h4 {
            color: #e67e22;
            margin-bottom: 10px;
        }

        .service-box p {
            color: #555;
            font-size: 14px;
            line-height: 1.5;
        }

        .welcome-text {
            font-size: 18px;
            color: #555;
        }
    </style>
</head>
<body>

    <!-- Topbar -->
    <div class="topbar">
        <div class="logo">Welcome, <%= ngo.getName() %></div>
        <div class="menu">
            <a href="postRequestPage">Post Donation Request</a>
            <a href="viewDonorOffers">View Offers</a>
            <a href="trackDonations">Track Fulfillment</a>
            <a href="ngoChangePasswordPage">Change Password</a>
            <a href="ngoLoginPage" style="color: #f39c12; font-weight: bold;">Logout</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
       
        <div class="card">
            <h3>Our Services</h3>
            <div class="services">
                <div class="service-box">
                    <h4>Donation Requests</h4>
                    <p>Post donation requests to reach kind-hearted donors who are willing to help.</p>
                </div>
                <div class="service-box">
                    <h4>View Donor Offers</h4>
                    <p>Check donor offers and accept the ones suitable for your NGO’s requirements.</p>
                </div>
                <div class="service-box">
                    <h4>Track Fulfillment</h4>
                    <p>Keep track of donations received and their delivery status in real-time.</p>
                </div>
                <div class="service-box">
                    <h4>Volunteer Collaboration</h4>
                    <p>Work with volunteers to ensure donations reach the needy efficiently.</p>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
