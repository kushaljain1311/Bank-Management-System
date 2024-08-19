<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .center {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }
        h1 {
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        table {
            width: 100%;
        }
        th {
            text-align: left;
            padding-bottom: 10px;
        }
        td {
            padding-bottom: 10px;
        }
        input[type="text"], input[type="email"], input[type="password"], input[type="number"] {
            width: calc(100% - 10px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="radio"] {
            margin-right: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="center">
        <h1>Register</h1>
        <form action="RegisterActions.jsp" method="post">
            <table>
                <tr>
                    <th>Account Number:</th>
                    <td><input type="text" name="accountNumber" placeholder="Account Number" required></td>
                </tr>
                <tr>
                    <th>First Name:</th>
                    <td><input type="text" name="fname" placeholder="First Name" required></td>
                </tr>
                <tr>
                    <th>Last Name:</th>
                    <td><input type="text" name="lname" placeholder="Last Name" required></td>
                </tr>
                <tr>
                    <th>E-mail:</th>
                    <td><input type="email" name="email" placeholder="abc@gmail.com" required></td>
                </tr>
                <tr>
                    <th>Password:</th>
                    <td><input type="password" name="password" placeholder="******" required></td>
                </tr>
                <tr>
                    <th>Phone No:</th>
                    <td><input type="number" name="phoneno" placeholder="Phone Number" required></td>
                </tr>
                <tr>
                    <th>Gender:</th>
                    <td>
                        <input type="radio" name="gn" value="Male" required> Male
                        <input type="radio" name="gn" value="Female" required> Female
                    </td>
                </tr>
                <tr>
                    <th>Initial Balance:</th>
                    <td><input type="number" name="balance" placeholder="Initial Balance" step="0.01" min="0" required></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Sign Up">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
