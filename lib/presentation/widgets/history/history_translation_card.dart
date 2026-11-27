import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class HistoryTranslationCard extends StatelessWidget {
  const HistoryTranslationCard({
    super.key,
    required this.sourceLanguage,
    required this.targetLanguage,
    required this.sourceText,
    required this.translatedText,
    required this.timeLabel,
    required this.isFavorite,
    required this.onFavoriteChanged,
  });

  final String sourceLanguage, targetLanguage, sourceText, translatedText, timeLabel;
  final bool isFavorite;
  final ValueChanged<bool> onFavoriteChanged;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.paleLavender.withOpacity(.65)),
      boxShadow: [BoxShadow(color: AppColors.black.withOpacity(.035), blurRadius: 12, offset: const Offset(0, 4))],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
            decoration: BoxDecoration(color: AppColors.paleBlue.withOpacity(.55), borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  sourceLanguage,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.darkBlue),
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: SvgPicture.asset(
                    AppAssets.languageDirection,
                    width: 12,
                    height: 11,
                    colorFilter: const ColorFilter.mode(AppColors.darkBlue, BlendMode.srcIn),
                  ),
                ),
                Text(
                  targetLanguage,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.darkBlue),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(timeLabel, style: const TextStyle(fontSize: 11, color: AppColors.darkGrey)),
        ]),
        const SizedBox(height: 14),
        Text(sourceText, style: const TextStyle(fontSize: 13, height: 1.5, color: AppColors.black)),
        const SizedBox(height: 11),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: AppColors.lightBg, borderRadius: BorderRadius.circular(13)),
          child: Text(translatedText, style: const TextStyle(fontSize: 13, height: 1.5, color: AppColors.black)),
        ),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          _ActionIcon(icon: Icons.volume_up_outlined, label: 'Listen', onPressed: () {}),
          _ActionIcon(
            asset: AppAssets.copy,
            label: 'Copy translation',
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: translatedText));
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Copied to clipboard'), duration: Duration(seconds: 1)));
              }
            },
          ),
          _ActionIcon(
            asset: AppAssets.star,
            label: isFavorite ? 'Remove from favorites' : 'Add to favorites',
            color: isFavorite ? AppColors.darkBlue : AppColors.darkGrey,
            onPressed: () => onFavoriteChanged(!isFavorite),
          ),
        ]),
      ],
    ),
  );
}

class _ActionIcon extends StatelessWidget {
  const _ActionIcon({this.icon, this.asset, required this.label, required this.onPressed, this.color = AppColors.darkGrey});
  final IconData? icon;
  final String? asset, label;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) => IconButton(
    tooltip: label,
    onPressed: onPressed,
    visualDensity: VisualDensity.compact,
    constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
    icon: asset == null
        ? Icon(icon, size: 19, color: color)
        : SvgPicture.asset(asset!, width: 17, height: 17, colorFilter: ColorFilter.mode(color, BlendMode.srcIn)),
  );
}
