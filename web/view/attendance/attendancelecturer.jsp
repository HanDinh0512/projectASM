<%-- 
    Document   : attendancelecturer
    Created on : Apr 22, 2024, 4:15:01 PM
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
            /* Global styles */
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }

            /* Table styles */
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #f0f0f0;
            }

            /* Attendance table styles */
            .attendance-table {
                margin-top: 20px;
            }

            .attendance-table th,.attendance-table td {
                text-align: center;
            }

            .attendance-table td {
                font-size: 18px;
            }

            .attendance-table td p {
                margin: 0;
            }

            .attendance-table td p.red {
                color: red;
            }

            .attendance-table td p.yellow {
                color: yellow;
            }

            .attendance-table td p.green {
                color: green;
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
        <h2>Subjects</h2>
        <table>
            <tr>
                <th>Subject</th>
            </tr>
            <c:forEach items="${requestScope.groups}" var="s">
                <tr>
                    <td><a href="attendancereport?id=${requestScope.lid}&gid=${s.gid}">${s.subject.subname} - ${s.gname}</a></td>
                </tr>
            </c:forEach>
        </table>

        <c:if test="${not empty requestScope.gid}">
            <h2>Attendance Report</h2>
            <table class="attendance-table">
                <tr>
                    <th>Slot</th>
                        <c:forEach items="${requestScope.slots}" var="sl">
                        <th>${sl}</th>
                        </c:forEach>
                </tr>
                <c:forEach items="${requestScope.students}" var="s">
                    <tr>
                        <td>${s.name}</td>
                        <c:forEach items="${s.attendances}" var="a">
                            <c:if test="${a.isPresent eq false}">
                                <td><p class="red">A</p></td>
                            </c:if>
                            <c:if test="${a.isPresent eq null}">
                                <td><p class="yellow">N</p></td>
                            </c:if>
                            <c:if test="${a.isPresent eq true}">
                                <td><p class="green">P</p></td>
                            </c:if>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
