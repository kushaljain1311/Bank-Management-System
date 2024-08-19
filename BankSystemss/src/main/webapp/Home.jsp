<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

h1 {
    color: #333;
    margin-bottom: 20px;
}

button {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    margin: 10px 0;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #0056b3;
}

button a {
    color: inherit;
    text-decoration: none;
}

button a:hover {
    text-decoration: none;
}

br {
    line-height: 10px;
}
</style>
</head>
<body>
<div class="container">
    <h1>Welcome to Apni Bank</h1>
    <button type="button"><a href="Register.jsp">Click to Register</a></button><br></br>
    <button type="button"><a href="Login.jsp">Click to Login</a></button><br></br>
</div>
</body>
</html>
