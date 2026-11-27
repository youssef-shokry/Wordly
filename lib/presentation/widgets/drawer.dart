import 'package:depi_final_project/presentation/utils/app_assets.dart';
import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../screens/text_translation_history_screen.dart';
import 'wordly_appbar_widget.dart';
import 'drawer_widgets/custom_drawer_header_widget.dart';
import 'drawer_widgets/drawer_Item_widget.dart';
import 'drawer_widgets/profile_list_tile_widget.dart';
import 'drawer_widgets/switch_drawer_widget.dart';

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
            ProfileListTile(name: 'Elena Vance',assetPath:AppAssets.profile ,jobTitle: 'Lead Localization',),
            Divider(color: AppColors.paleLavender),
            DrawerItem(
              icon: Icons.translate,
              title: 'Translate',
              onTap: () => Navigator.of(context).pop(),
            ),
            DrawerItem(
              icon: Icons.history,
              title: 'History',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => Scaffold(
                      appBar: const WordlyAppbarWidget(),
                      drawer: const WordlyDrawer(),
                      body: const TextTranslationHistoryScreen(),
                    ),
                  ),
                );
              },
            ),
            DrawerItem(icon: Icons.star_border, title: 'Favourites'),
            SwitchDrawerWidget(icon: Icons.auto_awesome, title: 'Floating Assistant',),
            DrawerItem(icon: Icons.settings, title: 'Settings'),
            Spacer(),
            Divider(color: AppColors.paleLavender),
            DrawerItem(icon: Icons.logout,color: AppColors.red, title: 'Sign Out',),
          ],
        ),
      ),
    );
  }
}
