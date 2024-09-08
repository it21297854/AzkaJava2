<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.FoodModel" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Details with Dashboard</title>
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHx8MA%3D%3D'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .main {
            width: 80%;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent background */
            padding: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            width: 90%;
            margin: 50px auto;
        }


        .dashboard {
            width: 25%;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            margin-right: 20px;
            margin: 50px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        h3 {
            color: #6a11cb;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            text-align: left;
            padding: 12px 15px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        th {
            background-color: #6a11cb;
            color: white;
            font-weight: bold;
        }

        td {
            color: #333;
        }

        button {
            background-color: #6a11cb;
            border: none;
            color: white;
            padding: 10px 16px;
            text-align: center;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2575fc;
        }

        .delete-button:hover {
            background-color: #e64a19;
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .dashboard-stats {
            text-align: center;
            margin: 20px 0;
        }

        .dashboard-links {
            text-align: center;
            margin-top: 20px;
        }

        .dashboard-links a {
            display: block;
            margin: 10px 0;
            color: #2575fc;
            text-decoration: none;
            font-size: 16px;
        }

        .dashboard-links a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

<div class="container">
    <!-- Dashboard Section -->
    <div class="dashboard">
        <h3>Dashboard</h3>

        <!-- Dashboard Stats -->
        <div class="dashboard-stats">
            <p>Total Food Items: 50</p> <!-- Example stats -->
            <p>Categories: 10</p>
        </div>

        <!-- Dashboard Links -->
        <div class="dashboard-links">
            <a href="FoodDetailsServlet">Manage Foods</a>
            <a href="OrderDetailsServlet">Manage Orders</a>
            <a href="inventory.jsp">Inventory</a>
        </div>
    </div>

    <!-- Main Food Details Section -->
    <div class="main">
        <h2>Food Details</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Food Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Description</th>
                <th>Delete</th>
                <th>Update</th>
            </tr>
            <% 
                ArrayList<FoodModel> foodList = (ArrayList<FoodModel>) request.getAttribute("foodList");
                if (foodList != null) {
                    for (FoodModel food : foodList) { 
            %>
            <tr>
                <td><%= food.getId() %></td>
                <td><%= food.getFoodName() %></td>
                <td><%= food.getCategory() %></td>
                <td><%= food.getPrice() %></td>
                <td><%= food.getDescription() %></td>
                <td>
                    <a href="DeleteFood?id=<%= food.getId() %>" onclick="return confirm('Are you sure you want to delete this food item?')">
                        <button class="delete-button">Delete</button>
                    </a>
                </td>
                <td>
                    <a href="GetFoodById?id=<%= food.getId() %>">
                        <button>Update</button>
                    </a>
                </td>
            </tr>
            <% 
                    }
                } else { 
            %>
            <tr>
                <td colspan="7">No food items available.</td>
            </tr>
            <% } %>
        </table>

        <div class="action-buttons">
            <a href="login.jsp">
                <button>Go back to main menu</button>
            </a>
            <a href="addFood.jsp">
                <button>Add New Food</button>
            </a>
        </div>
    </div>
</div>

</body>
</html>
