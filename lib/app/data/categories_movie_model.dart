class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  // Factory constructor to create an instance from JSON
  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
