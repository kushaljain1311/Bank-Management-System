<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deposit</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .container h2 {
            text-align: center;
        }
        .container label {
            display: block;
            margin: 10px 0 5px;
        }
        .container input[type="text"], .container input[type="number"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .container input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Deposit Money</h2>
        <form action="depositAction.jsp" method="post">
            <label for="accountNumber">Account Number:</label>
            <input type="text" id="accountNumber" name="accountNumber" required>

            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" required>

            <input type="submit" value="Deposit">
        </form>
    </div>
</body>
</html>
