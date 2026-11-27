import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'swap_language_button.dart';

/// Two language cards side by side — FROM and TO — with a swap button between them.
/// Tapping either card will eventually open a language picker sheet.
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

    // Card surface and border
    final cardBg = isDark ? AppColors.navyBlue : AppColors.wight;
    final cardBorder = isDark
        ? AppColors.midnightBlue.withOpacity(0.8)
        : AppColors.paleLavender;

    // Text colors
    final labelColor = isDark ? AppColors.coolGray : AppColors.darkGrey;
    final textColor = isDark ? AppColors.wight : AppColors.black;

    // Source language badge (subtle)
    final badgeBg = isDark ? AppColors.midnightBlue : AppColors.paleBlue;
    final badgeText = isDark ? AppColors.lightBlue : AppColors.darkBlue;

    // Target language badge (accent color)
    final targetBadgeBg = AppColors.electricBlue;
    final targetBadgeText = AppColors.wight;

    return Row(
      children: [
        // ── Source language card ──
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
                  // Language code badge
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
                        // "FROM" label
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
                        // Full language name
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

        // ── Swap button in the middle ──
        SwapLanguageButton(onTap: onSwap),
        const SizedBox(width: 8),

        // ── Target language card ──
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
                  // Target badge uses the accent color to stand out
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
                        // "TO" label
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
