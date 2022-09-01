class Language {
  final Directions langDirection;
  final Map<String, String> sentences;
  final LanguagesNames name;

  Language(
    this.name,
    this.sentences,
    this.langDirection,
  );
}

enum Directions {
  right,
  left,
}

enum LanguagesNames {
  arabic,
  english,
}
