
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
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
            /* Apply basic styling to the table */
            .table {
                width: 100%;
                border-collapse: collapse;
            }

            /* Style the table caption */
            .caption {
                font-weight: bold;
                text-align: center;
                background-color: #f2f2f2;
                padding: 10px;
            }

            /* Style the table header (thead) */
            .table thead {
                background-color: #45a049;
                color: #fff;
            }

            .table th {
                padding: 10px;
            }

            /* Style table rows (tbody) */
            .table tbody tr {
                border-bottom: 1px solid #ddd;
            }

            /* Style alternating rows for better readability */
            .table tbody tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            /* Center align text in table cells */
            .table td {
                text-align: center;
                padding: 10px;
            }

            /* Style the comment input box */
            #comment-box {
                width: 100%;
                padding: 5px;
                border: 1px solid #ccc;
            }
            #header {
                display: flex;
                align-items: center; /* Căn giữa theo chiều dọc */
                justify-content: space-between; /* Căn cách hai phần tử */
                padding:20px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
                background-color: #fff;
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
            .cool-button {
                background-color: #0077FF;
                color: #FFFFFF;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                margin-left: 48%;
                margin-top: 10px;
            }

            /* Add a hover effect for the button */
            .cool-button:hover {
                background-color: #0055CC;
            }
            
            .no-underline a {
                text-decoration: none; /* Loại bỏ gạch chân của thẻ a */
            }

        </style>
    </head>
    <body>
        <div class="no-underline" id="menu-container">
            <a href="home">
                <img src="images/DH-FPT-4359-1612093890.jpg" width="250px" alt="alt"/>
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
                <h2 style="margin: 50px 0"> Take attendance/ ${requestScope.ses.group.name}/ ${requestScope.ses.group.subject.name}/Session no ${requestScope.ses.index}</h2>   
                <form action="takeattendance" method="POST">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Image</th>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Take attendance</th>
                                <th>Comment</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.atts}" var="a" varStatus="loop">
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>
                            <center>
                                <img src="images/ava${loop.index + 1}.jpg" style="height:146px;width:111px;border-width:0px;">
                            </center>
                            </td>
                            <td>${a.student.id}</td>
                            <td>${a.student.name}
                                <input type="hidden" name="stuid" value="${a.student.id}"/>
                            </td>
                            <td>
                                <input type="radio"
                                       <c:if test="${a.status}">
                                           checked="checked"
                                       </c:if>
                                       name="status${a.student.id}" value="present" />Attend
                                <input type="radio" 
                                       <c:if test="${!a.status}">
                                           checked="checked"
                                       </c:if>
                                       name="status${a.student.id}" value="absent" />Absent
                            </td>
                            <td>
                                <input type="text" value="${a.description}" name="description${a.student.id}" >
                            </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                    <input type="hidden" value="${requestScope.ses.id}" name="sesid"/>
                    <input type="submit" value="Save" class="cool-button"/>
                </form>
            </div>

        </div>
    </body>
</html>
