import 'package:depi_final_project/presentation/utils/app_assets.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:depi_final_project/widgets/mockup_img_widget.dart';
import 'package:depi_final_project/widgets/wordly_logo.dart';
import 'package:flutter/material.dart';

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
          SizedBox(width: 5),
          Text('Wordly', style: AppStyles.blackJakartaSemiBoldBlack18),
        ],
      ),
      actions: [
        MockupImgWidget(assetPath: AppAssets.mockupImg,padding: 6,)
      ],
    );
  }
}
