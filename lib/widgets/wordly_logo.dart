import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WordlyLogoWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const WordlyLogoWidget({super.key,this.height =22 ,this.width=27});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset( 'assets/images/wordly_logo.svg',);
  }
}

