<%-- 
    Document   : viewrequest
    Created on : Mar 19, 2024, 2:14:24 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modern Table</title>
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
                padding: 10px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover {
                background-color: #f2f2f2;
            }
            .status-accepted {
                color: green;
            }
            .status-denied {
                color: red;
            }
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
        </style>
    </head>
    <body>
        <form action="lecturerhome">
            <button class="button1">Home</button>
        </form>
        <div class="container">
            <table>
                <tr>
                    <th>Lecturer To</th>
                    <th>Group</th>
                    <th>Subject</th>
                    <th>Date</th>
                    <th>Slot</th>
                    <th>Room</th>
                    <th>Status</th>
                    <th>Description</th>
                </tr>
                <c:forEach items="${requestScope.requests}" var="r">
                    <tr>
                        <td>${r.lecto.lname}</td>
                        <td>${r.group.gname}</td>
                        <td>${r.group.subject.subname}</td>
                        <td>${r.date}</td>
                        <td>${r.slot.tid}</td>
                        <td>${r.room.rnumber}</td>
                        <td class="<c:if test="${r.status}">status-accepted</c:if><c:if test="${r.responsed && !r.status}">status-denied</c:if>">
                            <c:choose>
                                <c:when test="${r.status}">Accepted</c:when>
                                <c:when test="${r.responsed && !r.status}">Denied</c:when>
                                <c:otherwise>Not Answered</c:otherwise>
                            </c:choose>
                        </td>
                        <td>${r.description}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>

