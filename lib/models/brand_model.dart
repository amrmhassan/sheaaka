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

  static BrandModel fromJSON(Map<String, dynamic> brand) {
    String idDOC = brand[idString];
    String nameDOC = brand[nameString];
    String? iconsDOC = brand[iconString];

    return BrandModel(
      id: idDOC,
      name: nameDOC,
      icon: iconsDOC,
    );
  }
}
