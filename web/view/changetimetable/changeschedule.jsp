<%-- 
    Document   : changeschedule
    Created on : Mar 18, 2024, 9:49:36 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Schedule</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .container {
                display: flex;
                justify-content: space-between;
                margin: 20px;
            }
            .table-container {
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-right: 20px;
                flex-grow: 1;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover {
                background-color: #f2f2f2;
            }
            h2 {
                margin-top: 0;
            }
            form {
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }
            input[type="date"],
            input[type="text"],
            select {
                width: 100%;
                padding: 10px;
                margin: 5px 0;
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
        <div class="container">
            <!-- Bảng Class Information -->
            <div class="table-container">
                <h2>Class Information</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Class Name</th>
                            <th>Subject</th>
                            <th>Term</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.groups}" var="g">
                            <tr>
                                <td><a href="changeschedule?id=${requestScope.lid}&gid=${g.gid}">${g.gname}</a></td>
                                <td>${g.subject.subname}</td>
                                <td>${g.term}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Bảng Session Information -->
            <div class="table-container">
                <c:if test="${not empty requestScope.gid}">
                    <h2>Session Information</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Slot</th>
                                <th>Class Name</th>
                                <th>Date</th>
                                <th>Room</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.sessions}" var="s">
                                <tr>
                                    <td>${s.slot.tid}</td>
                                    <td>${s.group.gname}</td>
                                    <td>${s.date}</td>
                                    <td>${s.room.rnumber}</td>
                                    <td><a href="changeschedule?id=${requestScope.lid}&gid=${s.group.gid}&sesid=${s.sesid}">SELECT</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>

        <!-- Bảng Selected Session Information và Form New Session Information -->
        <c:if test="${not empty requestScope.sesid}">
            <div class="container" style="margin-top: 20px;">
                <!-- Bảng Selected Session Information -->
                <div class="table-container">
                    <h2>Selected Session Information</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Slot</th>
                                <th>Class Name</th>
                                <th>Date</th>
                                <th>Room</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${requestScope.ses.slot.tid}</td>
                                <td>${requestScope.ses.group.gname}</td>
                                <td>${requestScope.ses.date}</td>
                                <td>${requestScope.ses.room.rnumber}</td>                        
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Form New Session Information -->
                <div class="table-container">
                    <form action="changeschedule" method="POST">
                        <input type="hidden" value="${requestScope.lid}" name="id"/>
                        <input type="hidden" value="${requestScope.gid}" name="gid"/>
                        <input type="hidden" value="${requestScope.sesid}" name="sesid"/>
                        <h2>New Session Information</h2>
                        <label for="slot">Slot:</label>
                        <select name="slot" id="slot">
                            <c:forEach items="${requestScope.slots}" var="sl">
                                <option value="${sl.tid}" <c:if test="${sl.tid eq requestScope.slot}">selected="selected"</c:if>>${sl.tid}</option>
                            </c:forEach>
                        </select>
                        <br>
                        <label for="date">Date:</label>
                        <input type="date" name="date" id="date" value="${requestScope.ses.date}"/><br>
                        <label for="lname">Lecturer Name:</label>
                        <input type="text" name="lname" id="lname" value="${requestScope.lname}"/><br>
                        <label for="room">Room:</label>
                        <input type="text" name="room" id="room" value="${requestScope.room}"/><br>
                        ${requestScope.ms}<br>
                        <button type="submit">Request</button> 
                    </form>
                </div>
            </div>
        </c:if>
    </body>
</html>
