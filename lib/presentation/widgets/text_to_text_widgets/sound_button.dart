import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class SoundButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isFilled;

  const SoundButton({
    super.key,
    this.onPressed,
    this.isFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (isFilled) {
      final buttonBg = isDark ? AppColors.midnightBlue : AppColors.paleLavender;
      final textColor = isDark ? AppColors.lightBlue : AppColors.electricBlue;

      return InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: buttonBg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppAssets.sound,
                width: 15,
                height: 15,
                color: textColor,
              ),
              const SizedBox(width: 6),
              Text(
                'Listen',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final iconColor = isDark ? AppColors.coolGray : AppColors.darkGrey;

    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        AppAssets.sound,
        width: 17,
        height: 17,
        color: iconColor,
      ),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
