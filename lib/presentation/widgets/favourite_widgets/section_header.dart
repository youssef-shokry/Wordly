import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:flutter/material.dart';

/// Section title + optional count badge + "See all >" link.
class SectionHeader extends StatelessWidget {
  final String title;
  final int? count;
  final VoidCallback? onSeeAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.count,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.blackJakartaSemiBoldBlack18.copyWith(fontSize: 16),
          ),
        ),
        if (count != null) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.lavenderBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$count',
              style: AppStyles.blackInterSemiBoldDarkGrey10.copyWith(
                fontSize: 12,
              ),
            ),
          ),
        ],
        const Spacer(),
        InkWell(
          onTap: onSeeAll,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('See all', style: AppStyles.blackInterSemiBoldDarkBlue12),
                const Icon(
                  Icons.chevron_right,
                  size: 16,
                  color: AppColors.darkBlue,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
