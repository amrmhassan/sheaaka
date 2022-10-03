import 'package:project/constants/models_constants.dart';

class CategoryModel {
  final String id;
  final String title;
  final String icon;

  const CategoryModel({
    required this.id,
    required this.icon,
    required this.title,
  });

  Map<String, dynamic> toJSON() {
    return {
      idString: id,
      titleString: title,
      iconString: icon,
    };
  }

  static CategoryModel fromJSON(Map<String, dynamic> catJSON) {
    String id = catJSON[idString];
    String title = catJSON[titleString];
    String icon = catJSON[iconString];
    return CategoryModel(
      id: id,
      icon: icon,
      title: title,
    );
  }
}
