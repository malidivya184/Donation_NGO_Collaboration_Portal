<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.r3sys.model.VolunteerTask" %>
<%
    List<VolunteerTask> taskHistory = (List<VolunteerTask>) request.getAttribute("taskHistory");
%>
<html>
<head>
    <title>Task History</title>
    <style>
        body { font-family: Arial; background: #f0f2f5; padding: 20px; }
        h2 { text-align: center; }
        table { width: 90%; margin: auto; border-collapse: collapse; background-color: #fff; box-shadow: 0 0 10px #ccc; }
        th, td { padding: 12px; text-align: center; border-bottom: 1px solid #ddd; }
        th { background-color: #5c6bc0; color: white; }
        tr:hover { background-color: #f1f1f1; }
    </style>
</head>
<body>
    <h2>Task History</h2>
    <table>
        <tr>
            <th>Task ID</th>
            <th>Pickup Address</th>
            <th>Delivery Address</th>
            <th>Status</th>
        </tr>
        <%
            if (taskHistory != null && !taskHistory.isEmpty()) {
                for (VolunteerTask task : taskHistory) {
        %>
        <tr>
            <td><%= task.getId() %></td>
            <td><%= task.getPickupAddress() %></td>
            <td><%= task.getDeliveryAddress() %></td>
            <td><%= task.getStatus() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No tasks found.</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
