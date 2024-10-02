<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
</head>
<body>
    <h1>Product List</h1>
    <table border='1'>
        <tr>
            <th>ID</th>
            <th>Product Name</th>
            <th>Price</th>
        </tr>
        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Connect to the database
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourDB", "username", "password");
                stmt = con.createStatement();
                String query = "SELECT * FROM products"; // Adjust according to your product table
                rs = stmt.executeQuery(query);

                // Iterate through the result set and display data
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getDouble("price") %></td>
                    </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Log error
        %>
                <tr>
                    <td colspan="3">Error: <%= e.getMessage() %></td>
                </tr>
        <%
            } catch (ClassNotFoundException e) {
                e.printStackTrace(); // Log error
        %>
                <tr>
                    <td colspan="3">Error: Database driver not found.</td>
                </tr>
        <%
            } finally {
                // Close resources safely
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace(); // Log closing errors
                }
            }
        %>
    </table>
    <a href="index.jsp">Back</a>
</body>
</html>
