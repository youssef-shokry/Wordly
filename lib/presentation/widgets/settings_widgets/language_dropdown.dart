import 'package:depi_final_project/models/language.dart';
import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/language_option.dart';
import 'package:flutter/material.dart';

/// Lavender working dropdown that lets the user pick a [Language].
/// The three selectors on the settings screen (source, target, interface)
/// are all instances of this widget.
class LanguageDropdown extends StatelessWidget {
  final Language language;
  final List<Language> languages;
  final ValueChanged<Language> onChanged;
  final String? label;
  final bool showBadge;
  final bool highlighted;

  const LanguageDropdown({
    super.key,
    required this.language,
    required this.languages,
    required this.onChanged,
    this.label,
    this.showBadge = true,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    // Match by code so the value is always one of the items in the list.
    final selected = languages.firstWhere(
      (l) => l.code == language.code,
      orElse: () => languages.first,
    );

    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.paleLavender,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Language>(
          value: selected,
          isExpanded: true,
          borderRadius: BorderRadius.circular(12),
          dropdownColor: AppColors.wight,
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.darkGrey),
          selectedItemBuilder: (_) => languages
              .map(
                (l) => LanguageOption(
                  language: l,
                  label: label,
                  showBadge: showBadge,
                  highlighted: highlighted,
                ),
              )
              .toList(),
          items: languages
              .map(
                (l) => DropdownMenuItem<Language>(
                  value: l,
                  child: LanguageOption(
                    language: l,
                    showBadge: showBadge,
                    highlighted: highlighted && l.code == selected.code,
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) onChanged(value);
          },
        ),
      ),
    );
  }
}
