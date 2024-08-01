<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Task Duration</title>
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
            padding: 6px 12px;
            transition: background-color 0.3s, transform 0.3s;
            border-radius: 15px;
        }

        .nav-links a:hover {
            background-color: #2a4d52; /* Darker shade */
            transform: translateY(-2px);
        }

        .logout {
            text-decoration: none;
            color: white;
            font-weight: bold;
            padding: 6px 12px;
            border-radius: 15px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .logout:hover {
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

        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        input[type="number"]:focus,
        select:focus {
            border-color: #3c6e71; /* Highlight color */
            outline: none;
        }

        /* Radio Group Styling */
        .radio-group {
            display: flex;
            justify-content: space-between;
            align-items: center; /* Center items vertically */
            margin-bottom: 15px;
        }

        .radio-group label {
            display: flex;
            align-items: center;
            font-weight: normal;
            margin-right: 20px; /* Spacing between radio buttons */
        }

        .radio-group input[type="radio"] {
            margin-right: 10px; /* Space between radio button and label text */
            transform: scale(1.2);
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

        div#totalDuration {
            text-align: center;
            margin-top: 20px;
            font-size: 1.2em;
            color: #092635;
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

            .navbar a {
                margin-top: 10px;
            }

            .radio-group {
                flex-direction: column;
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
    <script>
        function showTotalDuration() {
            var accountNumber = <%= request.getSession().getAttribute("accountNumber") %>;
            var selection = document.querySelector('input[name="selection"]:checked').value;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "<%= request.getContextPath() %>/register/EmployeeViewServlet", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("totalDuration").innerHTML = "Total Duration: " + xhr.responseText + " hours";
                }
            };
            xhr.send("accountNumber=" + accountNumber + "&selection=" + selection);
        }
    </script>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <a href="<%= request.getContextPath() %>/EmployeeDashboardServlet" class="logo">Employee Dashboard</a>
        <ul class="nav-links">
            <li><a href="<%= request.getContextPath() %>/LogutServlet" class="logout">Logout</a></li>
        </ul>
    </div>

    <!-- Container -->
    <div class="container">
        <h1>Welcome to your View Task Duration, <%= request.getSession().getAttribute("accountNumber") %>!</h1>
        <form>
            <div class="radio-group">
                <label for="daily">
                    <input type="radio" id="daily" name="selection" value="daily">
                    Daily
                </label>
                <label for="weekly">
                    <input type="radio" id="weekly" name="selection" value="weekly">
                    Weekly
                </label>
                <label for="monthly">
                    <input type="radio" id="monthly" name="selection" value="monthly">
                    Monthly
                </label>
            </div>
            <button type="button" onclick="showTotalDuration()">Calculate Total Duration</button>
        </form>
        <div id="totalDuration"></div>
    </div>
</body>
</html>
