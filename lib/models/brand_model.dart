import 'package:project/constants/models_constants.dart';

class BrandModel {
  final String id;
  final String name;
  final String? icon;

  const BrandModel({
    required this.id,
    required this.name,
    this.icon,
  });

  Map<String, dynamic> toJSON() {
    return {
      idString: id,
      nameString: name,
      iconString: icon,
    };
  }
}
