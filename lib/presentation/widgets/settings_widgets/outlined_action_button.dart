import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OutlinedActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const OutlinedActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.black, size: 20),
        label: Text(label, style: AppStyles.blackInterSemiBoldBlack14),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.coolGray),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
