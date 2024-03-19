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
        <title>FAP FPT University</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 800px;
                margin: 20px auto;
                padding: 20px;
                background-color: #f0f8ff; /* Màu xanh lá nhạt */
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            h1 {
                margin-bottom: 20px;
            }
            .button-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }
            .button {
                display: inline-block;
                padding: 10px 20px;
                margin: 10px;
                background-color: #4CAF50; /* Màu xanh lá */
                color: white;
                text-align: center;
                text-decoration: none;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .button:hover {
                background-color: #45a049; /* Màu xanh lá nhạt khi di chuột */
            }
            .logout {
                float: right;
            }
        </style>
    </head>
    <body>
        <input type="button" value="Logout" class="button logout" onclick="window.location.href = 'logout'"/>
        <div class="container">
            <h1>Welcome to FAP FPT University</h1>
            <div  class="button-container">
                
                <a href="<%=request.getContextPath()%>/studenttimetable?id=${requestScope.studentid}" class="button">View Timetable</a><br/><br/>
                <a href="<%=request.getContextPath()%>/studentgrade?id=${requestScope.studentid}" class="button">Mark Report</a><br/><br/>
                <a href="<%=request.getContextPath()%>/viewattend?id=${requestScope.studentid}" class="button">Attendance Report</a><br/><br/>
                <a href="<%=request.getContextPath()%>/studentinfo?id=${requestScope.studentid}" class="button">Student Information</a><br/><br/>
            </div>
        </div>
    </body>

</html>
