<%@page import="com.BS.BankSystemss.DAO"%>
<%@page import="com.BS.BankSystemss.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Action</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #2c3e50;
            text-align: center;
        }
        .message {
            text-align: center;
            font-size: 18px;
            color: #7f8c8d;
        }
        .message.success {
            color: #27ae60;
        }
        .message.error {
            color: #c0392b;
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
        <h1>Account Registration</h1>
        <%
            try {
                Data d = new Data();
                String uid = request.getParameter("accountNumber");
                Integer accountNumber = Integer.parseInt(uid);

                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String phoneno = request.getParameter("phoneno");
                String gender = request.getParameter("gn");
                String balanceStr = request.getParameter("balance");
                long balance = Long.parseLong(balanceStr);

                d.setAccountNumber(accountNumber);
                d.setFname(fname);
                d.setLname(lname);
                d.setEmail(email);
                d.setPassword(password);
                d.setPhoneno(phoneno);
                d.setGender(gender);
                d.setBalance(balance);

                Integer ii = DAO.insert(d);
                if(ii > 0) {
                    out.println("<div class='message success'>Account Created Successfully</div>");
                } else {
                    out.println("<div class='message error'>Account Not Created</div>");
                }
            } catch (Exception e) {
                out.println("<div class='message error'>Error: " + e.getMessage() + "</div>");
                e.printStackTrace();
            }
        %>
        <a href="Register.jsp">Go Back</a>
    </div>
</body>
</html>
