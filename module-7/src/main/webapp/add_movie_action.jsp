<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Movie Action</title>
</head>
<body>
<h1>Adding Movie</h1>
<%
    // Collect data from the form
    String title = request.getParameter("title");
    String genre = request.getParameter("genre");
    int releaseYear = Integer.parseInt(request.getParameter("releaseYear"));
    String director = request.getParameter("director");
    double rating = Double.parseDouble(request.getParameter("rating"));

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/CSD430";
    String user = "student1";
    String password = "pass";

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        // Connect to database and insert data
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        String sql = "INSERT INTO cuitlahuac_movies_data (title, genre, release_year, director, rating) VALUES (?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, title);
        ps.setString(2, genre);
        ps.setInt(3, releaseYear);
        ps.setString(4, director);
        ps.setDouble(5, rating);
        int rows = ps.executeUpdate();

        if (rows > 0) {
            out.println("<p>Movie added successfully!</p>");
        } else {
            out.println("<p>Failed to add movie.</p>");
        }
    } catch (Exception e) {
        out.println("<p>Error occurred while processing your request:</p>");
        java.io.StringWriter sw = new java.io.StringWriter();
        e.printStackTrace(new java.io.PrintWriter(sw));
        out.println("<pre>" + sw.toString() + "</pre>");
    } finally {
        // Close resources
        if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
<a href="movies_data.jsp">View All Movies</a>
</body>
</html>