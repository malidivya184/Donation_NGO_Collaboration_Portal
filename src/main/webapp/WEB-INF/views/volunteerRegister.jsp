<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Volunteer Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f1f1;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 80px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #27ae60;
            border: none;
            color: white;
            font-size: 16px;
            margin-top: 20px;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #219150;
        }

        .back-link {
            text-align: center;
            margin-top: 15px;
        }

        .back-link a {
            color: #3498db;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Volunteer Registration</h2>
        <form action="registerVolunteer" method="post">
            <label for="name">Name:</label>
            <input type="text" name="name" required>

            <label for="email">Email:</label>
            <input type="email" name="email" required>

            <label for="contact">Contact:</label>
            <input type="text" name="contact" required>

            <label for="password">Password:</label>
            <input type="password" name="password" required>

            <label for="city">City:</label>
            <input type="text" name="city" required>

            <input type="submit" value="Register">
        </form>
        <div class="back-link">
            <p>Already have an account? <a href="volunteerLoginPage">Login here</a></p>
        </div>
    </div>
</body>
</html>
