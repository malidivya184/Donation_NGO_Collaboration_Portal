<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.r3sys.model.VolunteerTask" %>
<%@ page import="com.r3sys.model.Donation" %>
<%
    List<VolunteerTask> tasks = (List<VolunteerTask>) request.getAttribute("tasks");
%>

<html>
<head>
    <title>Nearby Delivery Tasks</title>
    <style>
        body { font-family: Arial; background-color: #f4f4f4; padding: 30px; }
        table {
            width: 95%; margin: auto; border-collapse: collapse;
            background: white; box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
<h2 align="center">Nearby Delivery Tasks</h2>
<table>
    <tr>
        <th>Donation Item</th>
        <th>NGO Name</th>
        <th>Pickup Address</th>
        <th>Delivery Address</th>
        <th>Status</th>
    </tr>
<%
    if (tasks != null) {
        for (VolunteerTask vt : tasks) {
%>
    <tr>
        <td><%= vt.getDonation().getItemName() %></td>
        <td><%= vt.getDonation().getNgo().getName() %></td>
        <td><%= vt.getPickupAddress() %></td>
        <td><%= vt.getDeliveryAddress() %></td>
        <td><%= vt.getStatus() %></td>
    </tr>
<%
        }
    } else {
%>
    <tr><td colspan="5">No nearby tasks found.</td></tr>
<%
    }
%>
</table>
</body>
</html>