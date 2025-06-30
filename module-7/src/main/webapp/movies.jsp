<%@ page import="java.util.List" %>
<%@ page import="csd430.bean.MovieBean" %>
<%@ page import="csd430.bean.Movie" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Movie Selector</title>
</head>
<body>
<h2>Movie Database</h2>

<%
    MovieBean bean = new MovieBean();
    List<Integer> ids = null;
    try {
        ids = bean.getAllIds();
    } catch(Exception e) {
        out.println("<p>Error retrieving movie IDs: " + e.getMessage() + "</p>");
    }
%>

<form method="post">
    <label for="movieId">Select a Movie ID:</label>
    <select name="movieId" id="movieId" required>
        <option value="">--Select ID--</option>
        <% if (ids != null) {
            for (Integer id : ids) { %>
                <option value="<%= id %>"><%= id %></option>
        <%  }
           }
        %>
    </select>
    <input type="submit" value="Show Movie"/>
</form>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String selectedIdStr = request.getParameter("movieId");
        if (selectedIdStr != null && !selectedIdStr.trim().isEmpty()) {
            int selectedId = Integer.parseInt(selectedIdStr);
            try {
                Movie movie = bean.getMovieById(selectedId);
                if (movie != null) {
%>
                    <h3>Movie Details</h3>
                    <table border="1">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Genre</th>
                            <th>Release Year</th>
                            <th>Director</th>
                            <th>Rating</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><%= movie.getId() %></td>
                            <td><%= movie.getTitle() %></td>
                            <td><%= movie.getGenre() %></td>
                            <td><%= movie.getReleaseYear() %></td>
                            <td><%= movie.getDirector() %></td>
                            <td><%= movie.getRating() %></td>
                        </tr>
                        </tbody>
                    </table>
<%
                } else {
                    out.println("<p>No movie found with ID " + selectedId + "</p>");
                }
            } catch (Exception e) {
                out.println("<p>Error retrieving movie details: " + e.getMessage() + "</p>");
            }
        } else {
            out.println("<p>Please select a valid Movie ID.</p>");
        }
    }
%>

</body>
</html>