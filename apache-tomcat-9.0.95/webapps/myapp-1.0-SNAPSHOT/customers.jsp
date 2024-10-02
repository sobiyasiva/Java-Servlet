<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
    <h1>Customer List</h1>
    <table border='1'>
        <tr>
            <th>ID</th>
            <th>Customer Name</th>
            <th>Email</th>
        </tr>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("customerList");

            if (rs != null) {
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("email") %></td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr>
                    <td colspan="3">No customers found.</td>
                </tr>
        <%
            }
        %>
    </table>
    <a href="index.jsp">Back</a>
</body>
</html>
