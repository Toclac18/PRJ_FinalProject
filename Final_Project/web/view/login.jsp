<%-- 
    Document   : login
    Created on : Oct 28, 2023, 5:09:11 PM
    Author     : phuc2
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            body {
                background-image: url('https://scontent.fhan20-1.fna.fbcdn.net/v/t39.30808-6/406521693_734027775422155_752419846096021373_n.jpg?stp=cp6_dst-jpg&_nc_cat=104&ccb=1-7&_nc_sid=3635dc&_nc_eui2=AeGc0YRRf9rrVx09LCDuSoYH7MTZRk1ywFnsxNlGTXLAWYpCPMVXRUy-28M_H99srd7HHLYmxvi5zGW2CLuiA5WA&_nc_ohc=YebHGMf4jFYAX9UpZ0t&_nc_ht=scontent.fhan20-1.fna&oh=00_AfCtv5TDOSb-DtdAB3DQhQX54jGI0a_aC14tvNPUkw6WCg&oe=65EA9E13');
                background-size: 1500px;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            form {
                background-color: #ccc;
                padding: 60px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.9);
                text-align: center;
            }

            h1 {
                /*border: 5px solid;*/
                color: darkblue;
                font-size: 30px;

            }

            .form-group {
                margin-bottom: 20px;
                text-align: left;
            }

            .form-group label {
                display: flex;
                font-weight: bold;
                margin-bottom: 5px;
            }

            input[type="text"], input[type="password"] {
                width: calc(100% - 22px);
                padding: 10px;
                margin-bottom: 10px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 5px;
                display: inline-block;
            }

            input[type="submit"] {
                width: 100%;
                background-color: #4caf50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            form {
                background-color: rgba(255, 255, 255, 0.1); /* Màu trắng với độ trong suốt là  */
                padding: 60px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.05);
                text-align: center;
                width: 30%; /* Set the width to 30% */
                margin: 10% auto; /* Center the form horizontally */
                margin-left: 530px;
            }
        </style>

    </head>
    <body>

        <form action="login" method="post">
            <h1>ENTER YOUR FPT ACCOUNT</h1>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <p style="color: #0055CC">${requestScope.invalid}</p>
            <input style="color: #4caf50"; type="checkbox" name="remember" value="remember"/> Remember in this computer.
            <input type="submit" name="login" value="Login" style="position: inherit">
        </form>


    </body>

</html>