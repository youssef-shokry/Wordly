import 'package:depi_final_project/models/language.dart';

/// Ready-made [Language] constants used across the app.
/// (Kept here, in utils, so the model file only holds the model.)
abstract final class AppLanguages {
  static const english = Language(code: 'EN', name: 'English (US)');
  static const arabic = Language(code: 'AR', name: 'Arabic');
  static const spanish = Language(code: 'ES', name: 'Spanish');
  static const german = Language(code: 'DE', name: 'German');
  static const french = Language(code: 'FR', name: 'French');

  /// Every language the user can pick from in the app.
  static const supportedLanguages = [english, arabic, spanish, german, french];
}
