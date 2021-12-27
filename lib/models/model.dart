class RickNMortyCharacterModel {
  final dynamic name;
  final dynamic status;
  final dynamic species;
  final dynamic gender;
  final dynamic image;
  final dynamic location;

  RickNMortyCharacterModel({
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.location,
  });
  factory RickNMortyCharacterModel.fromJson(Map<String, dynamic> json) {
    return RickNMortyCharacterModel(
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
      location: json['location'],
    );
  }
}
class InfoModel {
  dynamic? count;
  dynamic? pages;
  dynamic? next;
  dynamic? prev;
  List<RickNMortyCharacterModel>? results=[];

  InfoModel(
      {this.count, this.pages, this.next, this.prev});

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }
}
class locationModel {
  dynamic? name;
  dynamic? url;

  locationModel(
      {this.name, this.url});

  factory locationModel.fromJson(Map<String, dynamic> json) {
    return locationModel(
      name: json['name'],
      url: json['url'],
    );
  }
}