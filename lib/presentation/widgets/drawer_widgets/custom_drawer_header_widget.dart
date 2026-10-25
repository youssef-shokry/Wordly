import 'package:flutter/material.dart';
import '../../utils/app_styles.dart';

class CustomDrawerHeader extends StatelessWidget {

  const CustomDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            'Wordly',
            style: AppStyles.blackJakartaSemiBoldDarkBlue18,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}