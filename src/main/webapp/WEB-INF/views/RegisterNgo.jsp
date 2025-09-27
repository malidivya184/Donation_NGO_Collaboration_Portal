<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>NGO Registration</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #e6f2ff, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
            background-color: #f9f9f9;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
            width: 400px;
        }

        .register-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2c3e50;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px 0;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: 100%;
             background-color: #f39c12;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
               background-color: #d35400;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .login-link a {
            color: #2980b9;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="register-container">
        <h2>NGO Registration</h2>

        <form action="RegisterSuccessfully" method="post">
            <table>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="email" required></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" required></td>
                </tr>
                <tr>
                    <td>Contact:</td>
                    <td><input type="text" name="contact" required></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><input type="text" name="city" required></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><textarea name="address" rows="3" required></textarea></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Register"></td>
                </tr>
            </table>
        </form>

        <div class="login-link">
            Already have an account? <a href="ngoLoginPage">Login here</a>
        </div>
    </div>

</body>
</html>
