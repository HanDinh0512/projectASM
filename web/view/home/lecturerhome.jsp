<%-- 
    Document   : lecturerhome
    Created on : Feb 28, 2024, 3:57:38 PM
    Author     : admin
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to FAP FPT University</title>
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
        
        <div class="button-container">
            <a href="<%=request.getContextPath()%>/lecturertimetable?id=${requestScope.lecturerid}" class="button">View Timetable</a>
            <a href="<%=request.getContextPath()%>/takegrade?id=${requestScope.lecturerid}" class="button">Grade</a>
            <a href="<%=request.getContextPath()%>/changeschedule?id=${requestScope.lecturerid}" class="button">Change teaching schedule</a>
            <a href="<%=request.getContextPath()%>/viewrequest?id=${requestScope.lecturerid}" class="button">View Request</a>
            <a href="<%=request.getContextPath()%>/requestreceived?id=${requestScope.lecturerid}" class="button">Request Received</a>
            <a href="<%=request.getContextPath()%>/lecturerinfo?id=${requestScope.lecturerid}" class="button">Lecturer Information</a>
        </div>
    </div>
</body>
</html>
