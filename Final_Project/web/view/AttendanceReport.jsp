<%-- 
    Document   : absentPercentage
    Created on : Oct 11, 2023, 12:22:16 PM
    Author     : phuc2
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                background-color: #ffffff;
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
                background-color: activeborder;
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
            /* Style the table */
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


            .table th, .table td {
                padding: 10px;
                text-align: center;
            }
            #header {
                background-color: #45a049;
                padding: 10px; /* Khoảng cách giữa nội dung và viền của header */
            }
            #header {
                /*                background-color: #0077FF;*/
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding:20px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
                margin-bottom: 30px;
            }


            #account{
                display: flex;
                margin: 15px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            #main-content{
                padding:10px;
                border-radius: 20px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
                background-color: rgba(255, 255, 255, 0.8);
                margin: 0 20px;
            }

            .no-underline a {
                text-decoration: none;
            }

            #export_btn {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                position: absolute;
                top: 190px;
                right:  105px;
                width: 125px;
                height: 45px;
                font-family: Arial, sans-serif;
                font-size: 16px;
                border-radius: 5px;
                transition: background-color 0.5s;
                cursor: pointer;
            }


            #export_btn:hover {
                background-color: #45a049;
            }

            .content {
                margin-left: 295px;
                height: 780px;
                width: 1200px;
                background-image: url('https://lh3.googleusercontent.com/V6fZ6nbxUCxDwGXFBoiRNw4q4w2wuD93rP7mxlP7PJDBYoo4ILAs8gspiBRtlXK7J1b3VhWUF29-40Ts3Fr0SiKKx3CUyQuseBTb4Acu73TBgDWmjIObwMdaHeaXRmsHdkGPWZ4rUfSN3bxmVEiwdAPVrjcBvryssNuiN821_dBOI0V2YYbsrzKaS9uds7mYLyKEmNMOxA');
                background-size: cover;
            }

        </style>
    </head>
    <body>

        <div id="menu-container">
            <a href="home">
                <img src="images/DHFPTLOGO.png" width="250px" height="150px" alt="alt"/>
            </a>
            <hr>
            <ul class="no-underline">
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
        <div class="content" >
            <div id="header" >
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
                <c:if test="${empty requestScope.sessions}">
                    <h2 style="margin: 50px 0">Attendance report</h2>
                </c:if>
                <c:if test="${not empty requestScope.sessions}">
                    <h2 style="margin: 50px 0"> Attendance report/ ${requestScope.sessions[0].group.name}/ ${requestScope.sessions[0].group.subject.name}</h2>
                </c:if>


                <form id="selectgroup" action="report" method="get">
                    Select group:
                    <select id="groupid" name="id" required>
                        <c:forEach items="${requestScope.groups}" var="g">
                            <option
                                <c:if test="${g.id eq param.id}">
                                    selected="selected"
                                </c:if>
                                value="${g.id}">${g.name}</option>
                        </c:forEach>

                    </select>
                    <input type="submit" value="select">
                </form>

                <button id="export_btn">Export PDF</button>

                <table class="table" id="table-id">

                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Code</th>
                            <th>Name</th>
                            <th>Percentage</th>
                                <c:forEach items="${requestScope.sessions}" var="s">
                                <th>Slot${s.index}</th>
                                </c:forEach>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.students}" var="st">
                            <c:set var="i" value="${i+1}"/>
                            <tr>
                                <td>${i}</td>
                                <td>${st.id}</td>
                                <td>${st.name}</td>
                                <c:if test="${requestScope.percent[i-1] > 20}">
                                    <td style="color:red"><fmt:formatNumber value="${percent[i-1]}" pattern="0.00"/>%</td>
                                </c:if>
                                <c:if test="${requestScope.percent[i-1] eq 20}">
                                    <td style="color:darkorange"><fmt:formatNumber value="${percent[i-1]}" pattern="0.00"/>%</td>
                                </c:if>
                                <c:if test="${requestScope.percent[i-1] < 20}">
                                    <td style="color:green"><fmt:formatNumber value="${percent[i-1]}" pattern="0.00"/>%</td>
                                </c:if>

                                <c:forEach items="${requestScope.attendances}" var="a">
                                    <c:if test="${a.student.id eq st.id}">
                                        <c:if test="${a.status}">
                                            <td style="color: green">${a.status?"attend":"absent"}</td>
                                        </c:if>
                                        <c:if test="${!a.status and a.session.isAtt}">
                                            <td style="color: red">${a.status?"attend":"absent"}</td>
                                        </c:if>
                                        <c:if test="${!a.status and !a.session.isAtt}">
                                            <td>-</td>
                                        </c:if>
                                    </c:if>
                                </c:forEach>

                            </tr>
                        </c:forEach>


                    </tbody>

                </table>








                <!--                <table id="export_table" style="display: block">
                
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Code</th>
                                            <th>Name</th>
                                            <th>Percentage</th>
                <c:forEach items="${requestScope.sessions}" var="s">
                <th>Slot${s.index}</th>
                </c:forEach>

        </tr>
    </thead>
    <tbody>
                <c:forEach items="${requestScope.students}" var="st">
                    <c:set var="i" value="${i+1}"/>
                    <tr>
                        <td>${i}</td>
                        <td>${st.id}</td>
                        <td>${st.name}</td>
                    <c:if test="${requestScope.percent[i-1] > 20}">
                        <td style="color:red"><fmt:formatNumber value="${percent[i-1]}" pattern="0.00"/>%</td>
                    </c:if>
                    <c:if test="${requestScope.percent[i-1] eq 20}">
                        <td style="color:darkorange"><fmt:formatNumber value="${percent[i-1]}" pattern="0.00"/>%</td>
                    </c:if>
                    <c:if test="${requestScope.percent[i-1] <20}">
                        <td style="color:green"><fmt:formatNumber value="${percent[i-1]}" pattern="0.00"/>%</td>
                    </c:if>

                    <c:forEach items="${requestScope.attendances}" var="a">
                        <c:if test="${a.student.id eq st.id}">
                            <c:if test="${a.status}">
                                <td style="color: green">${a.status?"attend":"absent"}</td>
                            </c:if>
                            <c:if test="${!a.status and a.session.isAtt}">
                                <td style="color: red">${a.status?"attend":"absent"}</td>
                            </c:if>
                            <c:if test="${!a.status and !a.session.isAtt}">
                                <td>-</td>
                            </c:if>
                        </c:if>
                    </c:forEach>

                </tr>
                </c:forEach>


            </tbody>

            </table>-->
            </div>

        </div>
        <script src="js/sheet.js" type="text/javascript"></script>
        <script src="js/sheet_1.js" type="text/javascript"></script>
    </body>
</html>
