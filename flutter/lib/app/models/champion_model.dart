class Champion {
  late final int id;
  late final String name;
  late final String description;
  late final String imageUrl;

  Champion({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
      id: json["Id"],
      name: json["Name"],
      description: json["Description"],
      imageUrl: json["ImageUrl"],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    data["Id"] = id;
    data["Name"] = name;
    data["Description"] = description;
    data["ImageUrl"] = imageUrl;
    return data;
  }
}
