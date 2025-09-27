<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.r3sys.model.Donation" %>


<html>
<head>
    <title>Monthly Donation Report</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 30px;
        }
        h2, h3 {
            text-align: center;
            color: #333;
        }
        form {
            text-align: center;
            margin-bottom: 25px;
        }
        input[type="number"] {
            padding: 8px;
            margin: 0 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            width: 120px;
        }
        input[type="submit"] {
            padding: 8px 18px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }
        input[type="submit"]:hover {
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
            background-color: #17a2b8;
            color: white;
            text-transform: uppercase;
        }
        tr:nth-child(even) {
            background-color: #f4f6f8;
        }
        tr:hover {
            background-color: #e6f7fa;
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

<h2>Generate Monthly Donation Report</h2>

<form action="generateReport" method="post">
    Month (1-12): <input type="number" name="month" min="1" max="12" required />
    Year (e.g., 2025): <input type="number" name="year" min="2000" max="2100" required />
    <input type="submit" value="Generate Report" />
</form>

<%
    List<Donation> reportList = (List<Donation>) request.getAttribute("reportList");
    if (reportList != null && !reportList.isEmpty()) {
%>
    <h3>Report:</h3>
    <table>
        <tr>
            <th>Item Name</th>
            <th>Quantity/Amount</th>
            <th>Status</th>
            <th>Donated On</th>
        </tr>
        <%
            for (Donation d : reportList) {
        %>
            <tr>
                <td><%= d.getItemName() %></td>
                <td><%= d.getQuantity_or_amount() %></td>
                <td><%= d.getStatus() %></td>
                <td>
                    <fmt:formatDate value="<%= d.getDonatedOn() %>" pattern="dd-MM-yyyy" />
                </td>
            </tr>
        <%
            }
        %>
    </table>
<%
    } else if (reportList != null) {
%>
    <p class="no-data">No records found for this month and year.</p>
<%
    }
%>

</body>
</html>
