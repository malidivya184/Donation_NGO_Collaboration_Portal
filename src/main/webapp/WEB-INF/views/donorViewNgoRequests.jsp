<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.r3sys.model.Request" %>
<%
    List<Request> requestList = (List<Request>) request.getAttribute("requests");
    String keyword = (String) request.getAttribute("keyword");
%>
<html>
<head>
    <title>NGO Donation Requests</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        input[type="text"] {
            width: 300px;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f1f1f1;
        }

        tr:nth-child(even) {
            background-color: #fafafa;
        }

        .no-results {
            text-align: center;
            color: red;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<h2>NGO Donation Requests</h2>

<form action="searchRequests" method="post">
    <input type="text" name="keyword" placeholder="Search by Category or City" value="<%= keyword != null ? keyword : "" %>">
    <input type="submit" value="Search">
</form>

<%
    if (requestList != null && !requestList.isEmpty()) {
%>
    <table>
        <tr>
            <th>ID</th>
            <th>Item Type</th>
            <th>Item Name</th>
            <th>Quantity/Amount</th>
            <th>City</th>
            <th>Description</th>
            <th>NGO</th>
        </tr>
        <%
            for (Request r : requestList) {
        %>
        <tr>
            <td><%= r.getId() %></td>
            <td><%= r.getItemType() %></td>
            <td><%= r.getItemName() %></td>
            <td><%= r.getQuantity_or_amount() %></td>
            <td><%= r.getNgo().getCity() %></td>
            <td><%= r.getDescription() %></td>
            <td><%= r.getNgo().getName() %></td>
        </tr>
        <%
            }
        %>
    </table>
<%
    } else if (keyword != null) {
%>
    <p class="no-results">No requests found for "<strong><%= keyword %></strong>"</p>
<%
    }
%>

</body>
</html>
