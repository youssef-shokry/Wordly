import 'package:flutter/material.dart';
import '../mock_data/mock_data.dart';
import '../models/translation_result_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../widgets/text_to_text_widgets/empty_state_hero.dart';
import '../widgets/text_to_text_widgets/language_selector_card.dart';
import '../widgets/text_to_text_widgets/nuance_card.dart';
import '../widgets/text_to_text_widgets/translated_text_card.dart';
import '../widgets/text_to_text_widgets/translation_input_box.dart';
import '../widgets/text_to_text_widgets/translation_mode_toggle.dart';

/// Main screen for text-to-text translation.
/// Holds all state: input text, active language pair, and translation result.
class TextToTextScreen extends StatefulWidget {
  const TextToTextScreen({super.key});

  @override
  State<TextToTextScreen> createState() => _TextToTextScreenState();
}

class _TextToTextScreenState extends State<TextToTextScreen> {
  late TranslationResultModel _currentTranslation;
  late TextEditingController _textController;

  // true = text mode, false = live speech mode
  bool _isTextMode = true;

  @override
  void initState() {
    super.initState();
    // Start with EN→AR mock, but clear the input so the empty state shows first
    _currentTranslation =
        MockTranslationData.mockEnToArTranslation.copyWith(lang1Text: '');
    _textController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  /// Flip the source and target languages.
  /// If the box was empty, keep it empty after swap.
  void _swapLanguages() {
    setState(() {
      final wasEmpty = _textController.text.trim().isEmpty;
      if (_currentTranslation.lang1Code == 'EN') {
        _currentTranslation = MockTranslationData.mockArToEnTranslation;
      } else {
        _currentTranslation = MockTranslationData.mockEnToArTranslation;
      }
      if (wasEmpty) {
        _textController.text = '';
        _currentTranslation = _currentTranslation.copyWith(lang1Text: '');
      } else {
        _textController.text = _currentTranslation.lang1Text;
      }
    });
  }

  /// Keep the model in sync as the user types.
  void _onInputChanged(String value) {
    setState(() {
      _currentTranslation = _currentTranslation.copyWith(lang1Text: value);
    });
  }

  /// Wipe the input and go back to the empty state.
  void _onClear() {
    setState(() {
      _textController.clear();
      _currentTranslation = _currentTranslation.copyWith(lang1Text: '');
    });
  }

  /// Fill the input with mock sample text (simulates clipboard paste).
  void _onPaste() {
    setState(() {
      final sample = _currentTranslation.lang1Code == 'EN'
          ? MockTranslationData.mockEnToArTranslation.lang1Text
          : MockTranslationData.mockArToEnTranslation.lang1Text;
      _textController.text = sample;
      _currentTranslation = _currentTranslation.copyWith(lang1Text: sample);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? AppColors.darkBg : AppColors.lightBg;

    // Decide whether to show results or the empty-state prompt
    final hasData = _textController.text.trim().isNotEmpty;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Switch between Text and Live Speech modes
              TranslationModeToggle(
                isTextMode: _isTextMode,
                onModeChanged: (isText) {
                  setState(() {
                    _isTextMode = isText;
                  });
                },
              ),
              const SizedBox(height: 12),

              // Source & target language picker with swap button
              LanguageSelectorCard(
                sourceLangCode: _currentTranslation.lang1Code,
                sourceLangTitle: _currentTranslation.lang1Title,
                targetLangCode: _currentTranslation.lang2Code,
                targetLangTitle: _currentTranslation.lang2Subtitle.isNotEmpty
                    ? _currentTranslation.lang2Subtitle
                    : _currentTranslation.lang2Title,
                onSwap: _swapLanguages,
              ),
              const SizedBox(height: 12),

              // Text field where the user types what they want translated
              TranslationInputBox(
                controller: _textController,
                sourceLanguage: _currentTranslation.lang1Title,
                onChanged: _onInputChanged,
                onClear: _onClear,
                onPaste: _onPaste,
                onSubmit: () {
                  FocusScope.of(context).unfocus();
                },
              ),
              const SizedBox(height: 12),

              // Show results when there's input, otherwise show the welcome hero
              if (!hasData) ...[
                const EmptyStateHero(),
              ] else ...[
                // The translated output card
                TranslatedTextCard(
                  targetLangTitle: _currentTranslation.lang2Title,
                  targetLangSubtitle: _currentTranslation.lang2Subtitle,
                  targetLangBanner: _currentTranslation.lang2Banner,
                  translatedText: _currentTranslation.translatedText,
                  transliterationText: _currentTranslation.transliterationText,
                  isVerified: _currentTranslation.isVerified,
                  onCopy: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(AppConstants.copiedToClipboard),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 14),

                // context meanings and usage examples
                ContextAndNuancesSection(
                  items: _currentTranslation.nuances,
                ),
                const SizedBox(height: 16),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
