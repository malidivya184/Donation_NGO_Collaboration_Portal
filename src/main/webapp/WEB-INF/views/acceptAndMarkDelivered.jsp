<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.r3sys.model.VolunteerTask" %>
<%
    List<VolunteerTask> tasks = (List<VolunteerTask>) request.getAttribute("tasks");
%>

<html>
<head>
    <title>Accept & Mark Delivered</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 20px;
        }

        h2 {
            color: #444;
        }

        table {
            width: 90%;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn {
            padding: 6px 12px;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
        }

        .accept {
            background-color: green;
        }

        .deliver {
            background-color: orange;
        }
    </style>
</head>
<body>
    <h2>My Assigned Tasks</h2>

    <table>
        <tr>
            <th>Task ID</th>
            <th>Pickup Address</th>
            <th>Delivery Address</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            if (tasks != null) {
                for (VolunteerTask task : tasks) {
        %>
        <tr>
            <td><%= task.getId() %></td>
            <td><%= task.getPickupAddress() %></td>
            <td><%= task.getDeliveryAddress() %></td>
            <td><%= task.getStatus() %></td>
            <td>
                <%
                    if ("Assigned".equalsIgnoreCase(task.getStatus())) {
                %>
                    <a href="acceptTask?taskId=<%= task.getId() %>" class="btn accept">Accept</a>
                <%
                    } else if ("Accepted".equalsIgnoreCase(task.getStatus())) {
                %>
                    <a href="markDelivered?taskId=<%= task.getId() %>" class="btn deliver">Mark Delivered</a>
                <%
                    } else {
                        out.print("Completed");
                    }
                %>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="5">No tasks assigned.</td></tr>
        <%
            }
        %>
    </table>
</body>
</html>
