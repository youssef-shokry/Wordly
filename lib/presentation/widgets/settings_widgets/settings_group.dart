import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

/// Rounded container that stacks [children] separated by dividers.
/// [filled] gives it the soft lavender background (no border),
/// otherwise it is a white box with a thin border.
class SettingsGroup extends StatelessWidget {
  final List<Widget> children;
  final bool filled;

  const SettingsGroup({super.key, required this.children, this.filled = false});

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0) {
        items.add(const Divider(height: 1, color: AppColors.lavenderBg));
      }
      items.add(children[i]);
    }

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: filled ? AppColors.paleLavender : AppColors.wight,
        borderRadius: BorderRadius.circular(12),
        border: filled ? null : Border.all(color: AppColors.lavenderBg),
      ),
      child: Column(children: items),
    );
  }
}
