import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class EmptyStateHero extends StatelessWidget {
  const EmptyStateHero({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final badgeBg = isDark
        ? AppColors.midnightBlue.withOpacity(0.5)
        : AppColors.paleBlue.withOpacity(0.5);
    final badgeBorder = isDark
        ? AppColors.midnightBlue
        : AppColors.lavender.withOpacity(0.5);
    final titleColor = isDark ? AppColors.wight : AppColors.black;
    final subtitleColor = isDark ? AppColors.coolGray : AppColors.darkGrey;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Hero Badge
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: badgeBg,
              shape: BoxShape.circle,
              border: Border.all(color: badgeBorder),
            ),
            child: Center(
              child: Image.asset(
                AppAssets.translateSymbol,
                width: 28,
                height: 25,
                color: isDark ? AppColors.lightBlue : AppColors.electricBlue,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Headline
          Text(
            AppConstants.readyToExplore,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.3,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 8),

          // Subtitle
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 280),
            child: Text(
              AppConstants.readyToExploreDesc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.5,
                height: 1.45,
                color: subtitleColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
