// Nuance Item
class NuanceItemData {
  final String term;
  final String partOfSpeech;
  final String translatedTerm;
  final String definition;
  final String exampleSource;
  final String exampleTarget;

  const NuanceItemData({
    required this.term,
    required this.partOfSpeech,
    required this.translatedTerm,
    required this.definition,
    required this.exampleSource,
    required this.exampleTarget,
  });

  // FromJson Factory
  factory NuanceItemData.fromJson(Map<String, dynamic> json) {
    return NuanceItemData(
      term: json['term'] as String? ?? '',
      partOfSpeech: json['partOfSpeech'] as String? ?? 'noun',
      translatedTerm: json['translatedTerm'] as String? ?? '',
      definition: json['definition'] as String? ?? '',
      exampleSource: json['exampleSource'] as String? ?? '',
      exampleTarget: json['exampleTarget'] as String? ?? '',
    );
  }
}

// Translation Model
class TranslationResultModel {
  // Source Language
  final String lang1Code;
  final String lang1Title;
  final String lang1Text;

  // Target Language
  final String lang2Code;
  final String lang2Title;
  final String lang2Subtitle;
  final String lang2Banner;
  final String translatedText;
  final String transliterationText;
  final bool isVerified;

  // Nuance List
  final List<NuanceItemData> nuances;

  const TranslationResultModel({
    required this.lang1Code,
    required this.lang1Title,
    required this.lang1Text,
    required this.lang2Code,
    required this.lang2Title,
    required this.lang2Subtitle,
    required this.lang2Banner,
    required this.translatedText,
    required this.transliterationText,
    required this.isVerified,
    required this.nuances,
  });

  // FromJson Factory
  factory TranslationResultModel.fromJson(Map<String, dynamic> json) {
    return TranslationResultModel(
      lang1Code: json['lang1Code'] as String? ?? 'EN',
      lang1Title: json['lang1Title'] as String? ?? 'English (US)',
      lang1Text: json['lang1Text'] as String? ?? '',
      lang2Code: json['lang2Code'] as String? ?? 'AR',
      lang2Title: json['lang2Title'] as String? ?? 'Arabic',
      lang2Subtitle: json['lang2Subtitle'] as String? ?? 'العربية',
      lang2Banner: json['lang2Banner'] as String? ?? 'Modern Standard',
      translatedText: json['translatedText'] as String? ?? '',
      transliterationText: json['transliterationText'] as String? ?? '',
      isVerified: json['isVerified'] as bool? ?? true,
      nuances: (json['nuances'] as List<dynamic>?)
              ?.map((item) =>
                  NuanceItemData.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  // CopyWith Helper
  TranslationResultModel copyWith({
    String? lang1Code,
    String? lang1Title,
    String? lang1Text,
    String? lang2Code,
    String? lang2Title,
    String? lang2Subtitle,
    String? lang2Banner,
    String? translatedText,
    String? transliterationText,
    bool? isVerified,
    List<NuanceItemData>? nuances,
  }) {
    return TranslationResultModel(
      lang1Code: lang1Code ?? this.lang1Code,
      lang1Title: lang1Title ?? this.lang1Title,
      lang1Text: lang1Text ?? this.lang1Text,
      lang2Code: lang2Code ?? this.lang2Code,
      lang2Title: lang2Title ?? this.lang2Title,
      lang2Subtitle: lang2Subtitle ?? this.lang2Subtitle,
      lang2Banner: lang2Banner ?? this.lang2Banner,
      translatedText: translatedText ?? this.translatedText,
      transliterationText: transliterationText ?? this.transliterationText,
      isVerified: isVerified ?? this.isVerified,
      nuances: nuances ?? this.nuances,
    );
  }
}
