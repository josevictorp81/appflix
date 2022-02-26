class Movie {
  final String posterPath;
  final String overview;
  final String title;
  final List genreIds;
  final double voteAverage;

  Movie(
    this.posterPath,
    this.overview,
    this.title,
    this.genreIds,
    this.voteAverage,
  );

  Movie.fromJson(Map<String, dynamic> json)
      : posterPath = json['poster_path'],
        overview = json['overview'],
        title = json['title'],
        genreIds = json['genre_ids'],
        voteAverage = checkDouble(json['vote_average']);

  static List<Movie> jsonToList(data) {
    return data.map<Movie>((map) => Movie.fromJson(map)).toList();
  }

  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else {
      return value.toDouble();
    }
  }
}
