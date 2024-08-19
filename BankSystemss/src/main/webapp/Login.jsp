<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style type="text/css">
 body {
    background-image: url("https://img.freepik.com/free-photo/organized-desk-with-copy-space_23-2148219270.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

center {
    background-color: rgba(255, 255, 255, 0.9);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #333;
    margin-bottom: 20px;
}

h2 {
    color: red;
}

table {
    border-collapse: collapse;
    width: 100%;
    max-width: 500px;
}

th, td {
    padding: 10px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

td input[type="text"], 
td input[type="password"] {
    width: calc(100% - 20px);
    padding: 8px;
    margin: 5px 0;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="submit"] {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

br {
    line-height: 10px;
}
</style>
</head>
<body>
<form action="LoginActions.jsp" method="post">
<center>
<h1>Welcome To Login Page</h1>
<table>
    <tr>
        <th>Email: </th><td><input type="text" name="email" placeholder="Email"></td>
    </tr>
    <tr>
        <th>Password: </th><td><input type="password" name="password" placeholder="******"></td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center;"><input type="submit" value="Login"></td>
    </tr>
    <%
        String msg = request.getParameter("msg");
        if ("invalid".equals(msg)) {
    %>
        <tr>
            <td colspan="2" style="text-align: center;"><h2>Invalid Email / Password</h2></td>
        </tr>
    <%
        }
    %>
</table>
</center>
</form>
</body>
</html>
