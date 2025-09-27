<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Post Donation Request</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 40px;
        }

        .form-container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background: #28a745;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background: #218838;
        }

        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Post Donation Request</h2>

        <form action="submitRequest" method="post">
            <label for="itemType">Request Type</label>
            <select name="itemType" required>
                <option value="">--Select--</option>
                <option value="Item">Item</option>
                <option value="Money">Money</option>
            </select>

            <label for="itemName">Item Name / Purpose</label>
            <input type="text" name="itemName" required>

            <label for="description">Description</label>
            <textarea name="description" rows="5" required></textarea>

            <label for="quantity_or_amount">Amount / Quantity</label>
            <input type="number" name="quantity_or_amount" min="1" required>

            <input type="submit" class="btn" value="Submit Request">
        </form>

        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
    </div>
</body>
</html>
