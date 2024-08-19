<%@ page import="com.BS.BankSystemss.DAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deposit Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .message {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 80%;
            max-width: 500px;
        }
        .message h1 {
            color: #2c3e50;
        }
        .message p {
            color: #7f8c8d;
            font-size: 16px;
        }
        .message .error {
            color: #e74c3c;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s, transform 0.3s;
        }
        a:hover {
            background: #2980b9;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="message">
        <%
            String accountNumberStr = request.getParameter("accountNumber");
            String amountStr = request.getParameter("amount");

            if (accountNumberStr == null || amountStr == null) {
        %>
                <div class="error">
                    <h1>Missing Parameters</h1>
                    <p>Error: Account number and amount are required.</p>
                </div>
        <%
            } else {
                try {
                    Integer accountNumber = Integer.parseInt(accountNumberStr);
                    long amount = Long.parseLong(amountStr);

                    if (accountNumber <= 0 || amount <= 0) {
                        throw new IllegalArgumentException("Account number and amount must be positive.");
                    }

                    // Assuming DAO is a static method
                    DAO.deposit(accountNumber, amount);
        %>
                    <h1>Deposit Successful</h1>
                    <p>Your deposit of <%= amount %> to account number <%= accountNumber %> was successful.</p>
        <%
                } catch (NumberFormatException e) {
        %>
                    <div class="error">
                        <h1>Invalid Input</h1>
                        <p>Error: Please enter valid numbers for account number and amount.</p>
                    </div>
        <%
                    e.printStackTrace();
                } catch (IllegalArgumentException e) {
        %>
                    <div class="error">
                        <h1>Invalid Value</h1>
                        <p>Error: <%= e.getMessage() %></p>
                    </div>
        <%
                    e.printStackTrace();
                } catch (Exception e) {
        %>
                    <div class="error">
                        <h1>Error</h1>
                        <p>Error: <%= e.getMessage() %></p>
                    </div>
        <%
                    e.printStackTrace();
                }
            }
        %>
        <a href="dashboard.jsp">Go to Dashboard</a>
    </div>
</body>
</html>
