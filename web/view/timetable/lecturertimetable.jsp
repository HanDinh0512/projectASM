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
    </head>
    <body>

        <form action="lecturertimetable" method="GET">
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
