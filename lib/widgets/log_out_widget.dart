import 'package:flutter/material.dart';
import '../presentation/utils/app_styles.dart';
import 'drawer_Item_widget.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7, left: 6),
      child: DrawerItem(
        icon: Icons.logout,
        title: 'Sign Out',
        iconTheme: AppStyles.blackIconRed15,
      ),
    );
  }
}
