import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../mock_data/mock_translation_response.dart';
import '../models/translation_result_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../widgets/text_to_text_widgets/empty_state_hero.dart';
import '../widgets/text_to_text_widgets/language_selector_card.dart';
import '../widgets/text_to_text_widgets/translated_text_card.dart';
import '../widgets/text_to_text_widgets/translation_input_box.dart';
import '../widgets/text_to_text_widgets/translation_mode_toggle.dart';

class TextToTextScreen extends StatefulWidget {
  const TextToTextScreen({super.key});

  @override
  State<TextToTextScreen> createState() => _TextToTextScreenState();
}

enum _TranslationStatus { idle, loading, success, error }

class _TextToTextScreenState extends State<TextToTextScreen> {
  late final TextEditingController _textController;
  _TranslationStatus _status = _TranslationStatus.idle;
  TranslationResultModel? _result;
  String? _errorMessage;
  String _sourceCode = 'EN';
  String _targetCode = 'RU';
  bool _isTextMode = true;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _swapLanguages() {
    setState(() {
      final previousSource = _sourceCode;
      final wasSuccessful =
          _status == _TranslationStatus.success && _result != null;
      final previousInput = _textController.text.trim();
      final previousOutput = wasSuccessful
          ? _result!.translations.first.translatedText
          : null;

      _sourceCode = _targetCode;
      _targetCode = previousSource;

      if (previousOutput != null) {
        _textController.value = TextEditingValue(
          text: previousOutput,
          selection: TextSelection.collapsed(offset: previousOutput.length),
        );
        // Swapping a completed pair reverses the displayed source/output.
        // No new translation is claimed or requested from the demo response.
        _result = TranslationResultModel.fromJson({
          'translations': [
            {'translatedText': previousInput},
          ],
        });
        _status = _TranslationStatus.success;
        _errorMessage = null;
      } else {
        _resetTranslation();
      }
    });
  }

  void _resetTranslation() {
    _status = _TranslationStatus.idle;
    _result = null;
    _errorMessage = null;
  }

  void _onInputChanged(String _) {
    setState(_resetTranslation);
  }

  void _onClear() {
    setState(() {
      _textController.clear();
      _resetTranslation();
    });
  }

  Future<void> _onPaste() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text;
    if (text == null || !mounted) return;
    _textController.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
    setState(_resetTranslation);
  }

  Future<void> _translate() async {
    final sourceText = _textController.text.trim();
    if (sourceText.isEmpty || _status == _TranslationStatus.loading) return;

    FocusScope.of(context).unfocus();
    setState(() {
      _status = _TranslationStatus.loading;
      _result = null;
      _errorMessage = null;
    });

    try {
      // Simulates the network wait until the Google API is connected.
      await Future<void>.delayed(const Duration(milliseconds: 400));
      if (_sourceCode != 'EN' || _targetCode != 'RU' ||
          sourceText != mockSourceText) {
        throw StateError(
          'Demo mode supports only “$mockSourceText” translated from English to Russian.',
        );
      }
      final result = TranslationResultModel.fromJson(mockTranslationResponse);
      if (!mounted) return;
      setState(() {
        _result = result;
        _status = _TranslationStatus.success;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _status = _TranslationStatus.error;
        _errorMessage = 'Could not translate this text. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? AppColors.darkBg : AppColors.lightBg;
    final result = _result;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TranslationModeToggle(
                isTextMode: _isTextMode,
                onModeChanged: (value) => setState(() => _isTextMode = value),
              ),
              const SizedBox(height: 12),
              LanguageSelectorCard(
                sourceLangCode: _sourceCode,
                sourceLangTitle: _languageTitle(_sourceCode),
                targetLangCode: _targetCode,
                targetLangTitle: _languageTitle(_targetCode),
                onSwap: _swapLanguages,
              ),
              const SizedBox(height: 12),
              TranslationInputBox(
                controller: _textController,
                sourceLanguage: _languageTitle(_sourceCode),
                onChanged: _onInputChanged,
                onClear: _onClear,
                onPaste: _onPaste,
                onSubmit: _translate,
              ),
              const SizedBox(height: 12),
              if (_status == _TranslationStatus.idle)
                const EmptyStateHero()
              else if (_status == _TranslationStatus.loading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (_status == _TranslationStatus.error)
                _TranslationError(message: _errorMessage ?? 'Translation failed.')
              else if (_status == _TranslationStatus.success && result != null) ...[
                TranslatedTextCard(
                  targetLangTitle: _languageTitle(_targetCode),
                  targetLangSubtitle: '',
                  targetLangBanner: 'Demo response',
                  translatedText: result.translations.first.translatedText,
                  transliterationText: '',
                  isVerified: false,
                  onCopy: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(AppConstants.copiedToClipboard),
                      duration: Duration(seconds: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const _EmptyNuancesSection(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _languageTitle(String code) => switch (code) {
        'EN' => 'English (US)',
        'RU' => 'Russian',
        'AR' => 'Arabic',
        _ => code,
      };
}

class _TranslationError extends StatelessWidget {
  final String message;

  const _TranslationError({required this.message});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.wight
                : AppColors.darkGrey,
          ),
        ),
      );
}

class _EmptyNuancesSection extends StatelessWidget {
  const _EmptyNuancesSection();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Text(
          'Context and nuances will appear here when available.',
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.coolGray
                : AppColors.darkGrey,
          ),
        ),
      );
}
