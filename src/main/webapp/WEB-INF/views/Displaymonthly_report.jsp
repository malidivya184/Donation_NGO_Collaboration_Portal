<%@ page import="java.util.List" %>
<%@ page import="com.r3sys.model.Donation" %>

<%
    List<Donation> donations = (List<Donation>) request.getAttribute("donations");
    int month = (Integer) request.getAttribute("month");
    int year = (Integer) request.getAttribute("year");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Monthly Donation Report</title>
</head>
<body>
    <h2>Donation Report for <%= month %> / <%= year %></h2>

    <%
        if (donations == null || donations.isEmpty()) {
    %>
        <p>No donations found for this month.</p>
    <%
        } else {
    %>
        <table border="1">
            <tr>
                <th>Donation ID</th>
                <th>Donor Name</th>
                <th>NGO Name</th>
                <th>Item Type</th>
                <th>Item Name</th>
                <th>Quantity/Amount</th>
                <th>Donated On</th>
                <th>Status</th>
            </tr>
            <%
                for (Donation d : donations) {
            %>
                <tr>
                    <td><%= d.getId() %></td>
                    <td><%= d.getDonor().getName() %></td>
                    <td><%= d.getNgo().getName() %></td>
                    <td><%= d.getItemType() %></td>
                    <td><%= d.getItemName() %></td>
                    <td><%= d.getQuantity_or_amount() %></td>
                    <td><%= d.getDonatedOn() %></td>
                    <td><%= d.getStatus() %></td>
                </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>
</body>
</html>
