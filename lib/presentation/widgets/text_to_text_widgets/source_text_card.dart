import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'sound_button.dart';

class SourceTextCard extends StatelessWidget {
  final String languageName;
  final String sourceText;
  final int charCount;
  final int maxCharacters;
  final VoidCallback? onClear;
  final VoidCallback? onListen;

  const SourceTextCard({
    super.key,
    this.languageName = 'English',
    required this.sourceText,
    this.charCount = 65,
    this.maxCharacters = 5000,
    this.onClear,
    this.onListen,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDark ? AppColors.navyBlue : AppColors.wight;
    final cardBorder = isDark ? AppColors.midnightBlue : AppColors.lavenderBg;
    final textColor = isDark ? AppColors.wight : AppColors.black;
    final subtitleColor = isDark ? AppColors.coolGray : AppColors.darkGrey;
    final langColor = isDark ? AppColors.lightBlue : AppColors.electricBlue;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: langColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    languageName.toUpperCase(),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      color: langColor,
                    ),
                  ),
                ],
              ),
              if (onClear != null)
                GestureDetector(
                  onTap: onClear,
                  child: Icon(
                    Icons.close_rounded,
                    size: 18,
                    color: subtitleColor,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),

          // Source Text
          Text(
            sourceText,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 1.5,
              color: textColor,
            ),
          ),
          const SizedBox(height: 12),

          // Bottom Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$charCount / $maxCharacters',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: subtitleColor,
                ),
              ),
              SoundButton(onPressed: onListen),
            ],
          ),
        ],
      ),
    );
  }
}
