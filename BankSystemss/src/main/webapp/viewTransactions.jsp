<%@ page import="com.BS.BankSystemss.DAO" %>
<%@ page import="com.BS.BankSystemss.TransactionRecord" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Transactions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #2c3e50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #3498db;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
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
    <div class="container">
        <%
            // Retrieve the account number from request parameters (you may want to adjust this based on your actual setup)
            String accountNumberStr = request.getParameter("accountNumber");

            if (accountNumberStr == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            Integer userAccountNumber = Integer.parseInt(accountNumberStr);
            List<TransactionRecord> transactionRecords = DAO.getTransactionsByAccountNumber(userAccountNumber);
        %>
        <h1>Your Transactions</h1>
        <% if (transactionRecords != null && !transactionRecords.isEmpty()) { %>
            <table>
                <thead>
                    <tr>
                        <th>Transaction ID</th>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Amount</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (TransactionRecord record : transactionRecords) { %>
                        <tr>
                            <td><%= record.getId() %></td>
                            <td><%= record.getDate() %></td>
                            <td><%= record.getType() %></td>
                            <td><%= record.getAmount() %></td>
                            <td><%= record.getDescription() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <p>No transactions found.</p>
        <% } %>
        <a href="dashboard.jsp">Go to Dashboard</a>
    </div>
</body>
</html>
