<%-- 
    Document   : viewattend
    Created on : Mar 12, 2024, 10:04:52 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
            }
            .container {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
            }
            .table-container {
                flex-basis: 30%;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            a {
                text-decoration: none;
                color: #333;
            }
            a:hover {
                color: #666;
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
        <form action="studenthome">
            <button class="button1">Home</button>
        </form>
        <div class="container">
            <div class="table-container">
                <h2>Term</h2>
                <table>
                    <tr>
                        <th>Term</th>
                    </tr>
                    <c:forEach items="${requestScope.term}" var="t">
                        <tr>
                            <td><a href="viewattend?id=${requestScope.sid}&term=${t.tid}">${t.tid}</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <div class="table-container">
                <c:if test="${not empty requestScope.termid}">
                    <h2>Subject</h2>
                    <table>
                        <tr>
                            <th>Subject</th>
                        </tr>
                        <c:forEach items="${requestScope.groups}" var="s">
                            <tr>
                                <td><a href="viewattend?id=${requestScope.sid}&term=${requestScope.termid}&gid=${s.gid}">${s.subject.subname} - ${s.gname}</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
        </div>

        <%-- Bảng Grade (nếu đã chọn Term và Subject) --%>
        <c:if test="${not empty requestScope.gid}">
            <div class="table-container">
                <h2>Attendance Information</h2>
                <table>
                    <tr>
                        <th>DATE</th>
                        <th>SLOT</th>
                        <th>ROOM</th>
                        <th>LECTURER</th>
                        <th>GROUP NAME</th>
                        <th>STATUS</th>
                        <th>COMMENT</th>
                    </tr>
                    <c:forEach items="${requestScope.atts}" var="a">
                        <tr>
                            <td>${a.ses.date}</td>
                            <td>${a.ses.slot.tid}</td>
                            <td>${a.ses.room.rnumber}</td>
                            <td>${a.ses.lecturer.lname}</td>
                            <td>${a.ses.group.gname}</td>
                            <td><c:if test="${a.ses.isTaken}">
                                    <c:if test="${a.isPresent}">Present</c:if>
                                    <c:if test="${!a.isPresent}">Absent</c:if>
                                </c:if>
                                <c:if test="${!a.ses.isTaken}">
                                    Future
                                </c:if></td>
                            <td>${a.description}</td>
                        </tr>
                    </c:forEach>

                    <tr>

                        <td colspan="7"><strong>ABSENT: ${requestScope.absentPercent}% ABSENT SO FAR (${requestScope.countAbsent} ABSENT ON TOTAL ${requestScope.totalSes}).</strong></td>                    
                    </tr>
                </table>

            </div>
        </c:if>

    </body>
</html>
