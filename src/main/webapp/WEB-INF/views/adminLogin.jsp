<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f3f3;
        }
        .login-container {
            width: 400px;
            margin: 100px auto;
            padding: 30px;
            background: white;
            box-shadow: 0 0 10px #ccc;
            border-radius: 8px;
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin: 15px 0;
        }
        .form-group label {
            display: block;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
        }
        .btn {
            background-color: #f39c12;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
             background-color: #d35400;;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Admin Login</h2>
    <form action="adminLogin" method="post">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required/>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required/>
        </div>

        <button type="submit" class="btn">Login</button>
    </form>
</div>

</body>
</html>
