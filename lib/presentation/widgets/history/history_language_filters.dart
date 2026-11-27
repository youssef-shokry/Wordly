import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class HistoryLanguageFilters extends StatelessWidget {
  const HistoryLanguageFilters({super.key, required this.selected, required this.onSelected});

  final String selected;
  final ValueChanged<String> onSelected;

  static const filters = ['All languages', 'English ↔ Russian'];

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        for (final filter in filters) ...[
          ChoiceChip(
            label: filter == filters.last
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('English'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: SvgPicture.asset(
                          AppAssets.languageDirection,
                          width: 12,
                          height: 11,
                          colorFilter: ColorFilter.mode(
                            selected == filter ? Colors.white : AppColors.darkGrey,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const Text('Russian'),
                    ],
                  )
                : Text(filter),
            selected: selected == filter,
            onSelected: (_) => onSelected(filter),
            showCheckmark: false,
            labelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: selected == filter ? Colors.white : AppColors.darkGrey,
            ),
            backgroundColor: Colors.white,
            selectedColor: AppColors.darkBlue,
            side: BorderSide(
              color: selected == filter ? AppColors.darkBlue : AppColors.paleLavender,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            visualDensity: VisualDensity.compact,
          ),
          const SizedBox(width: 8),
        ],
      ],
    ),
  );
}
