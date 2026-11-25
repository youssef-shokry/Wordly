import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class CopyButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CopyButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? AppColors.coolGray : AppColors.darkGrey;

    return InkResponse(
      onTap: onPressed,
      radius: 18,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: SvgPicture.asset(
          AppAssets.copy,
          width: 16,
          height: 17,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
