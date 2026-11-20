import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:depi_final_project/presentation/widgets/mockup_img_widget.dart';
import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  final String name;
  final String email;
  final String assetPath;

  const UserInfoCard({
    super.key,
    required this.name,
    required this.email,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.paleLavender,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          MockupImgWidget(assetPath: assetPath, radius: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppStyles.blackJakartaSemiBoldBlack18),
                Text(
                  email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.blackInterRegularDarkGrey13,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
