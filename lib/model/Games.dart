class GamesModel {
  final String cover, name, platform, release, genre, publisher, description;
  int id;

  GamesModel({
    required this.cover,
    required this.name,
    required this.platform,
    required this.release,
    required this.genre,
    required this.publisher,
    required this.description,
    required this.id,
  });

  factory GamesModel.fromJSON(Map parsedJson) {
    return GamesModel(
        cover: parsedJson['cover'],
        name: parsedJson['name'],
        platform: parsedJson['platform'],
        release: parsedJson['release'],
        genre: parsedJson['genre'],
        publisher: parsedJson['publisher'],
        description: parsedJson['description'],
        id: parsedJson['id']);
  }
}
