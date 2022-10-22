import 'package:project/language/sentences.dart';
import 'package:project/models/language.dart';

class LC {
  static Language arabic = Language(
    LanguagesNames.arabic,
    arabicSentences,
    Directions.right,
  );

  static Language english = Language(
    LanguagesNames.english,
    englishSentences,
    Directions.left,
  );

  static Language activeLanguage = arabic;

  static String langWord(String key) {
    if (activeLanguage == arabic) {
      return arabic.sentences[key] ?? 'No Word Found, Lang error';
    } else {
      return english.sentences[key] ?? 'No Word Found, Lang error';
    }
  }
}
