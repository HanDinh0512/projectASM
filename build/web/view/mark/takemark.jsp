<%-- 
    Document   : takemark
    Created on : Mar 5, 2024, 10:49:46 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                Class Information
            </tr>
            <c:forEach items="${requestScope.groups}" var="g">
                <tr>
                    <td><a href="takegrade?id=${requestScope.lid}&gid=${g.gid}">${g.gname} - ${g.subject.subname} - ${g.term}</td>
                </tr>
            </c:forEach>
        </table>
        <table>
            <tr>
                Course Information
            </tr>
            <tr>
                <td>Grade items</td>
                <td>Weight</td>
                <td></td>
            </tr>
            <c:forEach items="${requestScope.takens}" var="taken">
                <tr>
                    <td>${taken.assessment.name}</td>
                    <td><fmt:formatNumber value="${taken.assessment.weight}" type="number" pattern="#%" /></td>
                    <c:if test="${taken.isTaken}">
                        <td><a href="takegrade?id=${requestScope.lid}&gid=${taken.group.gid}&assid=${taken.assessment.assid}">Edit</td>
                    </c:if>
                    <c:if test="${!taken.isTaken}">
                        <td><a href="takegrade?id=${requestScope.lid}&gid=${taken.group.gid}&assid=${taken.assessment.assid}">Take</td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
        
        
    </body>
</html>
