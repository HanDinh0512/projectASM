<%-- 
    Document   : lecturertimetable
    Created on : Mar 2, 2024, 3:15:14 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                margin: 20px;
            }
            form {
                margin-bottom: 20px;
            }
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2; /* Màu nền xám nhạt cho tiêu đề cột */
                color: #333; /* Màu chữ cho tiêu đề cột */
            }
        </style>
    </head>
    <body>
        <form action="lecturerhome">
            <button class="button1">Home</button>
        </form>
        <form action="lecturertimetable" method="POST">
            <input type="hidden" value="${param.id}" name="id"/>
            From: <input type="date" name="from" value="${requestScope.from}"/> -
            <input type="date" name="to" value="${requestScope.to}"/>
            <input type="submit" value="View"/>
        </form>
        <table border="1px">
            <tr>
                <td></td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                        (<fmt:formatDate pattern="E" value="${d}" />)
                        ${d}</td>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.tid}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${ses.date eq d and ses.slot.tid eq slot.tid}">
                                    ${ses.group.gname} - ${ses.group.subject.subname} - ${ses.room.rnumber}<br/>
                                    <c:if test="${ses.isTaken}">
                                        <form action="attendance" method="GET">
                                            <input type="hidden" value="${ses.sesid}" name="id"/>
                                            <input type="hidden" value="${ses.group.subject.subname}" name ="sub"/>
                                            <input type="hidden" value="${ses.date}" name ="date"/>
                                            <input type="hidden" value="${ses.slot.tid}" name ="slot"/>
                                            <input type="submit" value="Edit">
                                        </form>
                                        <%--<a href ="attendance?id=${ses.sesid}">Edit</a>
                                    <input type="hidden" value="${ses.group.subject.subname}" name ="sub"/>
                                    <input type="hidden" value="${ses.date}" name ="date"/>
<input type="hidden" value="${ses.slot.tid}" name ="slot"/>--%>
                                    </c:if>
                                    <c:if test="${!ses.isTaken}">
                                        <form action="attendance" method="GET">
                                            <input type="hidden" value="${ses.sesid}" name="id"/>
                                            <input type="hidden" value="${ses.group.subject.subname}" name ="sub"/>
                                            <input type="hidden" value="${ses.date}" name ="date"/>
                                            <input type="hidden" value="${ses.slot.tid}" name ="slot"/>
                                            <input type="submit" value="Take">
                                        </form>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
