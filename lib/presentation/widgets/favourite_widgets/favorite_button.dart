import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

/// Star toggle. [circled] puts it inside a lavender circle (dialogue card),
/// otherwise it is a plain icon button (phrase card).
class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onPressed;
  final bool circled;

  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onPressed,
    this.circled = false,
  });

  @override
  Widget build(BuildContext context) {
    final icon = Icon(
      isFavorite ? Icons.star_rounded : Icons.star_border_rounded,
      color: isFavorite ? AppColors.darkBlue : AppColors.darkGrey,
    );

    if (!circled) {
      return IconButton(onPressed: onPressed, icon: icon);
    }

    return Material(
      color: AppColors.lavenderBg,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(width: 40, height: 40, child: icon),
      ),
    );
  }
}
