class Serie {
  final String posterPath;
  final String overview;
  final String title;
  final List genreIds;
  final double voteAverage;

  Serie(
    this.posterPath,
    this.overview,
    this.title,
    this.genreIds,
    this.voteAverage,
  );

  Serie.fromJson(Map<String, dynamic> json)
      : posterPath = json['poster_path'],
        overview = json['overview'],
        title = json['name'],
        genreIds = json['genre_ids'],
        voteAverage = checkDouble(json['vote_average']);

  static List<Serie> jsonToList(data) {
    return data.map<Serie>((map) => Serie.fromJson(map)).toList();
  }

  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else {
      return value.toDouble();
    }
  }
}
