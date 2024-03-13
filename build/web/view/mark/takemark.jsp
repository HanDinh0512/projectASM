<%-- 
    Document   : takemark
    Created on : Mar 5, 2024, 10:49:46 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Grade Management</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .container {
                display: flex;
                margin-bottom: 20px;
            }
            .container table {
                width: 50%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #f5f5f5;
            }
            .button {
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 5px;
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
        <h1>Grade Management</h1>
        <form action="lecturerhome">
            <button class="button1">Home</button>
        </form>
        <div class="container">
            <div>                
                <table>
                    <h2>Class Information</h2>
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
                                <td><a href="takegrade?id=${requestScope.lid}&gid=${g.gid}">${g.gname}</a></td>
                                <td>${g.subject.subname}</td>
                                <td>${g.term}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div>

                <table>
                    <h2>Course Information</h2>
                    <thead>
                        <tr>
                            <th>Grade items</th>
                            <th>Weight</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.takens}" var="taken">
                            <tr>
                                <td>${taken.assessment.name}</td>
                                <td><fmt:formatNumber value="${taken.assessment.weight}" type="number" pattern="#%" /></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${taken.isTaken}">
                                            <a href="takegrade?id=${requestScope.lid}&gid=${taken.group.gid}&assid=${taken.assessment.assid}" class="button">Edit</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="takegrade?id=${requestScope.lid}&gid=${taken.group.gid}&assid=${taken.assessment.assid}" class="button">Take</a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>


        </div>

        <c:if test="${not empty requestScope.assid}">
            <h2>Grade Information</h2>
            <form action="takegrade?id=${requestScope.lid}&assid=${requestScope.assid}&gid=${requestScope.gid}" method="POST">
                <table>
                    <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Name</th>
                            <th>Score</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.grades}" var="gr">
                            <tr>
                                <td>${gr.student.sid}</td>
                                <td>${gr.student.name}</td>
                                <td><input type="text" name="grade${gr.student.sid}&${gr.group.gid}&${requestScope.assid}" value="${gr.score}" /></td>
                                <td><input type="text" name="des${gr.student.sid}&${gr.group.gid}&${requestScope.assid}" value="${gr.des}" /></td>
                            </tr>
                        <input type="hidden" name="grade${gr.student.sid}" value="${gr.student.sid}"/>
                    </c:forEach>
                    </tbody>
                </table>
                <input type="submit" value="SAVE" class="button"/>
            </form>
        </c:if>
    </body>
</html>
