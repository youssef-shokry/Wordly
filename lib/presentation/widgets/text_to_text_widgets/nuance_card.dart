import 'package:flutter/material.dart';
import '../../mock_data/mock_data.dart';
import '../../models/translation_result_model.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

export '../../models/translation_result_model.dart' show NuanceItemData;

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

    final displayItems = items.isNotEmpty ? items : MockTranslationData.defaultNuances;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.contextNuances,
                    width: 16,
                    height: 16,
                    color: iconColor,
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

        // Cards List
        ...displayItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: NuanceCard(item: item),
            )),
      ],
    );
  }
}

// Nuance Card
class NuanceCard extends StatelessWidget {
  final NuanceItemData item;

  const NuanceCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDark ? AppColors.navyBlue : AppColors.wight;
    final cardBorder = isDark
        ? AppColors.midnightBlue.withOpacity(0.8)
        : AppColors.paleLavender;
    final termColor = isDark ? AppColors.wight : AppColors.black;
    final posBg = isDark ? AppColors.midnightBlue : AppColors.paleLavender;
    final posTextColor = isDark ? AppColors.coolGray : AppColors.darkGrey;
    final targetColor = isDark ? AppColors.lightBlue : AppColors.electricBlue;
    final defColor = isDark ? AppColors.coolGray : AppColors.darkGrey;
    final quoteBg = isDark ? AppColors.deepNavy : AppColors.lightBg;
    final quoteBorder = isDark
        ? AppColors.midnightBlue.withOpacity(0.6)
        : AppColors.paleLavender;
    final quoteSourceColor = isDark ? AppColors.paleBlue : AppColors.black;
    final quoteMarkColor = isDark ? AppColors.lightBlue : AppColors.electricBlue;

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
          // Term Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    item.term,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: termColor,
                    ),
                  ),
                  const SizedBox(width: 8),
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

          // Definition
          Text(
            item.definition,
            style: TextStyle(
              fontSize: 12,
              height: 1.45,
              color: defColor,
            ),
          ),

          const SizedBox(height: 12),

          // Quote Box
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '“',
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
                        '“${item.exampleSource}”',
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
