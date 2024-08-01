<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            user-select: none;
            position: relative;
            min-height: 100vh;
           /* Prevent horizontal scrolling */
            background-color: #f7f7f7; /* Light background for better contrast */
        }

        a {
            text-decoration: none;
        }

        /* Background Image */
        body::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('log.gif');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            opacity: 0.5; /* Opacity for the background image */
            z-index: -2; /* Ensure it's behind other content */
        }

        /* White Overlay */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.8); /* Light white overlay */
            z-index: -1; /* Ensure it's between the background and content */
        }

        /* Navbar Styling */
        .navbar {
            background-color: #3c6e71; /* New color for the navbar */
            padding: 20px;
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
            margin: 0 10px;
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
            background-color: #354f52;
            transform: translateY(-2px);
        }

        /* Form Styling */
        .form-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 480px; /* Adjusts max width for larger screens */
            margin: 50px auto; /* Centers form on the page */
            color: #284b63; /* New color for text */
            z-index: 1; /* Ensures the form is above the overlay */
            position: relative;
        }

        h2 {
            text-align: center;
            color: #284b63;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            color: #284b63;
        }

        input[type="text"],
        input[type="password"],
        input[type="date"],
        input[type="time"],
        input[type="number"],
        textarea {
            width: 100%;
            background-color: white;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            color: #333;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="date"]:focus,
        input[type="time"]:focus,
        input[type="number"]:focus,
        textarea:focus {
            border-color: #3c6e71;
            outline: none;
        }

        textarea {
            height: 120px; /* Adjusted height for better usability */
            resize: none;
        }

        .error-message {
            color: #d9534f; /* Bootstrap's red for error message */
            margin-bottom: 10px;
            text-align: center;
        }

        button[type="submit"] {
            background-color: #3c6e71; /* New color for the button */
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.3s;
            font-weight: bold;
            font-size: 16px;
        }

        button[type="submit"]:hover {
            background-color: #354f52;
            transform: translateY(-2px);
        }

        button[type="submit"]:active {
            transform: translateY(2px); /* Push the button down slightly when clicked */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Add a shadow when clicked */
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .form-container {
                width: 90%;
                padding: 20px;
            }

            .nav-links {
                flex-direction: column;
                align-items: center;
            }

            .nav-links li {
                margin: 5px 0;
            }
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <nav class="navbar">
        <a href="<%= request.getContextPath() %>/EmployeeDashboardServlet" class="logo">Employee Time Tracker</a>
        <ul class="nav-links">
            <li><a href="<%= request.getContextPath() %>/EmployeeAddTaskServlet">Add Task</a></li>
            <li><a href="<%= request.getContextPath() %>/EmployeeChartServlet">Charts</a></li>
            <li><a href="<%= request.getContextPath() %>/EmployeeViewServlet">View Task Duration</a></li>
            <li><a href="<%= request.getContextPath() %>/EmployeeEditServlet">Edit Task</a></li>
            <li><a href="<%= request.getContextPath() %>/EmployeeDeleteServlet">Delete Task</a></li>
            <li><a href="<%= request.getContextPath() %>/ViewDetailsServlet">View Task Details</a></li>
            <li><a href="<%= request.getContextPath() %>/LogutServlet">Logout</a></li>
        </ul>
    </nav>

    <div class="form-container">
        <h2>Add Task</h2>
        <form action="<%= request.getContextPath() %>/EmployeeAddTaskServlet" method="post">
            <label for="employeeName">Employee Name:</label>
            <input type="text" name="employeeName" id="employeeName" required>

            <label for="role">Role:</label>
            <input type="text" name="role" id="role" required>

            <label for="project">Project:</label>
            <input type="text" name="project" id="project" required>

            <label for="taskDate">Date:</label>
            <input type="date" name="taskDate" id="taskDate" required>

            <label for="startTime">Start Time:</label>
            <input type="time" name="startTime" id="startTime" required>

            <label for="endTime">End Time:</label>
            <input type="time" name="endTime" id="endTime" required>

            <label for="taskCategory">Task Category:</label>
            <input type="text" name="taskCategory" id="taskCategory" required>

            <label for="description">Description:</label>
            <textarea name="description" id="description" required></textarea>

            <button type="submit">Add Task</button>
        </form>
    </div>
</body>
</html>
