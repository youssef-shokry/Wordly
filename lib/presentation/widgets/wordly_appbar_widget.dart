import 'package:depi_final_project/presentation/utils/app_assets.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';

import 'package:flutter/material.dart';

import 'app_bar_widgets/wordly_logo.dart';
import 'mockup_img_widget.dart';

class WordlyAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const WordlyAppbarWidget({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xfff9f8ff),
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          WordlyLogoWidget(),
          SizedBox(width: 10),
          Text('Wordly', style: AppStyles.blackJakartaSemiBoldBlack18),
        ],
      ),
      actions: [
        MockupImgWidget(assetPath: AppAssets.profile,padding: 6,)
      ],
    );
  }
}
