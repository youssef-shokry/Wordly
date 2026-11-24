import 'package:flutter/material.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'app_bar_widgets/wordly_logo.dart';
import 'mockup_img_widget.dart';

class WordlyAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const WordlyAppbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.darkBg : AppColors.lightBg;
    final titleStyle = isDark
        ? AppStyles.whiteJakartaSemiBoldWhite18
        : AppStyles.blackJakartaSemiBoldBlack18;
    final iconColor = isDark ? AppColors.wight : AppColors.black;

    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu_rounded, color: iconColor),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const WordlyLogoWidget(),
          const SizedBox(width: 8),
          Text('Worldly', style: titleStyle),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: MockupImgWidget(
            assetPath: AppAssets.profile,
            radius: 16,
          ),
        ),
      ],
    );
  }
}
