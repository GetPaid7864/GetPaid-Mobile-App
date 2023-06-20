class AddLanguageModel {
  final String language;
  final String level;

  AddLanguageModel({required this.language, required this.level});

  Map<String, dynamic> toJson() => {
        "language": language,
        "level": level,
      };
}
