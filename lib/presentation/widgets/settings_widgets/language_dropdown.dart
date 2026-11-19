import 'package:depi_final_project/models/language.dart';
import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/language_option.dart';
import 'package:flutter/material.dart';

/// Lavender dropdown field for picking a [Language].
/// The three selectors on the settings screen (source, target, interface)
/// are all instances of this widget.
class LanguageDropdown extends StatelessWidget {
  final Language value;
  final ValueChanged<Language> onChanged;
  final List<Language> languages;
  final String? label;
  final bool showBadge;
  final bool highlighted;

  const LanguageDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    this.languages = Languages.all,
    this.label,
    this.showBadge = true,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.paleLavender,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Language>(
          value: value,
          isExpanded: true,
          dropdownColor: AppColors.wight,
          borderRadius: BorderRadius.circular(12),
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.darkGrey),
          items: [
            for (final language in languages)
              DropdownMenuItem(
                value: language,
                child: LanguageOption(
                  language: language,
                  showBadge: showBadge,
                  highlighted: highlighted,
                ),
              ),
          ],
          selectedItemBuilder: (_) => [
            for (final language in languages)
              LanguageOption(
                language: language,
                label: label,
                showBadge: showBadge,
                highlighted: highlighted,
              ),
          ],
          onChanged: (language) {
            if (language != null) onChanged(language);
          },
        ),
      ),
    );
  }
}
