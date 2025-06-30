package csd430.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MovieBean {
    private final String url = "jdbc:mysql://localhost:3306/CSD430?useSSL=false&serverTimezone=UTC";
    private final String user = "student1";
    private final String password = "pass";

    // Get all movie IDs (primary keys)
    public List<Integer> getAllIds() throws SQLException, ClassNotFoundException {
        List<Integer> ids = new ArrayList<>();
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT id FROM cuitlahuac_movies_data")) {
            while (rs.next()) {
                ids.add(rs.getInt("id"));
            }
        }
        return ids;
    }

    // Get a movie record by ID
    public Movie getMovieById(int id) throws SQLException, ClassNotFoundException {
        Movie movie = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        String sql = "SELECT * FROM cuitlahuac_movies_data WHERE id = ?";
        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    movie = new Movie(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("genre"),
                        rs.getInt("release_year"),
                        rs.getString("director"),
                        rs.getDouble("rating")
                    );
                }
            }
        }
        return movie;
    }
}
