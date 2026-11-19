import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:flutter/material.dart';

/// White rounded card with an icon + title header, a divider and [children].
/// Used by every section of the settings screen.
class SettingsSectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;

  const SettingsSectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.wight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.darkBlue, size: 22),
              const SizedBox(width: 8),
              Text(title, style: AppStyles.blackJakartaSemiBoldBlack20),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(color: AppColors.paleLavender, height: 1),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}
