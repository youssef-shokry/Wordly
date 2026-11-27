import 'package:depi_final_project/models/favourite_item.dart';
import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:depi_final_project/presentation/widgets/favourite_widgets/audio_player_bar.dart';
import 'package:depi_final_project/presentation/widgets/favourite_widgets/favorite_button.dart';
import 'package:depi_final_project/presentation/widgets/favourite_widgets/info_chip.dart';
import 'package:depi_final_project/presentation/widgets/favourite_widgets/speaker_turn.dart';
import 'package:depi_final_project/presentation/widgets/favourite_widgets/soft_panel.dart';
import 'package:flutter/material.dart';

/// Card for one saved speech / voice dialogue.
class DialogueCard extends StatelessWidget {
  final FavouriteDialogue dialogue;
  final VoidCallback onFavorite;
  final VoidCallback? onOpenTranscript;
  final VoidCallback? onDelete;

  const DialogueCard({
    super.key,
    required this.dialogue,
    required this.onFavorite,
    this.onOpenTranscript,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.wight,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.electricBlue, AppColors.paleBlue],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dialogue.dateLabel,
                            style: AppStyles.blackInterRegularDarkGrey13,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            dialogue.title,
                            style: AppStyles.blackJakartaSemiBoldBlack20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    FavoriteButton(
                      circled: true,
                      isFavorite: dialogue.isFavorite,
                      onPressed: onFavorite,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    InfoChip(
                      icon: Icons.swap_horiz,
                      label:
                          '${dialogue.sourceLanguage} ↔ ${dialogue.targetLanguage}',
                    ),
                    InfoChip(
                      icon: Icons.schedule,
                      label: '${dialogue.durationLabel} min',
                    ),
                    InfoChip(
                      icon: Icons.forum_outlined,
                      label: '${dialogue.turnCount} turns',
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SoftPanel(
                  children: [
                    for (final turn in dialogue.preview) SpeakerTurn(turn: turn),
                  ],
                ),
                const SizedBox(height: 12),
                AudioPlayerBar(
                  total: dialogue.total,
                  initialPosition: dialogue.position,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: onOpenTranscript,
                      icon: const Icon(
                        Icons.subject,
                        size: 20,
                        color: AppColors.black,
                      ),
                      label: Text(
                        'Open Full Transcript',
                        style: AppStyles.blackInterSemiBoldBlack14,
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.lavenderBg,
                        minimumSize: const Size(0, 44),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: onDelete,
                      icon: const Icon(
                        Icons.delete_outline,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
