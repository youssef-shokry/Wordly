/// Simple data model that describes one language the app supports.
class Language {
  /// Short language code shown in the UI (e.g. 'EN', 'AR').
  final String code;

  /// Full display name of the language (e.g. 'English (US)').
  final String name;

  const Language({required this.code, required this.name});
}
