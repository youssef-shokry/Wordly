/// One line spoken in a saved dialogue.
class DialogueTurn {
  final String speaker; // 'A' / 'B'
  final String languageName;
  final String text;
  final String? translation;
  final bool isRtl;

  const DialogueTurn({
    required this.speaker,
    required this.languageName,
    required this.text,
    this.translation,
    this.isRtl = false,
  });
}

class FavouriteDialogue {
  final String id;
  final String dateLabel;
  final String title;
  final String sourceLanguage;
  final String targetLanguage;
  final String durationLabel;
  final int turnCount;
  final List<DialogueTurn> preview;
  final Duration position;
  final Duration total;
  final bool isFavorite;

  const FavouriteDialogue({
    required this.id,
    required this.dateLabel,
    required this.title,
    required this.sourceLanguage,
    required this.targetLanguage,
    required this.durationLabel,
    required this.turnCount,
    required this.preview,
    required this.position,
    required this.total,
    this.isFavorite = false,
  });

  FavouriteDialogue copyWith({bool? isFavorite}) => FavouriteDialogue(
        id: id,
        dateLabel: dateLabel,
        title: title,
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
        durationLabel: durationLabel,
        turnCount: turnCount,
        preview: preview,
        position: position,
        total: total,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}

class FavouritePhrase {
  final String id;
  final String sourceLanguage;
  final String targetLabel;
  final String timeLabel;
  final String sourceText;
  final String translatedText;
  final bool isFavorite;

  const FavouritePhrase({
    required this.id,
    required this.sourceLanguage,
    required this.targetLabel,
    required this.timeLabel,
    required this.sourceText,
    required this.translatedText,
    this.isFavorite = false,
  });

  FavouritePhrase copyWith({bool? isFavorite}) => FavouritePhrase(
        id: id,
        sourceLanguage: sourceLanguage,
        targetLabel: targetLabel,
        timeLabel: timeLabel,
        sourceText: sourceText,
        translatedText: translatedText,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}
