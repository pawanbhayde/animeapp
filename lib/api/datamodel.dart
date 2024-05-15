class AnimeData {
  final String id;
  final String title;
  final String url;
  final String trailerUrl;
  final String poster;
  final String synopsis;
  final String Releases;
  final String trailerThumbnail;
  final String year;
  final String score;
  final String producers;
  final String genres;

  AnimeData({
    required this.id,
    required this.title,
    required this.url,
    required this.trailerUrl,
    required this.poster,
    required this.synopsis,
    required this.Releases,
    required this.trailerThumbnail,
    required this.year,
    required this.score,
    required this.producers,
    required this.genres,
  });

  // Factory method to create an Anime instance from a Map
  factory AnimeData.fromMap(Map<String, dynamic> json) {
    return AnimeData(
      id: json['mal_id'].toString(),
      title: json['title_english'] != null
          ? json['title_english'].toString()
          : json['title'].toString(),
      url: json['trailer']['url'].toString(),
      trailerUrl: json['trailer']['url'].toString(),
      poster: json['images']['jpg']['image_url'].toString(),
      synopsis: json['synopsis'].toString(),
      Releases: json['aired']['from'].toString(),
      trailerThumbnail: json['trailer']['images']['large_image_url'].toString(),
      year: json['aired']['prop']['from']['year'].toString(),
      score: json['score'].toString(),
      producers: json['producers'][0]['name'].toString(),
      genres: json['genres'][0]['name'].toString(),
    );
  }
  // Method to convert Anime instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'trailerUrl': trailerUrl,
      'trailerThumbnail': poster,
      'synopsis': synopsis,
      'Releases': Releases,
      'year': year,
    };
  }

  @override
  String toString() {
    return 'Anime{id: $id, title: $title, url: $url, trailerUrl: $trailerUrl, trailerThumbnail: $poster, synopsis: $synopsis, Releases: $Releases, year: $year,}';
  }
}
