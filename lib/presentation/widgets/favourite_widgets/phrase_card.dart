import 'package:depi_final_project/models/favourite_item.dart';
import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:depi_final_project/presentation/widgets/favourite_widgets/favorite_button.dart';
import 'package:depi_final_project/presentation/widgets/favourite_widgets/soft_panel.dart';
import 'package:flutter/material.dart';

/// Card for one saved vocabulary item / phrase.
class PhraseCard extends StatelessWidget {
  final FavouritePhrase phrase;
  final VoidCallback onFavorite;
  final VoidCallback onCopy;
  final VoidCallback? onSpeak;

  const PhraseCard({
    super.key,
    required this.phrase,
    required this.onFavorite,
    required this.onCopy,
    this.onSpeak,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.wight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.paleBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      phrase.sourceLanguage,
                      style: AppStyles.blackInterSemiBoldElectricBlue10
                          .copyWith(fontSize: 12),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 12,
                        color: AppColors.electricBlue,
                      ),
                    ),
                    Text(
                      phrase.targetLabel,
                      style: AppStyles.blackInterSemiBoldElectricBlue10
                          .copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                phrase.timeLabel,
                style: AppStyles.blackInterRegularDarkGrey13,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            phrase.sourceText,
            style: AppStyles.blackInterSemiBoldBlack14.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          SoftPanel(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    phrase.translatedText,
                    textDirection: TextDirection.rtl,
                    style: AppStyles.blackJakartaSemiBoldBlack20.copyWith(
                      fontWeight: FontWeight.w400,
                      height: 1.6,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onSpeak,
                icon: const Icon(
                  Icons.volume_up_outlined,
                  color: AppColors.darkGrey,
                ),
              ),
              IconButton(
                onPressed: onCopy,
                icon: const Icon(
                  Icons.content_copy_outlined,
                  color: AppColors.darkGrey,
                ),
              ),
              FavoriteButton(
                isFavorite: phrase.isFavorite,
                onPressed: onFavorite,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
