class OfferModel {
  final String title;
  final String imagePath;
  final DateTime createdAt;
  final DateTime endAt;
  late bool active;

  OfferModel({
    required this.imagePath,
    required this.title,
    required this.createdAt,
    required this.endAt,
  }) {
    active = endAt.isAfter(DateTime.now());
  }
}
