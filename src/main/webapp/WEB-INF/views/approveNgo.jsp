<%@ page import="java.util.List" %>
<%@ page import="com.r3sys.model.Ngo" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Approve NGOs</title>
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
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 40px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            z-index: 1000;
        }

        .topbar .logo {
            color: #f39c12;
            font-size: 20px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .topbar .menu a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 15px;
            padding: 8px 14px;
            border-radius: 5px;
            transition: background 0.3s ease;
        }

        .topbar .menu a:hover {
            background-color: #34495e;
        }

        /* Main Content */
        .main-content {
            margin: 100px auto 40px auto; /* leave space for topbar */
            width: 90%;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
        }

        .main-content h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
            font-size: 26px;
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: #f39c12;
            color: white;
        }

        tr:hover {
            background-color: #fdf3e6;
        }

        /* Approve button */
        input[type="submit"] {
            padding: 6px 14px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        /* No data */
        .no-data {
            text-align: center;
            padding: 20px;
            color: #888;
            font-style: italic;
        }

        /* Back Button */
        .back-btn {
            display: inline-block;
            margin-top: 25px;
            background-color: #2c3e50;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 15px;
            transition: background 0.3s ease;
        }

        .back-btn:hover {
            background-color: #1f2d3a;
        }
    </style>
</head>
<body>

    <!-- Topbar -->
    <div class="topbar">
        <div class="logo">Admin Panel</div>
        <div class="menu">
            <a href="adminDashboard">Dashboard</a>

        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2>Pending NGO Registrations</h2>

        <%
            List<Ngo> pendingNgos = (List<Ngo>) request.getAttribute("pendingNgos");
            if (pendingNgos != null && !pendingNgos.isEmpty()) {
        %>
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Contact</th>
                <th>City</th>
                <th>Address</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <%
                for (Ngo ngo : pendingNgos) {
            %>
            <tr>
                <td><%= ngo.getName() %></td>
                <td><%= ngo.getEmail() %></td>
                <td><%= ngo.getContact() %></td>
                <td><%= ngo.getCity() %></td>
                <td><%= ngo.getAddress() %></td>
                <td><%= ngo.getStatus() %></td>
                <td>
                    <form action="approveNgo" method="post">
                        <input type="hidden" name="id" value="<%= ngo.getId() %>">
                        <input type="submit" value="Approve">
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <% } else { %>
            <p class="no-data">No pending NGOs to approve.</p>
        <% } %>

    </div>

</body>
</html>
