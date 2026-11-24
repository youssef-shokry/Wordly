import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'swap_language_button.dart';

class LanguageSelectorCard extends StatelessWidget {
  final String sourceLangCode;
  final String sourceLangTitle;
  final String targetLangCode;
  final String targetLangTitle;
  final VoidCallback? onSwap;
  final VoidCallback? onSelectSource;
  final VoidCallback? onSelectTarget;

  const LanguageSelectorCard({
    super.key,
    this.sourceLangCode = 'EN',
    String? sourceLangTitle,
    String? sourceLangName,
    this.targetLangCode = 'AR',
    String? targetLangTitle,
    String? targetLangName,
    this.onSwap,
    this.onSelectSource,
    this.onSelectTarget,
  })  : sourceLangTitle = sourceLangTitle ?? sourceLangName ?? 'English (US)',
        targetLangTitle = targetLangTitle ?? targetLangName ?? 'العربية';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDark ? AppColors.navyBlue : AppColors.wight;
    final cardBorder = isDark
        ? AppColors.midnightBlue.withOpacity(0.8)
        : AppColors.paleLavender;
    final labelColor = isDark ? AppColors.coolGray : AppColors.darkGrey;
    final textColor = isDark ? AppColors.wight : AppColors.black;
    final badgeBg = isDark ? AppColors.midnightBlue : AppColors.paleBlue;
    final badgeText = isDark ? AppColors.lightBlue : AppColors.darkBlue;
    final targetBadgeBg = isDark ? AppColors.electricBlue : AppColors.electricBlue;
    final targetBadgeText = AppColors.wight;

    return Row(
      children: [
        // Source Card
        Expanded(
          child: GestureDetector(
            onTap: onSelectSource,
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: cardBorder),
                boxShadow: !isDark
                    ? [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.03),
                          blurRadius: 6,
                          offset: const Offset(0, 1),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: badgeBg,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: badgeText.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      sourceLangCode,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: badgeText,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'FROM',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                            color: labelColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          sourceLangTitle,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 18,
                    color: labelColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Swap Button
        SwapLanguageButton(onTap: onSwap),

        const SizedBox(width: 8),

        // Target Card
        Expanded(
          child: GestureDetector(
            onTap: onSelectTarget,
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: cardBorder),
                boxShadow: !isDark
                    ? [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.03),
                          blurRadius: 6,
                          offset: const Offset(0, 1),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: targetBadgeBg,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      targetLangCode,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: targetBadgeText,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'TO',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                            color: labelColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          targetLangTitle,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 18,
                    color: labelColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
