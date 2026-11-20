import 'package:depi_final_project/models/language.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/language_badge.dart';
import 'package:flutter/material.dart';

/// Content of one language entry: optional badge, optional small [label]
/// (SOURCE / TARGET) above the language name.
/// Used both for the selected value and for the dropdown menu items.
class LanguageOption extends StatelessWidget {
  final Language language;
  final String? label;
  final bool showBadge;
  final bool highlighted;

  const LanguageOption({
    super.key,
    required this.language,
    this.label,
    this.showBadge = true,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showBadge) ...[
          LanguageBadge(code: language.code, highlighted: highlighted),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label != null)
                Text(label!, style: AppStyles.blackInterSemiBoldDarkGrey10),
              Text(
                language.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.blackInterSemiBoldBlack14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
