import 'package:depi_final_project/models/language.dart';
import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/language_dropdown.dart';
import 'package:flutter/material.dart';

/// Source dropdown + swap button + target dropdown.
class LanguagePairSelector extends StatelessWidget {
  final Language source;
  final Language target;
  final ValueChanged<Language> onSourceChanged;
  final ValueChanged<Language> onTargetChanged;
  final VoidCallback onSwap;

  const LanguagePairSelector({
    super.key,
    required this.source,
    required this.target,
    required this.onSourceChanged,
    required this.onTargetChanged,
    required this.onSwap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LanguageDropdown(
            label: 'SOURCE',
            value: source,
            onChanged: onSourceChanged,
          ),
        ),
        const SizedBox(width: 6),
        InkResponse(
          onTap: onSwap,
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lavenderBg,
            ),
            child: const Icon(
              Icons.swap_horiz,
              color: AppColors.darkBlue,
              size: 22,
            ),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: LanguageDropdown(
            label: 'TARGET',
            value: target,
            highlighted: true,
            onChanged: onTargetChanged,
          ),
        ),
      ],
    );
  }
}
