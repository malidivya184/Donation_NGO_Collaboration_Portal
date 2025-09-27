<%@ page import="java.util.*, com.r3sys.model.Ngo, com.r3sys.model.Request" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NGO Requests</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: #eef2f3;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            background: #fff;
            padding: 30px 40px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        form {
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            font-size: 16px;
            font-weight: bold;
        }

        select {
            padding: 10px 14px;
            font-size: 15px;
            margin-left: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 15px;
            margin-left: 15px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .no-data {
            text-align: center;
            color: red;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>View Requests by NGO</h2>

    <form method="post" action="viewNgoRequestPage">
        <label>Select Approved NGO:</label>
        <select name="ngoId" required>
            <option value="">-- Select NGO --</option>
            <%
                List<Ngo> approvedNgos = (List<Ngo>) request.getAttribute("approvedNgos");
                Integer selectedNgoId = (Integer) request.getAttribute("selectedNgoId");
                if (approvedNgos != null) {
                    for (Ngo ngo : approvedNgos) {
            %>
                <option value="<%= ngo.getId() %>" <%= (selectedNgoId != null && selectedNgoId == ngo.getId()) ? "selected" : "" %>>
                    <%= ngo.getName() %> (ID: <%= ngo.getId() %>)
                </option>
            <%
                    }
                }
            %>
        </select>
        <input type="submit" value="Show Requests" />
    </form>

    <%
        List<Request> requests = (List<Request>) request.getAttribute("requests");
        if (requests != null && !requests.isEmpty()) {
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Item Type</th>
            <th>Item Name</th>
            <th>Quantity / Amount</th>
            <th>Description</th>
            <th>Status</th>
        </tr>
        <%
            for (Request req : requests) {
        %>
        <tr>
            <td><%= req.getId() %></td>
            <td><%= req.getItemType() %></td>
            <td><%= req.getItemName() %></td>
            <td><%= req.getQuantity_or_amount() %></td>
            <td><%= req.getDescription() %></td>
            <td><%= req.getStatus() %></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } else if (request.getParameter("ngoId") != null) {
    %>
    <p class="no-data">No requests found for selected NGO.</p>
    <%
        }
    %>
</div>
</body>
</html>
