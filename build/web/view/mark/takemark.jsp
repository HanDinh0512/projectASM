<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Grade Management</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                color: #333;
                padding: 0 20px;
            }

            h1, h2 {
                font-weight: normal;
                margin-top: 0;
                text-align: center;
            }

            a {
                color: #007bff;
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }

            .button {
                background-color: #007bff;
                border: none;
                color: white;
                padding: 5px 10px;
                text-align: center;
                text-decoration: none;
                outline: none;
                color: #fff;
                background-color: #007bff;
                border: none;
                border-radius: 5px;
                box-shadow: 0 5px #0069d9;
                font-size: 20px;
                width: 100px;
                height: 50px;
            }

            .container {
                max-width: 100%;
                margin: 20px auto;
                overflow: auto;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            input[type="text"] {
                width: 100%;
                padding: 5px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
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
                <h2>Class Information</h2>
                <table>
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

        </div>

        <c:if test="${not empty requestScope.gid}">
            <div>
                <form action="takegrade?id=${requestScope.lid}&assid=${requestScope.assid}&gid=${requestScope.gid}" method="POST">
                    <table>
                        <tr>
                            <th>Student ID</th>
                            <th>Student Name</th>
                                <c:forEach items="${requestScope.takens}" var="taken">
                                <th>${taken.assessment.name} - (<fmt:formatNumber value="${taken.assessment.weight}" type="number" pattern="#%" />)</th>
                            </c:forEach>
                        </tr>
                        <c:forEach items="${requestScope.students}" var="s">
                            <tr>
                                <td>${s.sid}</td>
                                <td>${s.name}</td>
                                <c:forEach items="${requestScope.grades}" var="g">
                                    <c:if test="${g.student.sid eq s.sid}">
                                        <td><input type="text" name="grade${g.student.sid}&${g.group.gid}&${g.assessment.assid}" value="${g.score}" /></td>
                                        </c:if>
                                    </c:forEach>
                            </tr>
                        </c:forEach>
                    </table><br>
                    <input type="submit" value="SAVE" class="button"/>
                    
                </form>
            </div>
        </c:if>
    </body>
</html>