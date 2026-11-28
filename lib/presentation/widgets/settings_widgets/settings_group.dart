import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

/// Rounded container that stacks [children] separated by dividers.
/// [filled] gives it the soft lavender background (no border),
/// otherwise it is a white box with a thin border.
class SettingsGroup extends StatelessWidget {
  // The widgets (usually tiles) shown inside the group.
  final List<Widget> children;
  // true = lavender background without border, false = white with border.
  final bool filled;

  // Constructor: children is required, filled defaults to false.
  const SettingsGroup({super.key, required this.children, this.filled = false});

  @override
  Widget build(BuildContext context) {
    // Will hold the children AND the dividers placed between them.
    final items = <Widget>[];
    // Go through every child by its index.
    for (var i = 0; i < children.length; i++) {
      // No divider before the first child, only between children.
      if (i > 0) {
        // Thin 1px line that separates two neighbouring children.
        items.add(const Divider(height: 1, color: AppColors.lavenderBg));
      }
      // Add the current child after its divider.
      items.add(children[i]);
    }

    return Container(
      // Cut anything inside so it follows the rounded corners.
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        // Lavender when filled, white otherwise.
        color: filled ? AppColors.paleLavender : AppColors.wight,
        // Rounded corners with a 12 radius.
        borderRadius: BorderRadius.circular(12),
        // Border only appears when the group is NOT filled.
        border: filled ? null : Border.all(color: AppColors.lavenderBg),
      ),
      // Stack children and dividers vertically.
      child: Column(children: items),
    );
  }
}
