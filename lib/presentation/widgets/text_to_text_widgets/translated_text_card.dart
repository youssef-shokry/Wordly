import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import 'copy_button.dart';
import 'sound_button.dart';

/// Card that displays the translated output.
/// Has a thin accent stripe on top, language metadata, the translated text,
/// a romanization line (transliteration), and Listen / Favorite / Copy controls.
class TranslatedTextCard extends StatefulWidget {
  final String targetLangTitle;
  final String targetLangSubtitle;
  final String targetLangBanner;
  final String translatedText;
  final String transliterationText;
  final bool isVerified;
  final VoidCallback? onListen;
  final VoidCallback? onCopy;
  final ValueChanged<bool>? onFavoriteToggle;

  const TranslatedTextCard({
    super.key,
    this.targetLangTitle = 'Arabic',
    this.targetLangSubtitle = 'العربية',
    this.targetLangBanner = 'Modern Standard',
    required this.translatedText,
    required this.transliterationText,
    this.isVerified = true,
    this.onListen,
    this.onCopy,
    this.onFavoriteToggle,
  });

  @override
  State<TranslatedTextCard> createState() => _TranslatedTextCardState();
}

class _TranslatedTextCardState extends State<TranslatedTextCard> {
  // Tracks whether the user has starred this translation
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Card surface and borders
    final cardBg = isDark ? AppColors.navyBlue : AppColors.wight;
    final cardBorder = isDark
        ? AppColors.midnightBlue.withOpacity(0.8)
        : AppColors.paleLavender;
    final dividerColor = isDark
        ? AppColors.midnightBlue.withOpacity(0.6)
        : AppColors.paleLavender;

    // Text colors
    final titleColor = isDark ? AppColors.lightBlue : AppColors.electricBlue;
    final translatedTextColor = isDark ? AppColors.wight : AppColors.black;
    final transliterationColor = isDark ? AppColors.coolGray : AppColors.darkGrey;
    final metaColor = isDark ? AppColors.coolGray : AppColors.darkGrey;

    // "Verified" badge styling
    final verifiedBg = isDark
        ? AppColors.darkGreen.withOpacity(0.25)
        : AppColors.paleGreen;
    final verifiedBorder = isDark
        ? AppColors.darkGreen.withOpacity(0.5)
        : AppColors.darkGreen.withOpacity(0.3);
    final verifiedColor = AppColors.darkGreen;

    // Star icon color — blue when saved, grey when not
    final favoriteColor = isFavorite ? AppColors.lightBlue : metaColor;

    // Detect Arabic / RTL script in the translated text
    final isRtl = RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]')
        .hasMatch(widget.translatedText);

    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: cardBorder),
        boxShadow: !isDark
            ? [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Thin accent stripe at the very top of the card
            Container(
              height: 2.5,
              color: isDark ? AppColors.lightBlue : AppColors.electricBlue,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Language name + "Verified" badge + dialect banner ──
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Language name — combines title and native script subtitle
                          Text(
                            widget.targetLangSubtitle.isNotEmpty
                                ? '${widget.targetLangTitle} (${widget.targetLangSubtitle})'
                                : widget.targetLangTitle,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: titleColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          // "Verified" pill — only shown when the translation is confirmed
                          if (widget.isVerified)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                              decoration: BoxDecoration(
                                color: verifiedBg,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: verifiedBorder),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline_rounded,
                                    size: 12,
                                    color: verifiedColor,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    'Verified',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: verifiedColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      // Dialect / variant label (e.g. "Modern Standard")
                      Text(
                        widget.targetLangBanner,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: metaColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  Divider(color: dividerColor, height: 1),
                  const SizedBox(height: 12),

                  // ── The translated text itself ──
                  // RTL languages get bigger font + looser line height
                  Directionality(
                    textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                    child: Text(
                      widget.translatedText,
                      style: TextStyle(
                        fontSize: isRtl ? 19 : 17,
                        fontWeight: FontWeight.bold,
                        height: isRtl ? 1.7 : 1.5,
                        color: translatedTextColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // ── Phonetic romanization, shown in quotes when available ──
                  if (widget.transliterationText.isNotEmpty)
                    Text(
                      '"${widget.transliterationText}"',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        height: 1.45,
                        color: transliterationColor,
                      ),
                    ),

                  const SizedBox(height: 12),
                  Divider(color: dividerColor, height: 1),
                  const SizedBox(height: 10),

                  // ── Bottom controls: Listen on the left, Favorite + Copy on the right ──
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Audio playback controls
                      Row(
                        children: [
                          // "Listen" pill button
                          SoundButton(
                            isFilled: true,
                            onPressed: widget.onListen,
                          ),
                          const SizedBox(width: 8),
                          // Slow-read / playback icon (placeholder for now)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_circle_outline_rounded,
                              size: 20,
                              color: metaColor,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),

                      // Save and copy actions
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Favorite / bookmark toggle
                          InkResponse(
                            onTap: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                              widget.onFavoriteToggle?.call(isFavorite);
                            },
                            radius: 18,
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: SvgPicture.asset(
                                AppAssets.star,
                                width: 18,
                                height: 18,
                                colorFilter: ColorFilter.mode(favoriteColor, BlendMode.srcIn),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          // Copy translated text to clipboard
                          CopyButton(onPressed: widget.onCopy),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
