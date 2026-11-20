import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

/// Soft lavender rounded panel that stacks [children] with a thin divider
/// between them (speaker lines, translation box...).
class SoftPanel extends StatelessWidget {
  final List<Widget> children;

  const SoftPanel({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.paleLavender,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) const Divider(height: 1, color: AppColors.lavenderBg),
            children[i],
          ],
        ],
      ),
    );
  }
}
