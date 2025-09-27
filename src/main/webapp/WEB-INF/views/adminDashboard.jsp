<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #fdfdfd;
        }

        /* Topbar */
        .topbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #2c3e50;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 40px;
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
            font-size: 16px;
            padding: 8px 14px;
            border-radius: 5px;
            transition: background 0.3s ease;
        }

        .topbar .menu a:hover {
            background-color: #34495e;
        }

        /* Main content */
        .main-content {
            margin-top: 90px; /* leave space for topbar */
            padding: 40px;
            text-align: center;
        }

        .main-content h2 {
            color: #2c3e50;
            font-size: 32px;
            margin-bottom: 40px;
        }

        /* Services Section */
        .services {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
        }

        .service-card {
            background: #fff;
            padding: 25px 20px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
        }

        .service-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.2);
        }

        .service-card h3 {
            color: #f39c12;
            margin-bottom: 15px;
            font-size: 20px;
        }

        .service-card p {
            color: #555;
            font-size: 15px;
            line-height: 1.6;
        }
    </style>
</head>
<body>

    <!-- Topbar -->
    <div class="topbar">
        <div class="logo">Admin Panel</div>
        <div class="menu">
            <a href="approveNgoPage">Approve NGOs</a>
            <a href="viewAllDonations">View All Donations</a>
            <a href="viewNgoRequestPage">View All Requests</a>
            <a href="assignVolunteerTasks">Assign Volunteer Tasks</a>
            <a href="generateReport">Generate Monthly Reports</a>
            <a href="adminChangePasswordPage">Change Password</a>
            <a href="adminLoginPage">Logout</a>
        </div>
    </div>

    <!-- Content Area -->
    <div class="main-content">
        <h2>Services & Facilities</h2>

        <div class="services">
            <div class="service-card">
                <h3>NGO Management</h3>
                <p>Approve and manage NGO registrations to ensure only verified organizations can collaborate.</p>
            </div>

            <div class="service-card">
                <h3>Donation Tracking</h3>
                <p>View and monitor all donations, ensuring transparency and efficient distribution of resources.</p>
            </div>

            <div class="service-card">
                <h3>Request Handling</h3>
                <p>Check and respond to NGO requests for donations and resources in real-time.</p>
            </div>

            <div class="service-card">
                <h3>Volunteer Coordination</h3>
                <p>Assign and track volunteer tasks to ensure smooth delivery of donations and services.</p>
            </div>

            <div class="service-card">
                <h3>Reports & Analytics</h3>
                <p>Generate monthly reports to analyze donation flow, volunteer activities, and NGO participation.</p>
            </div>

            <div class="service-card">
                <h3>Secure Access</h3>
                <p>Admins have secure login and password management to maintain portal integrity.</p>
            </div>
        </div>
    </div>

</body>
</html>
