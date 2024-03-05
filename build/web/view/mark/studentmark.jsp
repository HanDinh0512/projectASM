<%-- 
    Document   : studentmark
    Created on : Mar 5, 2024, 2:08:55 AM
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
        <title>Student Grade</title>
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
        </style>
    </head>
    <body>

        <div class="container">
            <div class="table-container">
                <h2>Term</h2>
                <table>
                    <tr>
                        <th>Term</th>
                    </tr>
                    <c:forEach items="${requestScope.term}" var="t">
                        <tr>
                            <td><a href="studentgrade?id=${requestScope.sid}&term=${t.tid}">${t.tid}</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <div class="table-container">
                <h2>Subject</h2>
                <c:if test="${not empty requestScope.termid}">
                    <table>
                        <tr>
                            <th>Subject</th>
                        </tr>
                        <c:forEach items="${requestScope.subjects}" var="s">
                            <tr>
                                <td><a href="studentgrade?id=${requestScope.sid}&term=${requestScope.termid}&subid=${s.subname}">${s.subname}</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
        </div>

        <%-- Bảng Grade (nếu đã chọn Term và Subject) --%>
        <c:if test="${not empty requestScope.subid}">
            <div class="table-container">
                <h2>Grade Information</h2>
                <table>
                    <tr>
                        <th>Grade item</th>
                        <th>Weight</th>
                        <th>Score</th>
                        <th>Description</th>
                    </tr>
                    <c:forEach items="${requestScope.grades}" var="g">
                        <tr>
                            <td>${g.assessment.name}</td>
                            <td><fmt:formatNumber value="${g.assessment.weight}" type="number" pattern="#%" /></td>
                            <td>${g.score}</td>
                            <td>${g.des}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <th>COURSE TOTAL</th>
                        <th>AVERAGE</th>
                        <th>${requestScope.totalcourse.total}</th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>STATUS</th>
                        <th>${requestScope.totalcourse.status}</th>
                    </tr>
                </table>
                
            </div>
        </c:if>

    </body>
</html>
