<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>News Information</title>
        <style>
            /* Global styles */
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }

            /* News article styles */
            .news-article {
                max-width: 800px;
                margin: 40px auto;
                padding: 20px;
                background-color: #f9f9f9;
                border: 1px solid #ddd;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .news-article h2 {
                font-size: 24px;
                margin-top: 0;
            }

            .news-article.meta {
                font-size: 16px;
                color: #666;
                margin-bottom: 20px;
            }

            .news-article.content {
                font-size: 18px;
                line-height: 1.5;
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
        <form action="studenthome">
            <button class="button1">Home</button>
        </form>
        <div class="news-article">
            <h2>${requestScope.n.name}</h2>
            <div class="meta">
                Posted in ${requestScope.n.time}
            </div>
            <div class="content">
                <p>${requestScope.n.content}</p>
            </div>
        </div>
    </body>
</html>