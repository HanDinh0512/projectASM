<%-- 
    Document   : takeattendance
    Created on : Mar 2, 2024, 8:01:06 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="attendance" method="POST">
            <input type="hidden" name="id" value="${requestScope.id}" />
            <input type="hidden" value="${requestScope.sub}" name ="sub"/>
            <input type="hidden" value="${requestScope.date}" name ="date"/>
            <input type="hidden" value="${requestScope.slot}" name ="slot"/>
            <table border="1px">
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Presented</td>
                    <td>Note</td>
                    <td>Time</td>
                </tr>
                <c:forEach items="${requestScope.atts}" var="a">
                    <tr>
                        <td>${a.student.sid}</td>
                        <td>${a.student.name}</td>
                        <td>
                            <input type="radio" 
                                   ${!a.isPresent?"checked=\"checked\"":""}
                                   name="present${a.student.sid}" value="no"/> No
                            <input type="radio" 
                                   ${a.isPresent?"checked=\"checked\"":""}
                                   name="present${a.student.sid}" value="yes"/> Yes
                        </td>
                        <td>
                            <input type="text" name="description${a.student.sid}" value="${a.description}"/>
                        </td>
                        <td>${a.time}</td>
                    </tr>    
                </c:forEach>
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
