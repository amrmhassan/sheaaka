import 'package:project/constants/models_constants.dart';

class KeyWordModel {
  final String id;
  final String title;

  const KeyWordModel({
    required this.id,
    required this.title,
  });

  Map<String, String> toJSON() {
    return {
      idString: id,
      titleString: title,
    };
  }

  static KeyWordModel fromJSON(Map<String, dynamic> keywordJSON) {
    String id = keywordJSON[idString];
    String title = keywordJSON[titleString];
    return KeyWordModel(id: id, title: title);
  }
}
