import 'package:depi_final_project/models/favourite_item.dart';
import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:depi_final_project/presentation/widgets/favourite_widgets/dialogue_card.dart';
import 'package:depi_final_project/presentation/widgets/favourite_widgets/phrase_card.dart';
import 'package:depi_final_project/presentation/widgets/favourite_widgets/favourite_search_bar.dart';
import 'package:depi_final_project/presentation/widgets/favourite_widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  // Sample data (design only). Replace with your real data source.
  List<FavouriteDialogue> _dialogues = const [
    FavouriteDialogue(
      id: 'd1',
      dateLabel: 'Today, 10:14 AM',
      title: 'Metro Station & Directions Inquiry',
      sourceLanguage: 'English',
      targetLanguage: 'Arabic',
      durationLabel: '04:32',
      turnCount: 8,
      position: Duration(minutes: 1, seconds: 24),
      total: Duration(minutes: 4, seconds: 32),
      isFavorite: true,
      preview: [
        DialogueTurn(
          speaker: 'A',
          languageName: 'English',
          text: '"Excuse me, could you direct me to the nearest metro entrance?"',
        ),
        DialogueTurn(
          speaker: 'B',
          languageName: 'Arabic',
          isRtl: true,
          text: '"امش للأمام مسافة مئتي متر، ثم انعطف يميناً عند الميدان."',
          translation: '"Walk straight for 200 meters, then turn right at the plaza."',
        ),
      ],
    ),
  ];

  List<FavouritePhrase> _phrases = const [
    FavouritePhrase(
      id: 'p1',
      sourceLanguage: 'English (US)',
      targetLabel: 'العربية',
      timeLabel: '10:45 AM',
      sourceText:
          'The conference keynote begins tomorrow morning at nine o\'clock.',
      translatedText: 'تبدأ الكلمة الرئيسية للمؤتمر صباح الغد في تمام الساعة التاسعة.',
      isFavorite: true,
    ),
    FavouritePhrase(
      id: 'p2',
      sourceLanguage: 'English (US)',
      targetLabel: 'العربية',
      timeLabel: 'Yesterday',
      sourceText: 'Where is the nearest train station?',
      translatedText: 'أين أقرب محطة قطار؟',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool _matches(String text) =>
      text.toLowerCase().contains(_query.trim().toLowerCase());

  List<FavouriteDialogue> get _visibleDialogues {
    if (_query.trim().isEmpty) return _dialogues;
    return _dialogues
        .where(
          (d) =>
              _matches(d.title) ||
              d.preview.any(
                (t) => _matches(t.text) || _matches(t.translation ?? ''),
              ),
        )
        .toList();
  }

  List<FavouritePhrase> get _visiblePhrases {
    if (_query.trim().isEmpty) return _phrases;
    return _phrases
        .where((p) => _matches(p.sourceText) || _matches(p.translatedText))
        .toList();
  }

  void _toggleDialogueFavorite(FavouriteDialogue d) {
    setState(() {
      _dialogues = [
        for (final item in _dialogues)
          item.id == d.id ? item.copyWith(isFavorite: !item.isFavorite) : item,
      ];
    });
  }

  void _togglePhraseFavorite(FavouritePhrase p) {
    setState(() {
      _phrases = [
        for (final item in _phrases)
          item.id == p.id ? item.copyWith(isFavorite: !item.isFavorite) : item,
      ];
    });
  }

  Future<void> _copyPhrase(FavouritePhrase p) async {
    await Clipboard.setData(ClipboardData(text: p.translatedText));
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
  }

  Widget _emptyMessage() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            'No results found',
            style: AppStyles.blackInterRegularDarkGrey13,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final dialogues = _visibleDialogues;
    final phrases = _visiblePhrases;

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FavouriteSearchBar(
              controller: _searchController,
              onChanged: (value) => setState(() => _query = value),
            ),
            const SizedBox(height: 16),
            SectionHeader(
              title: 'Saved Speech & Voice Dialogues',
              onSeeAll: () {
                // TODO: navigate to the all dialogues screen.
              },
            ),
            const SizedBox(height: 12),
            if (dialogues.isEmpty)
              _emptyMessage()
            else
              for (final d in dialogues)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: DialogueCard(
                    dialogue: d,
                    onFavorite: () => _toggleDialogueFavorite(d),
                    onOpenTranscript: () {
                      // TODO: navigate to the full transcript screen.
                    },
                    onDelete: () {
                      // TODO: confirm and delete this dialogue.
                    },
                  ),
                ),
            const SizedBox(height: 12),
            SectionHeader(
              title: 'Saved Vocabulary & Phrases',
              count: phrases.length,
              onSeeAll: () {
                // TODO: navigate to the all phrases screen.
              },
            ),
            const SizedBox(height: 12),
            if (phrases.isEmpty)
              _emptyMessage()
            else
              for (final p in phrases)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: PhraseCard(
                    phrase: p,
                    onFavorite: () => _togglePhraseFavorite(p),
                    onCopy: () => _copyPhrase(p),
                    onSpeak: () {
                      // TODO: play the translation with text-to-speech.
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
