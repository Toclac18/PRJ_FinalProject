<%-- 
    Document   : Home
    Created on : Oct 28, 2023, 5:11:45 PM
    Author     : phuc2
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body {
                margin: 0;
                padding: 0;
                display: flex;
                color: black;
            }

            #menu-container {
                position: fixed;
                background-color: #FFA500;
                width: 20%;
                height: 100%;
                padding: 20px;
                box-sizing: border-box;
                overflow-y: auto; /* Cho phép menu cuộn khi nội dung dài hơn */
            }

            #content {
                width: 80%;

                box-sizing: border-box;
                margin-left: 20%; /* Tạo khoảng cách giữa menu và nội dung chính */
            }

            ul {
                list-style-type: none;
                padding: 0;
            }

            li {
                margin: 5px 0;
                padding: 10px; /* Thêm đệm để tạo khoảng cách giữa các mục menu */
                background-color: #f2f2f2; /* Màu nền của mục menu */
                border-radius: 5px; /* Bo tròn góc của mục menu */
                cursor: pointer; /* Biến con trỏ thành bàn tay khi di chuột qua */
                transition: background-color 0.3s; /* Hiệu ứng chuyển đổi màu nền */
            }

            li:hover {
                background-color: #ddd; /* Màu nền khi di chuột qua */
            }
            /* Style for the table */
            table {
                border-collapse: collapse;
                width: 100%;
            }

            /* Style for table headers in the first row */
            th {
                text-align: center;
                background-color: #f2f2f2;
            }

            /* Style for table headers in the second row */
            th:nth-child(n+2) {
                text-align: center;
                background-color: #f2f2f2;
            }

            /* Style for table cells */
            td {
                text-align: center;
                border: 1px solid #ddd;
                padding: 8px;
            }
            #header {
                display: flex;
                align-items: center; /* Căn giữa theo chiều dọc */
                justify-content: space-between; /* Căn cách hai phần tử */
                padding:20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            }
            #account{
                display: flex;
                margin: 15px;
                cursor: pointer; /* Biến con trỏ thành bàn tay khi di chuột qua */
                transition: background-color 0.3s;
            }
            .no-underline a {
                text-decoration: none; /* Loại bỏ gạch chân của thẻ a */
                color: black;
            }

        </style>
    </head>
    <body>
        <div id="menu-container">
            <a href="home">
                <img src="images/DHFPTLOGO.png" width="250" height="150" alt="alt"/>
            </a>
            <hr>

            <ul class="no-underline">
                <li><a href="index.html">Home</a></li>
                <br>
                <li>
                    <a href="timetable?id=${sessionScope.instructor.id}">Weekly timetable</a></li>
                <br>
                <li><a href="report"> Attendance Report</a></li>
                <br>
                
                <!-- Thêm các mục menu khác tại đây -->
            </ul>
        </div>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPT University Academic Portal</title>
        <style>
            #content {
                width: 100%;
                height: 100%;
                background-image: url("images/FPT-Hanoi.jpg");
                background-size: cover;
                background-position: center;
            }

            #header {
                position: relative;
                z-index: 2;
                text-align: center;
                padding: 20px;
                color: white;
            }

            #header h2 {
                font-size: 36px;
                font-weight: bold;
            }
        </style>
    </head>
    <div id="content">
        <div id="header">
            <span style="color:orange ; font-size: 35px;">
                FPT University Academic Portal
            </span>
            <div id="account">
                <c:if test="${not empty sessionScope.account}">
                    ${sessionScope.account.displayname}(<a href="logout">Logout</a>) 
                </c:if>
                <c:if test="${empty sessionScope.account}">
                    <span id="login">
                        <a href="login" style="color: white; text-decoration:none ;">LOGIN</a>
                    </span>
                </c:if>
                <style>
                    #login {
                        color: black;
                        border: none;
                        position: absolute;
                        width: 130px;
                        height: 49px;
                        font-family: Arial, sans-serif;
                        font-size: 30px;
                        border-radius: 5px;
                        transition: background-color 0.5s;
                        cursor: pointer;
                        right: 100px;
                        top: 14px;
                        background-color: #337ab7;
                        text-align: center;
                        line-height: 49px;
                    }

                    #login:hover{
                        background-color: #FFA500;
                    }
                </style>
               
            </div>
        </div>

        <div id="main-content">
            <img src="images/FPT-Hanoi.jpg" alt="Centered Image" id="centered-image" width="1200" height="700">
        </div>
    </div>
</html>
