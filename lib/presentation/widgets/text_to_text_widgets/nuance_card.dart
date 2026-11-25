import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../mock_data/mock_data.dart';
import '../../models/translation_result_model.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

export '../../models/translation_result_model.dart' show NuanceItemData;

/// Section header + scrollable list of nuance cards.
/// Falls back to default mock nuances when no items are passed in.
class ContextAndNuancesSection extends StatelessWidget {
  final int extractedTermsCount;
  final List<NuanceItemData> items;

  const ContextAndNuancesSection({
    super.key,
    this.extractedTermsCount = 2,
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final titleColor = isDark ? AppColors.wight : AppColors.black;
    final countColor = isDark ? AppColors.coolGray : AppColors.darkGrey;
    final iconColor = isDark ? AppColors.lightBlue : AppColors.electricBlue;

    // Use real data when available, otherwise show defaults
    final displayItems = items.isNotEmpty ? items : MockTranslationData.defaultNuances;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Section header: "Context & Nuances" + term count ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // AI brain icon
                  SvgPicture.asset(
                    AppAssets.contextNuances,
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    AppConstants.contextNuances,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),
                  ),
                ],
              ),
              // How many terms were extracted
              Text(
                '${displayItems.length} ${AppConstants.extractedTerms}',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: countColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // ── One card per nuance item ──
        ...displayItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: NuanceCard(item: item),
            )),
      ],
    );
  }
}

/// Single nuance card: term → translation, part of speech, definition, and an example quote.
class NuanceCard extends StatelessWidget {
  final NuanceItemData item;

  const NuanceCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Card surface
    final cardBg = isDark ? AppColors.navyBlue : AppColors.wight;
    final cardBorder = isDark
        ? AppColors.midnightBlue.withOpacity(0.8)
        : AppColors.paleLavender;

    // Text colors
    final termColor = isDark ? AppColors.wight : AppColors.black;
    final targetColor = isDark ? AppColors.lightBlue : AppColors.electricBlue;
    final defColor = isDark ? AppColors.coolGray : AppColors.darkGrey;

    // Part-of-speech badge
    final posBg = isDark ? AppColors.midnightBlue : AppColors.paleLavender;
    final posTextColor = isDark ? AppColors.coolGray : AppColors.darkGrey;

    // Example quote block
    final quoteBg = isDark ? AppColors.deepNavy : AppColors.lightBg;
    final quoteBorder = isDark
        ? AppColors.midnightBlue.withOpacity(0.6)
        : AppColors.paleLavender;
    final quoteSourceColor = isDark ? AppColors.paleBlue : AppColors.black;
    final quoteMarkColor = isDark ? AppColors.lightBlue : AppColors.electricBlue;

    // Auto-detect RTL in the translated term
    final isTargetRtl = RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]')
        .hasMatch(item.translatedTerm);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: cardBorder),
        boxShadow: !isDark
            ? [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Term header: source word | POS badge | translated word ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Source-language term
                  Text(
                    item.term,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: termColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Part of speech (noun / verb / adj …)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(
                      color: posBg,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      item.partOfSpeech,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: posTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              // Translated term in the target language
              Directionality(
                textDirection: isTargetRtl ? TextDirection.rtl : TextDirection.ltr,
                child: Text(
                  item.translatedTerm,
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold,
                    color: targetColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ── Short definition of the term ──
          Text(
            item.definition,
            style: TextStyle(
              fontSize: 12,
              height: 1.45,
              color: defColor,
            ),
          ),

          const SizedBox(height: 12),

          // ── Example usage in source and target language ──
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: quoteBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: quoteBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Source-language example sentence
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u201C',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: quoteMarkColor,
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '\u201C${item.exampleSource}\u201D',
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                          color: quoteSourceColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // Target-language translation of the example
                Directionality(
                  textDirection: isTargetRtl ? TextDirection.rtl : TextDirection.ltr,
                  child: Align(
                    alignment: isTargetRtl ? Alignment.centerRight : Alignment.centerLeft,
                    child: Text(
                      '"${item.exampleTarget}"',
                      style: TextStyle(
                        fontSize: 11.5,
                        height: 1.4,
                        color: defColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
