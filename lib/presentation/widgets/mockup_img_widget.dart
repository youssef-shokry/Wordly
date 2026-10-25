import 'package:flutter/material.dart';

class MockupImgWidget extends StatelessWidget {
  final String assetPath;
  final double? radius;
  final double? width;
  final double? height;
  final double? padding;
  const MockupImgWidget({super.key, required this.assetPath, this.radius, this.padding=8, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return
       CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(assetPath),
      );
  }
}
