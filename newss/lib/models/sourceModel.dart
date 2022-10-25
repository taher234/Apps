class Source {
  String? name;
  String? id;
  Source({
    required this.name,
    required this.id,
  });
  factory Source.fromJson(Map<String, dynamic> data) {
    return Source(id: data['id'], name: data['name']);
  }
}
