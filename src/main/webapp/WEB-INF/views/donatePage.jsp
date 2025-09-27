<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.r3sys.model.Donor" %>
<%@ page import="com.r3sys.model.Ngo" %>
<%@ page import="java.util.List" %>

<%
    Donor donor = (Donor) session.getAttribute("donor");
    if (donor == null) {
        response.sendRedirect("donorLoginPage");
        return;
    }

    List<Ngo> approvedNgos = (List<Ngo>) request.getAttribute("approvedNgos");
%>

<html>
<head>
    <title>Donate Items or Money</title>
    <style>
        body {
            font-family: Arial;
            padding: 30px;
            background-color: #f4f4f4;
        }
        .form-box {
            width: 500px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], select, textarea {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #28a745;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 16px;
            border-radius: 4px;
        }
        .btn:hover {
            background-color: #218838;
        }
        .msg {
            margin: 10px 0;
            font-weight: bold;
        }
        .msg.error {
            color: red;
        }
        .msg.success {
            color: green;
        }
    </style>
</head>
<body>

<div class="form-box">
    <h2>Donate Items or Money</h2>

    <form action="submitDonation" method="post">
        <label>Item Type:</label>
        <select name="itemType" required>
            <option value="">-- Select Type --</option>
            <option value="Item">Item</option>
            <option value="Money">Money</option>
        </select>

        <label>Item Name:</label>
        <input type="text" name="itemName" placeholder="Enter item name (optional)">

        <label>Quantity or Amount:</label>
        <input type="text" name="quantity_or_amount" required placeholder="Enter quantity or amount">

        <label for="ngoId">Select NGO to Donate:</label>
        <select name="ngoId" id="ngoId" required>
            <option value="">-- Select an NGO --</option>
            <%
                if (approvedNgos != null) {
                    for (Ngo ngo : approvedNgos) {
            %>
                        <option value="<%= ngo.getId() %>"><%= ngo.getName() %> (<%= ngo.getCity() %>)</option>
            <%
                    }
                }
            %>
        </select>

        <input type="submit" value="Donate" class="btn">
    </form>
</div>

</body>
</html>
