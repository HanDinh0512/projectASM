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
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #007bff;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            input[type="radio"] {
                margin-right: 5px;
            }
            input[type="text"] {
                width: 100%;
                padding: 5px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                margin-top: 10px;
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <form action="lecturerhome">
            <button class="button1">Home</button>
        </form>
        <h2>TAKE ATTENDANCE</h2><br/>

        <br/>
        <br/>
        <form action="attendance" method="POST">
            <input type="hidden" name="id" value="${requestScope.id}" />
            <input type="hidden" value="${requestScope.sub}" name="sub"/>
            <input type="hidden" value="${requestScope.date}" name="date"/>
            <input type="hidden" value="${requestScope.slot}" name="slot"/>
            <table>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Presented</th>
                    <th>Note</th>
                    <th>Time</th>
                </tr>
                <c:forEach items="${requestScope.atts}" var="a">
                    <tr>
                        <td>${a.student.sid}</td>
                        <td>${a.student.name}</td>
                        <td>
                            <input type="radio" id="present_yes_${a.student.sid}" name="present${a.student.sid}" value="yes" ${a.isPresent ? 'checked' : ''}/>
                            <label for="present_yes_${a.student.sid}">Yes</label>
                            <input type="radio" id="present_no_${a.student.sid}" name="present${a.student.sid}" value="no" ${!a.isPresent ? 'checked' : ''}/>
                            <label for="present_no_${a.student.sid}">No</label>
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
