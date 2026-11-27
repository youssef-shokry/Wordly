import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

/// Segmented toggle that switches between Text and Live Speech modes.
/// The active tab gets a filled background; the inactive one is transparent.
class TranslationModeToggle extends StatelessWidget {
  final bool isTextMode;
  final ValueChanged<bool>? onModeChanged;
  final int? textCount;
  final int? liveSpeechCount;

  const TranslationModeToggle({
    super.key,
    this.isTextMode = true,
    this.onModeChanged,
    this.textCount,
    this.liveSpeechCount,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Pill container colors
    final containerBg = isDark
        ? AppColors.midnightBlue.withOpacity(0.5)
        : AppColors.lavenderBg.withOpacity(0.6);
    final containerBorder = isDark
        ? AppColors.midnightBlue.withOpacity(0.8)
        : Colors.transparent;

    // Active tab looks raised; inactive tab is flat
    final activeBg = isDark ? AppColors.midnightBlue : AppColors.wight;
    final activeTextColor = isDark ? AppColors.lightBlue : AppColors.darkBlue;
    final inactiveTextColor = isDark ? AppColors.coolGray : AppColors.darkGrey;

    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: containerBg,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: containerBorder),
      ),
      child: Row(
        children: [
          // ── Text Mode tab ──
          Expanded(
            child: GestureDetector(
              onTap: () => onModeChanged?.call(true),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isTextMode ? activeBg : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: isTextMode && !isDark
                      ? [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notes_rounded,
                      size: 16,
                      color: isTextMode ? activeTextColor : inactiveTextColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Text',
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: isTextMode
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: isTextMode ? activeTextColor : inactiveTextColor,
                      ),
                    ),
                    if (textCount != null) ...[
                      const SizedBox(width: 6),
                      _ModeCountBadge(count: textCount!, isActive: isTextMode),
                    ],
                  ],
                ),
              ),
            ),
          ),

          // ── Live Speech tab ──
          Expanded(
            child: GestureDetector(
              onTap: () => onModeChanged?.call(false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: !isTextMode ? activeBg : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: !isTextMode && !isDark
                      ? [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.liveSpeech,
                      width: 17,
                      height: 15,
                      colorFilter: ColorFilter.mode(
                        !isTextMode ? activeTextColor : inactiveTextColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Flexible prevents overflow on small screens
                    Flexible(
                      child: Text(
                        'Live Speech',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: !isTextMode
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: !isTextMode
                              ? activeTextColor
                              : inactiveTextColor,
                        ),
                      ),
                    ),
                    if (liveSpeechCount != null) ...[
                      const SizedBox(width: 6),
                      _ModeCountBadge(
                        count: liveSpeechCount!,
                        isActive: !isTextMode,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModeCountBadge extends StatelessWidget {
  const _ModeCountBadge({required this.count, required this.isActive});

  final int count;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: isActive
            ? (isDark ? AppColors.midnightBlue : AppColors.paleBlue)
            : (isDark ? AppColors.navyBlue : AppColors.lavenderBg),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$count',
        style: TextStyle(
          fontSize: 10,
          height: 1,
          fontWeight: FontWeight.w700,
          color: isActive
              ? (isDark ? AppColors.lightBlue : AppColors.darkBlue)
              : (isDark ? AppColors.coolGray : AppColors.darkGrey),
        ),
      ),
    );
  }
}
