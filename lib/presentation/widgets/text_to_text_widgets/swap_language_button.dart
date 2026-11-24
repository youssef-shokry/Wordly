import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class SwapLanguageButton extends StatelessWidget {
  final VoidCallback? onTap;

  const SwapLanguageButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final buttonBg = isDark ? AppColors.electricBlue : AppColors.darkBlue;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: buttonBg,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: buttonBg.withOpacity(0.35),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            AppAssets.swap,
            width: 17,
            height: 14,
            color: AppColors.wight,
          ),
        ),
      ),
    );
  }
}
