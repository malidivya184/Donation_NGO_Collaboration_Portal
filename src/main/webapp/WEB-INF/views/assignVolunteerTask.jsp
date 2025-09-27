<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.r3sys.model.Donation" %>
<%@ page import="com.r3sys.model.Volunteer" %>

<%
    List<Donation> donations = (List<Donation>) request.getAttribute("donations");
    List<Volunteer> volunteers = (List<Volunteer>) request.getAttribute("volunteers");
    String msg = (String) request.getAttribute("message");
%>

<html>
<head>
    <title>Assign Volunteer Task</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background-color: #f4f4f4;
        }
        .form-box {
            background: white;
            padding: 25px;
            width: 550px;
            margin: auto;
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
        select, input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        .msg {
            text-align: center;
            color: green;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="form-box">
    <h2>Assign Volunteer to Donation</h2>

    <% if (msg != null) { %>
        <p class="msg"><%= msg %></p>
    <% } %>

    <form action="assignTask" method="post">
        <label for="donationId">Select Donation:</label>
        <select name="donationId" required>
            <option value="">-- Select Donation --</option>
            <% for (Donation d : donations) { %>
                <option value="<%= d.getId() %>">
                    <%= d.getItemType() %> - <%= d.getItemName() %> (Donor: <%= d.getDonor().getName() %>)
                </option>
            <% } %>
        </select>

        <label for="volunteerId">Select Volunteer:</label>
        <select name="volunteerId" required>
            <option value="">-- Select Volunteer --</option>
            <% for (Volunteer v : volunteers) { %>
                <option value="<%= v.getId() %>">
                    <%= v.getName() %> (<%= v.getCity() %>)
                </option>
            <% } %>
        </select>

        <label for="pickupAddress">Pickup Address:</label>
        <input type="text" name="pickupAddress" required placeholder="Enter pickup address" />

        <label for="deliveryAddress">Delivery Address:</label>
        <input type="text" name="deliveryAddress" required placeholder="Enter delivery address" />

        <input type="submit" value="Assign Task" />
    </form>
</div>

</body>
</html>
