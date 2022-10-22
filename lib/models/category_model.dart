import 'package:project/constants/models_constants.dart';

class CategoryModel {
  final String id;
  final String title;
  final String icon;
  final String categoryGenderId;
  final bool allOfGender;

  const CategoryModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.categoryGenderId,
    this.allOfGender = false,
  });

  Map<String, dynamic> toJSON() {
    return {
      idString: id,
      titleString: title,
      iconString: icon,
      categoryGenderIdString: categoryGenderId,
    };
  }

  static CategoryModel fromJSON(Map<String, dynamic> catJSON) {
    String id = catJSON[idString];
    String title = catJSON[titleString];
    String icon = catJSON[iconString];
    String categoryGenderId = catJSON[categoryGenderIdString];
    return CategoryModel(
      id: id,
      icon: icon,
      title: title,
      categoryGenderId: categoryGenderId,
    );
  }
}
