<%@ page import="com.BS.BankSystemss.DAO" %>
<%@ page import="com.BS.BankSystemss.Data" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Result</title>
<style>
    body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #f4f4f4;
    }
    .message {
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
</style>
</head>
<body>
    <div class="message">
        <%
            // Retrieve form parameters
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Check if the parameters are not null and not empty
            if (email != null && password != null && !email.trim().isEmpty() && !password.trim().isEmpty()) {
                try {
                    // Validate user
                    boolean login = DAO.login(email, password);

                    // Output the result
                    if (login) {
                    	// Fetch user data
                        Data user = DAO.getUserByEmail(email);
                        
                        // Store user data in session
                        HttpSession sessions = request.getSession();
                        sessions.setAttribute("user", user);

                        // Redirect to the dashboard
                        response.sendRedirect("dashboard.jsp");
                    } else {
                        out.println("<h1>Invalid email or password</h1>");
                    }
                } catch (Exception e) {
                    out.println("<h1>Error occurred during login</h1>");
                    out.println("<pre>" + e.getMessage() + "</pre>");
                    e.printStackTrace();
                }
            } else {
                out.println("<h1>Please enter both email and password</h1>");
            }
        %>
    </div>
</body>
</html>
