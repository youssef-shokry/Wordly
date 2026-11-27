// App Constants
class AppConstants {
  // Text Limits
  static const int maxCharacters = 5000;

  // Language Defaults
  static const String defaultSourceCode = 'EN';
  static const String defaultSourceTitle = 'English (US)';
  static const String defaultTargetCode = 'AR';
  static const String defaultTargetTitle = 'Arabic';
  static const String defaultTargetSubtitle = 'العربية';
  static const String defaultTargetBanner = 'Modern Standard';

  // UI Labels
  static const String textMode = 'Text';
  static const String liveSpeechMode = 'Live Speech';
  static const String fromLabel = 'FROM';
  static const String toLabel = 'TO';
  static const String inputHint = 'Enter text, paste, or speak...';
  static const String paste = 'Paste';
  static const String readyToExplore = 'Ready to explore';
  static const String readyToExploreDesc =
      'Type, speak, or select a conversational scenario to begin real-time synthesis.';
  static const String verified = 'Verified';
  static const String listen = 'Listen';
  static const String contextNuances = 'Context & Nuances';
  static const String extractedTerms = 'extracted terms';
  static const String copiedToClipboard = 'Copied to clipboard';

  // Supported Languages
  static const List<Map<String, String>> supportedLanguages = [
    {
      'code': 'EN',
      'title': 'English (US)',
      'subtitle': 'English',
      'banner': 'US Standard',
    },
    {
      'code': 'AR',
      'title': 'Arabic',
      'subtitle': 'العربية',
      'banner': 'Modern Standard',
    },
    {
      'code': 'ES',
      'title': 'Spanish',
      'subtitle': 'Español',
      'banner': 'Castilian',
    },
    {
      'code': 'FR',
      'title': 'French',
      'subtitle': 'Français',
      'banner': 'Standard',
    },
    {
      'code': 'DE',
      'title': 'German',
      'subtitle': 'Deutsch',
      'banner': 'Standard',
    },
  ];
}
