<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.r3sys.model.Donation" %>
<%@ page import="com.r3sys.model.Donor" %>
<%@ page import="com.r3sys.model.Ngo" %>


<%
    List<Donation> donations = (List<Donation>) request.getAttribute("donations");
    String searchedNgo = request.getParameter("ngoName");
%>

<html>
<head>
    <title>All Donations</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            padding: 30px;
            background-color: #f8f9fa;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .search-box {
            text-align: center;
            margin-bottom: 25px;
        }
        .search-box input[type="text"] {
            padding: 10px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }
        .search-box input[type="submit"] {
            padding: 10px 18px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            margin-left: 8px;
            cursor: pointer;
            font-size: 14px;
        }
        .search-box input[type="submit"]:hover {
            background-color: #0056b3;
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
            background-color: #343a40;
            color: white;
            text-transform: uppercase;
            font-size: 13px;
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

<h2>All Donations</h2>

<div class="search-box">
    <form action="searchDonationsByNgo" method="get">
        <input type="text" name="ngoName" placeholder="Search by NGO Name" 
               value="<%= searchedNgo != null ? searchedNgo : "" %>">
        <input type="submit" value="Search">
    </form>
</div>

<table>
    <tr>
        <th>Donor Name</th>
        <th>Item Type</th>
        <th>Item Name</th>
        <th>Quantity/Amount</th>
        <th>NGO Name</th>
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
            <td colspan="7" class="no-data">No donations found.</td>
        </tr>
    <%
        }
    %>
</table>

</body>
</html>
