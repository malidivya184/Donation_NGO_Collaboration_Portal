<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.r3sys.model.Donor" %>
<%
    Donor donor = (Donor) session.getAttribute("donor");
    if (donor == null) {
        response.sendRedirect("donorLoginPage");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Donor Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
        }

        .topbar .menu {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .topbar .menu span {
            color: white;
            font-size: 15px;
            margin-right: 15px;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropbtn {
            background-color: #2c3e50;
            color: white;
            padding: 10px 16px;
            font-size: 15px;
            border: none;
            cursor: pointer;
            border-radius: 6px;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: white;
            min-width: 220px;
            box-shadow: 0px 8px 16px rgba(0,0,0,0.2);
            border-radius: 6px;
            z-index: 1;
        }

        .dropdown-content a {
            color: #333;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            font-weight: 500;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropbtn {
            background-color: #1a252f;
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

        .instructions {
            list-style: disc;
            padding-left: 20px;
            color: #444;
            line-height: 1.6;
        }
    </style>
</head>
<body>

    <!-- Topbar -->
    <div class="topbar">
        <div class="logo">Donor Dashboard</div>
        <div class="menu">
            <span>Welcome, <%= donor.getName() %></span>
            <div class="dropdown">
                <button class="dropbtn">Manage ⏷</button>
                <div class="dropdown-content">
                    <a href="donorViewNgoRequestsPage">View NGO Requests</a>
                    <a href="donatePage">Donate Items or Money</a>
                    <a href="donationHistory">View Donation History</a>
                    <a href="donorChangePasswordPage">Change Password</a>
                    <a href="donorLoginPage">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="card">
            <p>As a donor, you can contribute by responding to NGO requests, donating money or essential items, and tracking your contribution history.</p>
        </div>

        <div class="card">
            <h3>Important Instructions for Donors</h3>
            <ul class="instructions">
                <li>Review NGO requests before making a donation to ensure your contribution meets their needs.</li>
                <li>Ensure that donated items are in good condition and usable.</li>
                <li>For monetary donations, only use the secure donation page provided in this portal.</li>
                <li>Keep track of your donations in the <b>Donation History</b> section.</li>
                <li>Contact the NGO directly if you require clarification on any request.</li>
            </ul>
        </div>
    </div>

</body>
</html>
