<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Employee Dashboard</title>
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
            background-color: #f7f7f7; /* Light background for better contrast */
            position: relative;
             /* Prevent horizontal scrolling */
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.8); /* Light white overlay */
            z-index: -1; /* Ensure it's behind other content */
        }

        /* Navbar Styling */
        .navbar {
            background-color: #3c6e71; /* Matching color from employeeadd page */
            padding: 20px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: relative;
            border-bottom-left-radius: 50px;
            border-bottom-right-radius: 50px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            z-index: 1; /* Above overlay */
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
            background-color: #354f52; /* Hover color matching the button */
            transform: translateY(-2px);
        }

        /* Container Styling */
        .container {
            max-width: 1000px;
            margin: 40px auto; /* Increased top margin for more space */
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.95); /* Light background for contrast */
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            color: #284b63; /* Text color matching the employeeadd page */
        }

        h1 {
            text-align: center;
            color: #284b63;
            margin-bottom: 20px;
        }

        p {
            text-align: center;
            color: #555;
            margin-bottom: 20px;
        }

        .buttons {
            margin-top: 20px;
            text-align: center;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .buttons .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            width: 250px;
            margin: 30px;
            background-color: rgba(255, 255, 255, 0.95); /* Light background for button containers */
            transition: transform 0.3s;
        }

        .buttons .button-container img {
            height: 150px;
            width: 200px;
            margin-bottom: 15px;
            border-radius: 8px;
        }

        .buttons .button-container a {
            background-color: #3c6e71; /* Matching color from employeeadd page */
            color: #fff;
            padding: 15px 20px;
            text-decoration: none;
            border-radius: 8px;
            text-align: center;
            width: 100%;
            font-size: 16px;
            margin: 10px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .buttons .button-container a:hover {
            background-color: #354f52; /* Hover color matching the button */
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .container {
                width: 90%;
                padding: 15px;
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
    <div class="overlay"></div>
    <nav class="navbar">
        <a href="<%= request.getContextPath() %>/EmployeeDashboardServlet" class="logo">Employee Dashboard</a>
        <ul class="nav-links">
            <li><a href="<%= request.getContextPath() %>/LogutServlet">Logout</a></li>
        </ul>
    </nav>

    <div class="container">
        <% if (request.getSession().getAttribute("loggedIn") != null && (boolean) request.getSession().getAttribute("loggedIn")) { %>
            <h1>Welcome to your Dashboard, <%= request.getSession().getAttribute("accountNumber") %>!</h1>
            <div class="buttons">
                <div class="button-container">
                    <img src="add.gif" alt="Add Task">
                    <a href="<%= request.getContextPath() %>/EmployeeAddTaskServlet">Add Task</a>
                </div>
                <div class="button-container">
                    <img src="chart.gif" alt="Charts">
                    <a href="<%= request.getContextPath() %>/EmployeeChartServlet">Charts</a>
                </div>
                <div class="button-container">
                    <img src="dur (2).gif" alt="View Task Duration">
                    <a href="<%= request.getContextPath() %>/EmployeeViewServlet">View Task Duration</a>
                </div>
                <div class="button-container">
                    <img src="edit.gif" alt="Edit Task">
                    <a href="<%= request.getContextPath() %>/EmployeeEditServlet">Edit Task</a>
                </div>
                <div class="button-container">
                    <img src="dele.gif" alt="Delete Task">
                    <a href="<%= request.getContextPath() %>/EmployeeDeleteServlet">Delete Task</a>
                </div>
                <div class="button-container">
                    <img src="view.gif" alt="View Task Details">
                    <a href="<%= request.getContextPath() %>/ViewDetailsServlet">View Task Details</a>
                </div>
            </div>
        <% } else { %>
            <p>You are not logged in. Please log in to access the dashboard.</p>
        <% } %>
    </div>
</body>
</html>