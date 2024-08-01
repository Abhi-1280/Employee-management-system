<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Task</title>
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
            align-items: center;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            max-width: 300px;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus {
            border-color: #3c6e71; /* Highlight color */
            outline: none;
        }

        input[type="submit"] {
            background-color: #3c6e71; /* Updated color */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            font-size: 1em;
        }

        input[type="submit"]:hover {
            background-color: #2a4d52; /* Darker shade */
            transform: translateY(-2px);
        }

        .message {
            text-align: center;
            color: #092635;
            font-size: 1.2em;
            margin-top: 20px;
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
            <li><a href="<%= request.getContextPath() %>/LogutServlet" class="logout">Logout</a></li>
        </ul>
    </div>

    <!-- Container -->
    <div class="container">
        <%
            if (request.getSession().getAttribute("loggedIn") != null && (boolean) request.getSession().getAttribute("loggedIn")) {
        %>
            <h1>Welcome to your Task Deletion Category</h1>
            <form action="EmployeeDeleteServlet" method="post">
                <label for="taskCategory">Task Category:</label>
                <input type="text" id="taskCategory" name="taskCategory" required>
                <input type="submit" value="Delete">
            </form>
        <%
            } else {
        %>
            <p class="message">You are not logged in. Please log in to access the dashboard.</p>
        <%
            }
        %>
    </div>
</body>
</html>
