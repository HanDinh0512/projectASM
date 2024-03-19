<%-- 
    Document   : requestreceived
    Created on : Mar 19, 2024, 2:21:14 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modern Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            form {
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin: 20px auto;
                max-width: 800px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #f9f9f9;
            }
            select, input[type="text"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            button {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
            }
            button:hover {
                background-color: #45a049;
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
                width: 100px
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
        <form action="requestreceived" method="POST">
            <input type="hidden" value="${requestScope.lid}" name="id"/>
            <table>
                <thead>
                    <tr>
                        <th>Lecturer From</th>
                        <th>Group</th>
                        <th>Subject</th>
                        <th>Date</th>
                        <th>Slot</th>
                        <th>Room</th>
                        <th>Status</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.requests}" var="r">
                        <tr>
                            <td>${r.lecfrom.lname}</td>
                            <td>${r.group.gname}</td>
                            <td>${r.group.subject.subname}</td>
                            <td>${r.date}</td>
                            <td>${r.slot.tid}</td>
                            <td>${r.room.rnumber}</td>
                            <td>
                                <select name="status${r.id}">
                                    <option value="acc" <c:if test="${r.responsed && r.status}">selected="selected"</c:if>>Accept</option>
                                    <option value="den" <c:if test="${r.responsed && !r.status}">selected="selected"</c:if>>Denied</option>
                                    </select>
                                </td>
                                <td><input type="text" name="description${r.id}" value="${r.description}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <button type="submit">Save</button>
        </form>
    </body>
</html>
