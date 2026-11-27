import 'package:flutter/material.dart';
import '../mock_data/mock_translation_response.dart';
import '../utils/app_colors.dart';
import '../widgets/history/history_language_filters.dart';
import '../widgets/history/history_search_field.dart';
import '../widgets/history/history_translation_card.dart';
import '../widgets/text_to_text_widgets/translation_mode_toggle.dart';

/// Text translation history screen. The entry is a small UI demo fixture until
/// local storage is connected.
class TextTranslationHistoryScreen extends StatefulWidget {
  const TextTranslationHistoryScreen({super.key});

  @override
  State<TextTranslationHistoryScreen> createState() =>
      _TextTranslationHistoryScreenState();
}

class _TextTranslationHistoryScreenState
    extends State<TextTranslationHistoryScreen> {
  late final TextEditingController _searchController;
  String _query = '';
  String _selectedFilter = HistoryLanguageFilters.filters.first;
  bool _isTextMode = true;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isVisible = _isTextMode &&
        (_selectedFilter == HistoryLanguageFilters.filters.first ||
            _selectedFilter == HistoryLanguageFilters.filters.last) &&
        ('${mockSourceText} ${mockTranslationResponse['translations']!.first['translatedText']}'
            .toLowerCase()
            .contains(_query.toLowerCase()));

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
                children: [
                  TranslationModeToggle(
                    isTextMode: _isTextMode,
                    onModeChanged: (value) => setState(() => _isTextMode = value),
                    textCount: 1,
                    liveSpeechCount: 0,
                  ),
                  const SizedBox(height: 12),
                  HistorySearchField(
                    controller: _searchController,
                    onChanged: (value) => setState(() => _query = value.trim()),
                  ),
                  const SizedBox(height: 6),
                  HistoryLanguageFilters(
                    selected: _selectedFilter,
                    onSelected: (value) => setState(() => _selectedFilter = value),
                  ),
                  const SizedBox(height: 10),
                  if (isVisible) ...[
                    Row(
                      children: [
                        const Text('Today', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.black)),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(color: AppColors.paleBlue, borderRadius: BorderRadius.circular(20)),
                          child: const Text('1 item', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.darkBlue)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 11),
                    HistoryTranslationCard(
                      sourceLanguage: 'English (US)',
                      targetLanguage: 'Russian',
                      sourceText: mockSourceText,
                      translatedText: mockTranslationResponse['translations']!.first['translatedText'] as String,
                      timeLabel: 'Just now',
                      isFavorite: _isFavorite,
                      onFavoriteChanged: (value) => setState(() => _isFavorite = value),
                    ),
                  ] else
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 54, horizontal: 24),
                      child: Column(
                        children: [
                          Icon(_isTextMode ? Icons.search_off_rounded : Icons.mic_none_rounded, size: 38, color: AppColors.darkGrey.withOpacity(.7)),
                          const SizedBox(height: 12),
                          Text(
                            _isTextMode ? 'No translations found' : 'No live speech translations yet',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.darkGrey),
                          ),
                          if (_query.isNotEmpty) ...[
                            const SizedBox(height: 5),
                            const Text('Try another search term.', style: TextStyle(fontSize: 12, color: AppColors.darkGrey)),
                          ],
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
