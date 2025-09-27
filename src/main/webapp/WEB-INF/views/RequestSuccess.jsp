<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Request Submitted Successfully</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #a8edea, #fed6e3);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .success-box {
            background: #ffffff;
            padding: 40px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            color: #28a745;
            font-size: 28px;
            margin-bottom: 10px;
        }

        p {
            font-size: 18px;
            color: #444;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: background 0.3s;
        }

        a:hover {
            background-color: #218838;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="success-box">
    <h2>Request Submitted Successfully!</h2>
    <p>Your donation request has been posted and is pending approval by the admin.</p>
    <a href="ngoDashboard">Back to Dashboard</a>
</div>

</body>
</html>
