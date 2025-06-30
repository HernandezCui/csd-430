package csd430.bean;

public class Movie {
    private int id;
    private String title;
    private String genre;
    private int releaseYear;
    private String director;
    private double rating;

    public Movie(int id, String title, String genre, int releaseYear, String director, double rating) {
        this.id = id;
        this.title = title;
        this.genre = genre;
        this.releaseYear = releaseYear;
        this.director = director;
        this.rating = rating;
    }

    // Getters
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getGenre() { return genre; }
    public int getReleaseYear() { return releaseYear; }
    public String getDirector() { return director; }
    public double getRating() { return rating; }
}
