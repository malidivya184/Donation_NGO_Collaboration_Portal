<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.r3sys.model.Donation" %>

<%
    Donation donation = (Donation) request.getAttribute("donation");
    String error = (String) request.getAttribute("error");
    String message = (String) request.getAttribute("message");
%>

<html>
<head>
    <title>Update Donation Status</title>
    <style>
        body {
            font-family: Arial;
            padding: 30px;
            background-color: #f4f4f4;
        }
        .box {
            width: 500px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
        }
        select, input[type="submit"] {
            width: 100%;
            padding: 8px;
            margin-top: 12px;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        .info {
            margin: 10px 0;
        }
        .msg {
            text-align: center;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .msg.error { color: red; }
        .msg.success { color: green; }
    </style>
</head>
<body>

<div class="box">
    <h2>Update Donation Status</h2>

    <% if (error != null) { %>
        <p class="msg error"><%= error %></p>
    <% } %>

    <% if (message != null) { %>
        <p class="msg success"><%= message %></p>
    <% } %>

    <%
        if (donation == null) {
    %>
        <p class="msg error">No donation found. Please return to the previous page.</p>
        <a href="viewDonorOffers" style="display: block; text-align: center; margin-top: 20px;">Back to Offers</a>
    <%
        } else {
    %>
        <p class="info"><strong>Donor:</strong> <%= donation.getDonor() != null ? donation.getDonor().getName() : "Unknown" %></p>
        <p class="info"><strong>Item Type:</strong> <%= donation.getItemType() %></p>
        <p class="info"><strong>Item Name:</strong> <%= donation.getItemName() %></p>
        <p class="info"><strong>Quantity/Amount:</strong> <%= donation.getQuantity_or_amount() %></p>
        <p class="info"><strong>Current Status:</strong> <%= donation.getStatus() %></p>

        <form action="updateDonationStatus" method="post">
            <input type="hidden" name="id" value="<%= donation.getId() %>">

            <label for="status">Change Status:</label>
            <select name="status" required>
                <option value="accepted" <%= "accepted".equalsIgnoreCase(donation.getStatus()) ? "selected" : "" %>>Accept</option>
                <option value="rejected" <%= "rejected".equalsIgnoreCase(donation.getStatus()) ? "selected" : "" %>>Reject</option>
            </select>

            <input type="submit" value="Update Status" />
        </form>
    <%
        }
    %>
</div>

</body>
</html>
