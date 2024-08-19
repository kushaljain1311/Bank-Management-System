<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transfer Money</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #2c3e50;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: #34495e;
        }
        input[type="text"], input[type="number"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 5px 0 20px;
            border: 1px solid #bdc3c7;
            border-radius: 3px;
        }
        button {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background 0.3s, transform 0.3s;
        }
        button:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Transfer Money</h2>
        <form action="transferAction.jsp" method="post">
            <label for="senderAccountNumber">Sender Account Number</label>
            <input type="text" id="senderAccountNumber" name="senderAccountNumber" required>
            
            <label for="receiverAccountNumber">Receiver Account Number</label>
            <input type="text" id="receiverAccountNumber" name="receiverAccountNumber" required>
            
            <label for="amount">Amount</label>
            <input type="number" id="amount" name="amount" required>
            
            <button type="submit">Transfer</button>
        </form>
    </div>
</body>
</html>
