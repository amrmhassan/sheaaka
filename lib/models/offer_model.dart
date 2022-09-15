class OfferModel {
  final String id;
  final String title;
  final String imagePath;
  final DateTime createdAt;
  final DateTime endAt;
  late bool active;

  OfferModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.createdAt,
    required this.endAt,
  }) {
    active = endAt.isAfter(DateTime.now());
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'imagePath': imagePath,
      'createdAt': createdAt,
      'endAt': endAt,
      'active': active,
    };
  }
}
