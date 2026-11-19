class Language {
  final String code;
  final String name;

  const Language({required this.code, required this.name});
}

abstract final class Languages {
  static const english = Language(code: 'EN', name: 'English (US)');
  static const arabic = Language(code: 'AR', name: 'Arabic');
  static const spanish = Language(code: 'ES', name: 'Spanish');
  static const german = Language(code: 'DE', name: 'German');
  static const french = Language(code: 'FR', name: 'French');

  static const all = [english, arabic, spanish, german, french];
}
