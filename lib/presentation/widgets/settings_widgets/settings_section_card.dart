import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:flutter/material.dart';

/// White rounded card with an icon + title header, a divider and [children].
/// Used by every section of the settings screen.
class SettingsSectionCard extends StatelessWidget {
  // Icon shown at the start of the section header.
  final IconData icon;
  // Section title shown next to the icon (e.g. "Account").
  final String title;
  // The section content, placed under the header.
  final List<Widget> children;

  // Constructor: all three values are required.
  const SettingsSectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Make the card as wide as its parent.
      width: double.infinity,
      // Space between the card edge and its content.
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // White card background.
        color: AppColors.wight,
        // Rounded corners with a 16 radius.
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        // Align everything to the start (left) of the card.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row: icon + title side by side.
          Row(
            children: [
              // Section icon in the brand blue.
              Icon(icon, color: AppColors.darkBlue, size: 22),
              // Small gap between icon and title.
              const SizedBox(width: 8),
              // Section title text.
              Text(title, style: AppStyles.blackJakartaSemiBoldBlack20),
            ],
          ),
          // Gap between the header and the divider.
          const SizedBox(height: 8),
          // Thin line that separates the header from the content.
          const Divider(color: AppColors.paleLavender, height: 1),
          // Gap between the divider and the content.
          const SizedBox(height: 16),
          // Spread operator: puts every child directly inside this Column.
          ...children,
        ],
      ),
    );
  }
}
