<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 20px;
            text-align: center;
        }
        .message {
            background-color: #dff0d8;
            color: #3c763d;
            padding: 20px;
            border-radius: 5px;
            display: inline-block;
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <%
        // Redirect directly to the login page or home page
        response.sendRedirect("Login.jsp");
    %>
    <div class="message">
        <h1>You have been logged out successfully!</h1>
        <p>Redirecting to the login page...</p>
    </div>
</body>
</html>
