<%-- 
    Document   : lecturerhome
    Created on : Feb 28, 2024, 3:57:38 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>FAP FPT University</title>
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
            .logout {
                position: absolute;
                top: 20px;
                right: 20px;
            }
        </style>
    </head>
    <body>
        <input type="button" value="Logout" class="button logout" onclick="window.location.href = 'logout'"/>
        <div class="container">
            <h1>Welcome to FAP FPT University</h1>
            <p>This is a beautiful lecturer home page.</p>
            <a href="<%=request.getContextPath()%>/lecturertimetable?id=${requestScope.lecturerid}" class="button">View Timetable</a>
            <br/>
            <br/>
            <a href="<%=request.getContextPath()%>/takegrade?id=${requestScope.lecturerid}" class="button">Grade</a>
        </div>
    </body>

</html>
