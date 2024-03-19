<%-- 
    Document   : lecturertimetable
    Created on : Mar 2, 2024, 3:15:14 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lecturer Timetable</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }
            form {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }
            form input[type="date"], form input[type="submit"] {
                margin-right: 10px;
                padding: 8px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            td form {
                margin: 0;
            }
            td form input[type="submit"] {
                padding: 5px 10px;
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
        <form action="lecturertimetable" method="POST">
            <input type="hidden" value="${param.id}" name="id"/>
            <label for="from">From:</label>
            <input type="date" id="from" name="from" value="${requestScope.from}"/>
            -
            <label for="to">To:</label>
            <input type="date" id="to" name="to" value="${requestScope.to}"/>
            <input type="submit" value="View"/>
        </form>

        <table>
            <tr>
                <td></td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                        (<fmt:formatDate pattern="E" value="${d}" />)
                        ${d}
                    </td>
                </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>Slot ${slot.tid}<br>(${slot.timeStart} - ${slot.timeEnd})</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${ses.date eq d and ses.slot.tid eq slot.tid}">
                                    ${ses.group.gname} - ${ses.group.subject.subname} - ${ses.room.rnumber}<br/>
                                    <form action="attendance" method="GET">
                                        <input type="hidden" value="${ses.sesid}" name="id"/>
                                        <input type="hidden" value="${ses.group.subject.subname}" name ="sub"/>
                                        <input type="hidden" value="${ses.date}" name ="date"/>
                                        <input type="hidden" value="${ses.slot.tid}" name ="slot"/>
                                        <c:choose>
                                            <c:when test="${ses.isTaken}">
                                                <input type="submit" value="Edit">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="submit" value="Take">
                                            </c:otherwise>
                                        </c:choose>
                                    </form>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

