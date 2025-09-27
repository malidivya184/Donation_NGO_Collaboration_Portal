<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Donation & NGO Collaboration Portal</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('<c:url value="/resources/images/FrontPage.png"/>') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: flex-start;
        }

        /* Left-side message section */
        .left-message {
            position: absolute;
            top: 25%;
            left: 8%;
            max-width: 550px;
            color: #2c3e50; /* Dark text for better visibility */
        }

        .left-message h1 {
            font-size: 55px;   /* Bigger */
            font-weight: 900;  /* Extra Bold */
            line-height: 1.3;
            margin-bottom: 20px;
            color: #1a1a1a; /* Dark Gray / Black */
            text-shadow: 2px 2px 6px rgba(255,255,255,0.8); /* Light shadow for contrast */
        }

        .left-message p {
            font-size: 17px;
            font-weight: 500;
            line-height: 1.6;
            margin-bottom: 30px;
            color: #444; /* Medium-dark gray */
            text-shadow: 1px 1px 4px rgba(255,255,255,0.9); /* Improves readability */
        }

        /* Role buttons - horizontal row */
        .role-buttons {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .role-link {
            padding: 12px 26px;
            font-size: 15px;
            background-color: #f39c12;
            color: white;
            text-decoration: none;
            border-radius: 25px;
            transition: background 0.3s ease, transform 0.2s ease;
            font-weight: 600;
            box-shadow: 2px 2px 8px rgba(0,0,0,0.2);
        }

        .role-link:hover {
            background-color: #d35400;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <!-- Left Side Text and Buttons -->
    <div class="left-message">
        <h1>Help The Poor<br>For Their Better Future.!!</h1>
        <p>Every day we bring hope to millions of children in the world’s hardest places
           as a sign of God’s unconditional love.</p>

        <!-- Role Buttons (Horizontal) -->
        <div class="role-buttons">
            <a class="role-link" href="adminLoginPage">Admin</a>
            <a class="role-link" href="registerNgoPage">NGO</a>
            <a class="role-link" href="donorRegisterPage">Donor</a>
            <a class="role-link" href="volunteerRegisterPage">Volunteer</a>
        </div>
    </div>

</body>
</html>
