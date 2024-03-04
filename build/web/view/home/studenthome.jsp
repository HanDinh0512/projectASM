<%-- 
    Document   : studenthome
    Created on : Feb 28, 2024, 3:57:29 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <title>Student Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Student Home</h1>
        <p>This is a beautiful student home page.</p>
        <a href="<%=request.getContextPath()%>/studenttimetable?id=${requestScope.studentid}" class="button">View Timetable</a><br/>
        <a href="<%=request.getContextPath()%>/studentgrade?id=${requestScope.studentid}" class="button">View Timetable</a><br/>
    </div>
</body>
</html>
