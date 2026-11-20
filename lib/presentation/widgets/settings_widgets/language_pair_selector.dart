import 'package:depi_final_project/models/language.dart';
import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/language_dropdown.dart';
import 'package:flutter/material.dart';

/// Source dropdown + swap button + target dropdown.
class LanguagePairSelector extends StatelessWidget {
  final Language source;
  final Language target;
  final List<Language> languages;
  final ValueChanged<Language> onSourceChanged;
  final ValueChanged<Language> onTargetChanged;
  final VoidCallback onSwap;

  const LanguagePairSelector({
    super.key,
    required this.source,
    required this.target,
    required this.languages,
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
            language: source,
            languages: languages,
            onChanged: onSourceChanged,
          ),
        ),
        const SizedBox(width: 6),
        Material(
          color: AppColors.lavenderBg,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onSwap,
            child: const SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.swap_horiz,
                color: AppColors.darkBlue,
                size: 22,
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: LanguageDropdown(
            label: 'TARGET',
            language: target,
            languages: languages,
            onChanged: onTargetChanged,
            highlighted: true,
          ),
        ),
      ],
    );
  }
}
