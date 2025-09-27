<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.r3sys.model.Donation" %>
<%@ page import="com.r3sys.model.Ngo" %>
<%@ page import="com.r3sys.model.Donor" %>

<%
    Ngo ngo = (Ngo) session.getAttribute("ngo");
    if (ngo == null) {
        response.sendRedirect("ngoLoginPage");
        return;
    }

    List<Donation> offers = (List<Donation>) request.getAttribute("offers");
%>

<html>
<head>
    <title>Donor Offers</title>
    <style>
        body { font-family: Arial; background-color: #f4f4f4; padding: 30px; }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th { background-color: #28a745; color: white; }
        h2 { text-align: center; }
        a.button {
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        a.button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Donation Offers for Your NGO</h2>

    <table>
        <thead>
            <tr>
                <th>Donor Name</th>
                <th>Item Type</th>
                <th>Item Name</th>
                <th>Quantity/Amount</th>
                <th>Date</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (offers != null && !offers.isEmpty()) {
                for (Donation d : offers) {
        %>
            <tr>
                <td><%= d.getDonor().getName() %></td>
                <td><%= d.getItemType() %></td>
                <td><%= d.getItemName() %></td>
                <td><%= d.getQuantity_or_amount() %></td>
                <td><%= d.getDonatedOn() %></td>
                <td><%= d.getStatus() %></td>
                <td>
                    <a class="button" href="editDonationStatus?id=<%= d.getId() %>">Accept/Reject</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr><td colspan="7">No donor offers found.</td></tr>
        <%
            }
        %>
        </tbody>
    </table>
</body>
</html>
