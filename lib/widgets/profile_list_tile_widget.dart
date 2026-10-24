import 'package:depi_final_project/widgets/mockup_img_widget.dart';
import 'package:flutter/material.dart';
import '../presentation/utils/app_styles.dart';

class ProfileListTile extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String assetPath;

  const ProfileListTile({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: MockupImgWidget(
        assetPath: assetPath,
        height: 48,
        width: 48,
      ),
      title: Text(
        name,
        style: AppStyles.blackInterSemiBoldBlack14,
      ),
      subtitle: Text(
        jobTitle,
        style: AppStyles.whiteInterRegularDarkGrey12,
      ),
    );
  }
}