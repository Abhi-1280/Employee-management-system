<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tasks Durations</title>
    
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Body Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            background-size: cover;
            position: relative;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.8);
            display: flex;
            flex-direction: column;
        }

        /* Navbar Styling */
        .navbar {
            background-color: #3c6e71; /* Updated color */
            padding: 20px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: relative;
            border-bottom-left-radius: 50px;
            border-bottom-right-radius: 50px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 1.4em;
            font-weight: bold;
            color: white;
        }

        .nav-links {
            list-style: none;
            display: flex;
            align-items: center;
        }

        .nav-links li {
            margin: 0 5px;
        }

        .nav-links a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            font-size: 1.0em;
            display: inline-block;
            padding: 10px 20px;
            transition: background-color 0.3s, transform 0.3s;
            border-radius: 20px;
        }

        .nav-links a:hover {
            background-color: #2a4d52; /* Darker shade */
            transform: translateY(-2px);
        }

        /* Container Styling */
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #3c6e71; /* Consistent color */
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus {
            border-color: #3c6e71; /* Highlight color */
            outline: none;
        }

        button[type="button"] {
            background-color: #3c6e71; /* Updated color */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            width: 100%;
            font-size: 1em;
        }

        button[type="button"]:hover {
            background-color: #2a4d52; /* Darker shade */
            transform: translateY(-2px);
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .container {
                width: 90%;
                padding: 15px;
            }

            .navbar {
                flex-direction: column;
                align-items: center;
            }

            .nav-links {
                flex-direction: column;
                align-items: center;
            }

            .nav-links li {
                margin: 5px 0;
            }
        }
        a{
        text-decoration: none;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <a href="<%= request.getContextPath() %>/EmployeeDashboardServlet" class="logo">Employee Dashboard</a>
        <ul class="nav-links">
            <li><a href="<%= request.getContextPath() %>/LogutServlet">Logout</a></li>
        </ul>
    </div>

    <!-- Container -->
    <div class="container">
        <h1>Welcome to your Tasks Duration, <%= request.getSession().getAttribute("accountNumber") %>!</h1>
        <form>
            <label for="chartType">Chart Type:</label>
            <select id="chartType">
                <option value="daily">Daily (Pie Chart)</option>
                <option value="weekly">Weekly (Bar Chart)</option>
                <option value="monthly">Monthly (Bar Chart)</option>
            </select>
            <button type="button" onclick="generateChart()">Generate Chart</button>
        </form>
        <div id="chart"></div>
    </div>

    <script>
        function generateChart() {
            var accountNumber = "<%= request.getSession().getAttribute("accountNumber") %>";
            var chartType = document.getElementById("chartType").value;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "<%= request.getContextPath() %>/register/EmployeeChartServlet", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var data = JSON.parse(xhr.responseText);
                    if (chartType === "daily") {
                        generatePieChart(data);
                    } else {
                        generateBarChart(data);
                    }
                }
            };
            xhr.send("employeeId=" + accountNumber + "&chartType=" + chartType);
        }

        function generatePieChart(data) {
            var options = {
                chart: {
                    type: 'pie'
                },
                series: data.map(item => item.value),
                labels: data.map(item => item.label)
            };

            var chart = new ApexCharts(document.querySelector("#chart"), options);
            chart.render();
        }

        function generateBarChart(data) {
            var options = {
                chart: {
                    type: 'bar'
                },
                series: [{
                    name: 'Hours',
                    data: data.map(item => item.value)
                }],
                xaxis: {
                    categories: data.map(item => item.label),
                    labels: {
                        rotate: -90
                    }
                }
            };

            var chart = new ApexCharts(document.querySelector("#chart"), options);
            chart.render();
        }
    </script>
</body>
</html>
