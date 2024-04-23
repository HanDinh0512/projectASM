<%-- 
    Document   : studenthome
    Created on : Feb 28, 2024, 3:57:29 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>FAP FPT University</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f5f5f5;
            }
            .container {
                max-width: 800px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #333;
            }
            nav {
                margin-top: 30px;
                text-align: center;
            }
            ul {
                list-style-type: none;
                padding: 0;
                text-align: center;
                margin: 0;
            }
            li {
                display: inline-block;
                margin: 0 10px;
            }
            a {
                text-decoration: none;
                color: #007bff;
                font-weight: bold;
                transition: color 0.3s ease;
            }
            a:hover {
                color: #0056b3;
            }
            .logout {
                color: white;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                position: absolute;
                top: 10px;
                right: 50px;
            }
            .logout:hover::before {
                content: "Logout";
                position: absolute;
                top: 100%;
                left: 50%;
                transform: translateX(-50%);
                background-color: #333;
                color: white;
                padding: 5px;
                border-radius: 5px;
                opacity: 0;
                transition: opacity 0.3s;
            }
            .logout:hover::before {
                opacity: 1;
            }

            header {
                color: black;
                margin: 10px;
                text-align: center;
                font-size: 1.8em;
                font-weight: thin;
            }
            .header-fpt {
                background-color: #f1f1f1;
                text-align: center;
                padding: 10px;
            }
            .logo-header img {
                width: 150px;
            }
            .feedback {
                text-align: center;
                display: ${requestScope.count == 0 ? 'none' : 'block'};
            }
            .container-feedback {
                display: ${requestScope.count == 0 ? 'block' : 'none'};
            }
            .listFeature {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 10px;
                justify-content: center;
            }

            .listFeature ul {
                list-style-type: none;
                padding: 0;
            }

            .listFeature li {
                text-align: center;
                background-color: #f1f1f1;
                padding: 15px;
                border-radius: 5px;
                margin:20px;
            }

            .listFeature li a {
                text-decoration: none;
                color: #333;
                font-weight: bold;
                transition: color 0.3s ease;
            }

            .listFeature li a:hover {
                color: #007bff;
            }
            .welcome {
                background-color: #f1f1f1;
                padding: 20px;
                text-align: center;
            }

            .welcome h2 {
                margin: 0;
                padding: 0;
            }

            .notice {
                background-color: #4CAF50;
                width:15%;
                color: white;
                padding: 25px;
                text-align: center;
                margin-top: 20px;
                height:80px;
            }

            .notice a {
                border-radius:10px;
                background-color: orange;
                padding:15px;
                color: white;
                text-decoration: none;
                position: relative;
                top: 25px;

            }



            .notice a:hover {
                color: #f1f1f1;
            }

            .footer {
                position: relative;
                bottom: 0;
                background-color: #ef9926;
                color: white;
                font-weight: bold;
                text-align: center;
                padding: 20px;
                font-size: 20px;
            }
            .footer {
                height: 100px; /* Set a fixed height for the footer */
                background-color: #ef9926;
                color: white;
                font-weight: bold;
                text-align: center;
                padding: 20px;
                font-size: 20px;
                position: relative;
                margin-top: auto; /* Make the footer stick to the bottom */
            }
        </style>
    </head>
    <body>
        <div class="welcome">
            <h2>Welcome to FAP </h2>
        </div>
        
        <div class="notice">
            <span>XEM TIN TỨC MỚI</span><br/>
            <a class="noticeClick" href="<%=request.getContextPath()%>/news"> TẠI ĐÂY</a>
        </div>

        <div  class="container">
            <div class="header-fpt">
                <div class="logo-header">
                    <img src="img/logofpt.png" alt="logo" />
                </div>
                <div class="logout">
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 512 512"
                        width="35"
                        height="35"
                        fill="#808080"
                        onclick="logout()"
                        >
                    <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path
                        d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"
                        />
                    </svg>
                    <!--<input type="button" value="Logout" class="button logout" onclick="window.location.href = 'logout'"/>-->
                </div>
            </div>
            <nav>
                <ul class="listFeature">
                    <li>
                        <a href="<%=request.getContextPath()%>/studenttimetable?id=${requestScope.studentid}" class="button">View Timetable</a><br/><br/>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/studentgrade?id=${requestScope.studentid}" class="button">Mark Report</a><br/><br/>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/viewattend?id=${requestScope.studentid}" class="button">Attendance Report</a><br/><br/>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/studentinfo?id=${requestScope.studentid}" class="button">Student Information</a><br/><br/>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="footer">
            <p>FPT UNIVERSITY</p>
            <span>DAI HOC FPT HA NOI</span>
        </div>
        <script>
            function logout() {
                window.location.href = 'logout';
            }
        </script>
    </body>

</html>
