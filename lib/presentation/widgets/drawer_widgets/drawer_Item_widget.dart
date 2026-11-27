import 'package:flutter/material.dart';
import '../../utils/app_styles.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconThemeData? iconTheme;
  final Color? color;
  final VoidCallback? onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.iconTheme,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Icon(icon,color: color),
      title: Text(
        title,
        style: AppStyles.blackInterSemiBoldBlack14,
      ),
    );
  }
}
