<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>NGO Login</title>
    <style>
        body {
            background-color: #f0f4f8;
            font-family: Arial, sans-serif;
        }

        .login-container {
            width: 400px;
            margin: 80px auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #bbb;
            border-radius: 4px;
        }

        .btn {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #219150;
        }

        .error {
            color: red;
            text-align: center;
        }

        .link {
            text-align: center;
            margin-top: 15px;
        }

        .link a {
            color: #2980b9;
            text-decoration: none;
        }

        .link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>NGO Login</h2>

        <form action="ngoLoginPage" method="post">
            <label for="email">Email:</label>
            <input type="text" name="email" id="email" required>

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>

            <input type="submit" class="btn" value="Login">
        </form>

        <div class="link">
            <p>Don't have an account? <a href="registerNgoPage">Register here</a></p>
        </div>

       
    </div>

</body>
</html>
