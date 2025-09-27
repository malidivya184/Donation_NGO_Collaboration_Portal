<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.r3sys.model.Donor" %>
<%@ page import="com.r3sys.model.Donation" %>
<%@ page import="com.r3sys.model.Ngo" %>


<%
    Donor donor = (Donor) session.getAttribute("donor");
    if (donor == null) {
        response.sendRedirect("donorLoginPage");
        return;
    }

    List<Donation> donations = (List<Donation>) request.getAttribute("donations");
%>

<html>
<head>
    <title>Donation History</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            padding: 30px;
            background-color: #f8f9fa;
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
            background-color: #007bff;
            color: white;
            text-transform: uppercase;
        }
        tr:nth-child(even) {
            background-color: #f4f6f8;
        }
        tr:hover {
            background-color: #e9f3ff;
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

<h2>Your Donation History</h2>

<table>
    <thead>
        <tr>
            <th>Item Type</th>
            <th>Item Name</th>
            <th>Quantity/Amount</th>
            <th>NGO Name</th>
            <th>Donation Date</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
    <%
        if (donations != null && !donations.isEmpty()) {
            for (Donation d : donations) {
    %>
        <tr>
            <td><%= d.getItemType() %></td>
            <td><%= d.getItemName() %></td>
            <td><%= d.getQuantity_or_amount() %></td>
            <td><%= d.getNgo() != null ? d.getNgo().getName() : "N/A" %></td>
            <td>
                <fmt:formatDate value="<%= d.getDonatedOn() %>" pattern="dd-MM-yyyy" />
            </td>
            <td><%= d.getStatus() %></td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="6" class="no-data">No donation records found.</td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
