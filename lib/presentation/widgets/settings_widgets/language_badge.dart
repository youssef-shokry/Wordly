import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:flutter/material.dart';

/// Small circle showing a language code. [highlighted] = filled blue
/// (the target language), otherwise a pale circle with a blue outline.
class LanguageBadge extends StatelessWidget {
  final String code;
  final bool highlighted;

  const LanguageBadge({super.key, required this.code, this.highlighted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: highlighted ? AppColors.electricBlue : AppColors.paleBlue,
        border: highlighted
            ? null
            : Border.all(color: AppColors.lightBlue, width: 1),
      ),
      child: Text(
        code,
        style: highlighted
            ? AppStyles.blackInterSemiBoldWhite10
            : AppStyles.blackInterSemiBoldElectricBlue10,
      ),
    );
  }
}
