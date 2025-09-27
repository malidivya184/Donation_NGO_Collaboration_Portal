<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.r3sys.model.Donation" %>
<%@ page import="com.r3sys.model.Donor" %>


<%
    List<Donation> donations = (List<Donation>) request.getAttribute("donations");
%>

<html>
<head>
    <title>Track Donation Fulfillment</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 30px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        table {
            width: 95%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            border-radius: 6px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            border: 1px solid #e0e0e0;
            text-align: center;
            font-size: 14px;
        }
        th {
            background-color: #28a745;
            color: white;
            text-transform: uppercase;
        }
        tr:nth-child(even) {
            background-color: #f4f6f8;
        }
        tr:hover {
            background-color: #e9f7ee;
        }
        .no-data {
            text-align: center;
            padding: 15px;
            color: #666;
            font-style: italic;
        }
    </style>
</head>
<body>

<h2>Track Donation Fulfillment</h2>

<table>
    <tr>
        <th>Donor Name</th>
        <th>Item Type</th>
        <th>Item Name</th>
        <th>Quantity/Amount</th>
        <th>Donation Date</th>
        <th>Status</th>
    </tr>

    <%
        if (donations != null && !donations.isEmpty()) {
            for (Donation d : donations) {
    %>
        <tr>
            <td><%= d.getDonor() != null ? d.getDonor().getName() : "N/A" %></td>
            <td><%= d.getItemType() %></td>
            <td><%= d.getItemName() %></td>
            <td><%= d.getQuantity_or_amount() %></td>
            <td>
                <fmt:formatDate value="<%= d.getDonatedOn() %>" pattern="dd-MM-yyyy" />
            </td>
            <td><%= d.getStatus() %></td>
        </tr>
    <%
            }
        } else {
    %>
        <tr><td colspan="6" class="no-data">No donations found.</td></tr>
    <%
        }
    %>
</table>

</body>
</html>
