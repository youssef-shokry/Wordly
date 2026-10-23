import 'package:depi_final_project/presentation/utils/app_styles.dart';
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
          Image.asset('assets/images/worldly_logo_transparent.png', height: 40),
          SizedBox(width: 5),
          Text('Wordly', style: AppStyles.blackJakartaRegularBlack20),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/bitmoji_avatar.png'),
          ),
        ),
      ],
    );
  }
}
