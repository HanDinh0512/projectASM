<%-- 
    Document   : lecturerinformation
    Created on : Mar 19, 2024, 9:08:04 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lecturer Information</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .button1 {
                position: fixed;
                top: 20px;
                right: 20px;
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
                outline: none;
                color: #fff;
                background-color: #007bff;
                border: none;
                border-radius: 5px;
                box-shadow: 0 5px #0069d9;
            }

            .button1:hover {
                background-color: #0056b3;
            }

            .button1:active {
                background-color: #0056b3;
                box-shadow: 0 3px #004286;
                transform: translateY(2px);
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
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
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                width: 100%;
            }
            h2 {
                color: #333;
                margin-bottom: 20px;
                text-align: center;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                width: 40%;
                font-weight: bold;
                color: #555;
            }
            td {
                color: #333;
            }
        </style>
    </head>
    <body >
        <form action="lecturerhome">
            <button class="button1">Home</button>
        </form>
        <div class="container">
            <h2>Lecturer Information</h2>
            <table>
                <tbody>
                    <tr>
                        <th>Lecturer ID:</th>
                        <td><c:out value="${requestScope.lecturer.lid}" /></td>
                    </tr>
                    <tr>
                        <th>Lecturer name:</th>
                        <td><c:out value="${requestScope.lecturer.truename}" /></td>
                    </tr>
                    <tr>
                        <th>Date of birth:</th>
                        <td><c:out value="${requestScope.lecturer.dob}" /></td>
                    </tr>
                    <tr>
                        <th>FAP name:</th>
                        <td><c:out value="${requestScope.lecturer.lname}" /></td>
                    </tr>
                    <tr>
                        <th>Gender:</th>
                        <td>
                            <c:if test="${requestScope.lecturer.gender}">
                                Male
                            </c:if>
                            <c:if test="${!requestScope.lecturer.gender}">
                                Female
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>Email:</th>
                        <td><c:out value="${requestScope.lecturer.email}" /></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
