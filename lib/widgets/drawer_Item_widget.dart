import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../presentation/utils/app_styles.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconThemeData? iconTheme;
  final Color? color;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.iconTheme,
    this.color,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      // iconColor: AppColors.black,
      // textColor: AppColors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Icon(icon,color: color),
      title: Text(
        title,
        style: AppStyles.blackInterSemiBoldBlack14,
      ),
    );
  }
}
