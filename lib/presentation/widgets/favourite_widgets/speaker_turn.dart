import 'package:depi_final_project/models/favourite_item.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:depi_final_project/presentation/widgets/favourite_widgets/speaker_avatar.dart';
import 'package:flutter/material.dart';

/// One speaker line inside a dialogue card: avatar, speaker label,
/// the spoken text and an optional translation underneath.
class SpeakerTurn extends StatelessWidget {
  final DialogueTurn turn;

  const SpeakerTurn({super.key, required this.turn});

  @override
  Widget build(BuildContext context) {
    final direction = turn.isRtl ? TextDirection.rtl : TextDirection.ltr;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpeakerAvatar(letter: turn.speaker),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Speaker ${turn.speaker} (${turn.languageName})',
                  style: AppStyles.blackInterSemiBoldElectricBlue10.copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    turn.text,
                    textDirection: direction,
                    style: AppStyles.blackInterSemiBoldBlack14.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (turn.translation != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    turn.translation!,
                    style: AppStyles.blackInterRegularDarkGrey13,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
