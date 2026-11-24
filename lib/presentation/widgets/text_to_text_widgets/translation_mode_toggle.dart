import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class TranslationModeToggle extends StatelessWidget {
  final bool isTextMode;
  final ValueChanged<bool>? onModeChanged;

  const TranslationModeToggle({
    super.key,
    this.isTextMode = true,
    this.onModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final containerBg = isDark
        ? AppColors.midnightBlue.withOpacity(0.5)
        : AppColors.lavenderBg.withOpacity(0.6);
    final containerBorder = isDark
        ? AppColors.midnightBlue.withOpacity(0.8)
        : Colors.transparent;
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
                  ],
                ),
              ),
            ),
          ),
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
                    Image.asset(
                      AppAssets.liveSpeech,
                      width: 17,
                      height: 15,
                      color: !isTextMode ? activeTextColor : inactiveTextColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Live Speech',
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
