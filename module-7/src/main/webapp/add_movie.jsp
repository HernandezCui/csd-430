<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Movie</title>
</head>
<body>
<h1>Add a New Movie</h1>
<form action="add_movie_action.jsp" method="post">
    <label for="title">Title:</label>
    <input type="text" id="title" name="title" required><br>

    <label for="genre">Genre:</label>
    <input type="text" id="genre" name="genre" required><br>

    <label for="releaseYear">Release Year:</label>
    <input type="number" id="releaseYear" name="releaseYear" required><br>

    <label for="director">Director:</label>
    <input type="text" id="director" name="director" required><br>

    <label for="rating">Rating:</label>
    <input type="number" step="0.1" id="rating" name="rating" required><br>

    <input type="submit" value="Add Movie">
</form>
</body>
</html>