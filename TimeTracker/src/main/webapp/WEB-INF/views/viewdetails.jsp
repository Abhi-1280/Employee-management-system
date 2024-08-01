<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="register.Task" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task Details</title>
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
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        /* Navbar Styling */
        .navbar {
            background-color: #3c6e71; /* Consistent color */
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

        /* Container Styling */
        .container {
            max-width: 1000px;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #3c6e71; /* Consistent color */
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .container {
                width: 90%;
                padding: 15px;
            }

            table, th, td {
                font-size: 0.9em;
            }

            th, td {
                padding: 8px;
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
            <li><a href="<%= request.getContextPath() %>/LogoutServlet" class="logout">Logout</a></li>
        </ul>
    </div>

    <!-- Container -->
    <div class="container">
        <h1>Task Details</h1>
        <table>
            <tr>
                <th>Employee ID</th>
                <th>Employee Name</th>
                <th>Role</th>
                <th>Project</th>
                <th>Task Date</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Task Category</th>
                <th>Description</th>
            </tr>
            <% 
            List<Task> taskList = (List<Task>) request.getAttribute("taskList");
            if (taskList != null && !taskList.isEmpty()) {
                for (Task task : taskList) {
            %>
                <tr>
                    <td><%= task.getEmployeeId() %></td>
                    <td><%= task.getEmployeeName() %></td>
                    <td><%= task.getRole() %></td>
                    <td><%= task.getProject() %></td>
                    <td><%= task.getTaskDate() %></td>
                    <td><%= task.getStartTime() %></td>
                    <td><%= task.getEndTime() %></td>
                    <td><%= task.getTaskCategory() %></td>
                    <td><%= task.getDescription() %></td>
                </tr>
            <% 
                }
            } else { 
            %>
                <tr>
                    <td colspan="9">No data found.</td>
                </tr>
            <% 
            } 
            %>
        </table>
    </div>
</body>
</html>
