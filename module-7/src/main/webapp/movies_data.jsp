<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Movies Data</title>
</head>
<body>
<h1>Movies List</h1>
<%
    String url = "jdbc:mysql://localhost:3306/CSD430";
    String user = "student1";
    String password = "pass";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();

        String sql = "SELECT * FROM cuitlahuac_movies_data";
        rs = stmt.executeQuery(sql);

        out.println("<table border='1'>");
        out.println("<thead>");
        out.println("<tr><th>ID</th><th>Title</th><th>Genre</th><th>Release Year</th><th>Director</th><th>Rating</th></tr>");
        out.println("</thead>");
        out.println("<tbody>");

        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("id") + "</td>");
            out.println("<td>" + rs.getString("title") + "</td>");
            out.println("<td>" + rs.getString("genre") + "</td>");
            out.println("<td>" + rs.getInt("release_year") + "</td>");
            out.println("<td>" + rs.getString("director") + "</td>");
            out.println("<td>" + rs.getDouble("rating") + "</td>");
            out.println("</tr>");
        }
        out.println("</tbody>");
        out.println("</table>");
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
</body>
</html>