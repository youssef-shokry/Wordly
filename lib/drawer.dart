import 'package:depi_final_project/presentation/utils/app_assets.dart';
import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:depi_final_project/widgets/custom_drawer_header_widget.dart';
import 'package:depi_final_project/widgets/drawer_Item_widget.dart';
import 'package:depi_final_project/widgets/profile_list_tile_widget.dart';
import 'package:depi_final_project/widgets/switch_drawer_widget.dart';
import 'package:flutter/material.dart';

class WordlyDrawer extends StatefulWidget {
  const WordlyDrawer({super.key});
  @override
  State<WordlyDrawer> createState() => _WordlyDrawerState();
}
class _WordlyDrawerState extends State<WordlyDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(25),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            CustomDrawerHeader(),
            ProfileListTile(name: 'Elena Vance',assetPath:AppAssets.mockupImg ,jobTitle: 'Lead Localization',),
            Divider(color: Color(0xffedf0ff)),
            DrawerItem(icon: Icons.translate, title: 'Translate'),
            DrawerItem(icon: Icons.history, title: 'History'),
            DrawerItem(icon: Icons.star_border, title: 'Favourites'),
            SwitchDrawerWidget(icon: Icons.auto_awesome, title: 'Floating Assistant',),
            DrawerItem(icon: Icons.settings, title: 'Settings'),
            Spacer(),
            Divider(color: Color(0xffedf0ff)),
            DrawerItem(icon: Icons.logout,color: AppColors.red, title: 'Sign Out',),
          ],
        ),
      ),
    );
  }
}
