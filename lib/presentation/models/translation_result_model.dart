/// Google Cloud Translation v3 response model.
///
/// The service response contains one Translation per item in the request's
/// `contents` array, in the same order.
class TranslationResultModel {
  final List<TranslatedItem> translations;
  final String? model;

  const TranslationResultModel({required this.translations, this.model});

  factory TranslationResultModel.fromJson(Map<String, dynamic> json) {
    final values = json['translations'];
    if (values is! List) {
      throw const FormatException('Translation response has no translations list.');
    }
    if (values.isEmpty) {
      throw const FormatException('Translation response contains no translations.');
    }
    return TranslationResultModel(
      translations: values
          .map((item) {
            if (item is! Map<String, dynamic>) {
              throw const FormatException('Invalid translation item.');
            }
            return TranslatedItem.fromJson(item);
          })
          .toList(growable: false),
      model: json['model'] as String?,
    );
  }
}

class TranslatedItem {
  final String translatedText;
  final String? detectedLanguageCode;

  const TranslatedItem({
    required this.translatedText,
    this.detectedLanguageCode,
  });

  factory TranslatedItem.fromJson(Map<String, dynamic> json) {
    final text = json['translatedText'];
    if (text is! String || text.isEmpty) {
      throw const FormatException('Translation item has no translatedText.');
    }
    return TranslatedItem(
      translatedText: text,
      detectedLanguageCode: json['detectedLanguageCode'] as String?,
    );
  }
}
