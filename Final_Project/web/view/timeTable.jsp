<%-- 
    Document   : timeTable
    Created on : Oct 11, 2023, 12:24:52 PM
    Author     : phuc2
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
/*            body {
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                display: flex;
                 Thiết lập hình ảnh làm background 
                background-image: url('https://timdung.vn/sites/default/files/styles/220x165/public/dai_hoc_fpt_3.jpg?itok=SPzVCUdf');  Thay 'QUANNT' bằng đường dẫn đến ảnh của bạn 
                background-size: cover;  Đảm bảo kích thước ảnh phủ toàn bộ background 
                background-position: center;  Căn giữa ảnh trong phần tử 
                 Thêm hiệu ứng blur 
                filter: blur(5px); /* Điều chỉnh mức độ blur tùy thích 
            }*/
            body {
                margin: 0;
                padding: 0;
                background-color: #337ab7;
                display: flex;
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
                background-color: #337ab7;
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
                background-color: #45a049;
            }

            /* Style for table headers in the second row */
            th:nth-child(n+2) {
                text-align: center;
                background-color: #45a049;
            }

            /* Style for table cells */
            td {
                text-align: center;
                border: 1px solid #ddd;
                padding: 8px;
            }

            /* Style for the selected option in the dropdown */
            select option[selected="selected"] {
                font-weight: bold;
                color: blue;
            }

            /* Style for the links in the table cells */
            a {
                text-decoration: none;
                color: blue;
            }

            /* Style for labels with the "label" class */
            .label {
                padding: 2px 5px;
                border-radius: 3px;
                font-size: 12px;
            }

            /* Style for the "label-warning" class */
            .label-warning {
                background-color: #f0ad4e;
                color: #fff;
            }

            /* Style for the "label-primary" class */
            .label-primary {
                background-color: #337ab7;
                color: #fff;
            }

            /* Style for the "label-success" class */
            .label-success {
                background-color: #5cb85c;
                color: #fff;
            }
            #header {
                display: flex;
                align-items: center; /* Căn giữa theo chiều dọc */
                justify-content: space-between; /* Căn cách hai phần tử */
                padding:20px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
                background-color: #FFA500;
                margin-bottom: 30px;
            }
            #account{
                display: flex;
                margin: 15px;
                cursor: pointer; /* Biến con trỏ thành bàn tay khi di chuột qua */
                transition: background-color 0.3s;
            }
            #main-content{
                background-color: #fff;
                padding:10px;
                border-radius: 20px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                margin: 0 20px;
            }


        </style>
    </head>
    <body>
        <div id="menu-container">
            <a href="home">
                <img src="images/DHFPTLOGO.png" width="250" height="150" alt="alt"/>
            </a>
            <hr>

            <ul>
                <li><a href="home">Home</a></li>
                <br>
                <li>
                    <a href="timetable?id=${sessionScope.instructor.id}">Weekly timetable</a></li>
                <br>
                <li><a href="report"> Attendance Report</a></li>
                <br>
                
                <!-- Thêm các mục menu khác tại đây -->
            </ul>
        </div>
        <div id="content">
            <div id="header">
                <h2>FPT University Academic Portal</h2>
                <div id="account">
                    <c:if test="${not empty sessionScope.account}">
                        ${sessionScope.account.displayname}(<a href="logout">Logout</a>) 
                    </c:if>
                    <c:if test="${empty sessionScope.account}">
                        You are not logged in (<a href="login">Login</a>)
                    </c:if>
                </div>
            </div>

            <div id="main-content">

                <h2> Weekly Timetable </h2>
                <table>
                    <thead>
                        <tr>
                            <th rowspan="2">
                                <form id="timetable" action="timetable" method="GET">
                                    <input type="hidden" name="id" value="${param.id}"/>
                                    Week: <input type="week" id="weekInput" name="weekInput" required
                                                onchange="document.getElementById('timetable').submit();">
                                    <br>

                                </form>
                            </th>
                            <th align="center">Mon</th>
                            <th align="center">Tue</th>
                            <th align="center">Wed</th>
                            <th align="center">Thu</th>
                            <th align="center">Fri</th>
                            <th align="center">Sat</th>
                            <th align="center">Sun</th>
                        </tr>

                        <tr>
                            <c:forEach items="${requestScope.dates}" var="d">
                                <th align="center">
                                    ${d}
                                </th>
                            </c:forEach>


                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${requestScope.slots}" var="s" varStatus="loop">
                            <tr>
                                <td>Slot ${s.id}<br>${s.description}</td>
                                    <c:forEach items="${requestScope.dates}" var="d">
                                    <td>
                                        <c:forEach items="${requestScope.sessions}" var="k">
                                            <c:if test="${k.date eq d and k.timeSlot.id eq s.id}">
                                                <a href="takeattendance?id=${k.id}">
                                                    ${k.group.name}<br>${k.group.subject.name}<br>${k.room.id}
                                                    <c:if test="${k.isAtt}">
                                                        (attended)
                                                    </c:if>
                                                    <c:if test="${!k.isAtt}">
                                                        (not yet)
                                                    </c:if>
                                                </a>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                </c:forEach>
                            </tr>
                        </c:forEach>


                    </tbody>
                </table>

            </div>
        </div>
    </body>
</html>
