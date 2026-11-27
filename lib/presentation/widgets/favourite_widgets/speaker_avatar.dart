import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:flutter/material.dart';

/// Small circle with the speaker letter (A / B).
class SpeakerAvatar extends StatelessWidget {
  final String letter;

  const SpeakerAvatar({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.paleBlue,
        border: Border.all(color: AppColors.lightBlue),
      ),
      child: Text(
        letter,
        style: AppStyles.blackInterSemiBoldElectricBlue10.copyWith(fontSize: 12),
      ),
    );
  }
}
