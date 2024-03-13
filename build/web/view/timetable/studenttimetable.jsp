<%-- 
    Document   : studentTimeTable
    Created on : Feb 29, 2024, 2:09:57 AM
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
        <form action="studenthome">
            <button class="button1">Home</button>
        </form>
        <form action="studenttimetable" method="GET">
        <input type="hidden" value="${param.id}" name="id"/>
        From: <input type="date" name="from" value="${requestScope.from}"/> -
        <input type="date" name="to" value="${requestScope.to}"/>
        <input type="submit" value="View"/>
    </form>
    <table>
        <tr>
            <th></th>
            <c:forEach items="${requestScope.dates}" var="d">
                <th>
                    (<fmt:formatDate pattern="E" value="${d}" />)
                    ${d}
                </th>
            </c:forEach>
        </tr>
        <c:forEach items="${requestScope.slots}" var="slot">
            <tr>
                <td>${slot.tid}</td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                        <c:forEach items="${requestScope.attendances}" var="att">
                            <c:if test="${att.ses.date eq d and att.ses.slot.tid eq slot.tid}">
                                ${att.ses.group.gname} - ${att.ses.group.subject.subname} <br/>
                                <c:if test="${att.ses.isTaken}">
                                    <c:if test="${att.isPresent}">Present</c:if>
                                    <c:if test="${!att.isPresent}">Absent</c:if>
                                </c:if>
                                <c:if test="${!att.ses.isTaken}">
                                    Not Yet
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
