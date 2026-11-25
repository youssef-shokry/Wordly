import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import 'sound_button.dart';

/// The main text input card where the user types what they want translated.
/// Shows a language label + clear button when there's text,
/// and a Paste / mic / submit bar when the box is empty.
class TranslationInputBox extends StatelessWidget {
  final TextEditingController controller;
  final String sourceLanguage;
  final int maxCharacters;
  final VoidCallback? onClear;
  final VoidCallback? onPaste;
  final VoidCallback? onSubmit;
  final VoidCallback? onListen;
  final ValueChanged<String>? onChanged;

  const TranslationInputBox({
    super.key,
    required this.controller,
    this.sourceLanguage = 'English',
    this.maxCharacters = 5000,
    this.onClear,
    this.onPaste,
    this.onSubmit,
    this.onListen,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Surface
    final cardBg = isDark ? AppColors.navyBlue : AppColors.wight;
    final cardBorder = isDark
        ? AppColors.midnightBlue.withOpacity(0.8)
        : AppColors.paleLavender;

    // Text colors
    final textColor = isDark ? AppColors.wight : AppColors.black;
    final hintColor = isDark ? AppColors.coolGray : AppColors.darkGrey;
    final langColor = isDark ? AppColors.lightBlue : AppColors.electricBlue;

    // Paste pill colors
    final pasteBg = isDark ? AppColors.midnightBlue : AppColors.paleLavender;
    final pasteTextColor = isDark ? AppColors.paleBlue : AppColors.darkGrey;

    // Submit arrow button colors
    final submitBg = isDark ? AppColors.midnightBlue : AppColors.paleLavender;
    final submitIconColor = isDark ? AppColors.lightBlue : AppColors.electricBlue;

    final charCount = controller.text.length;
    final hasText = controller.text.isNotEmpty;

    return Container(
      constraints: const BoxConstraints(minHeight: 180),
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Language label + clear button (only while typing) ──
          if (hasText)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Active language indicator dot + name
                  Row(
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: langColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Text(
                        sourceLanguage.toUpperCase(),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                          color: langColor,
                        ),
                      ),
                    ],
                  ),
                  // Tap to wipe the input
                  GestureDetector(
                    onTap: onClear,
                    child: Icon(
                      Icons.close_rounded,
                      size: 18,
                      color: hintColor,
                    ),
                  ),
                ],
              ),
            ),

          // ── The actual text field ──
          TextField(
            controller: controller,
            maxLines: null,
            minLines: hasText ? 3 : 4,
            onChanged: onChanged,
            style: TextStyle(
              fontSize: 15.5,
              fontWeight: FontWeight.normal,
              color: textColor,
              height: 1.5,
            ),
            decoration: InputDecoration(
              hintText: 'Enter text, paste, or speak...',
              hintStyle: TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.normal,
                color: hintColor,
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),

          const SizedBox(height: 16),

          // ── Bottom action bar — two states depending on whether there's text ──
          if (hasText)
            // Has text: char counter on the left, mic + submit on the right
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Character counter
                Text(
                  '$charCount / $maxCharacters',
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w500,
                    color: hintColor,
                  ),
                ),
                Row(
                  children: [
                    // Voice input button
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: AppColors.electricBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppAssets.mic,
                          width: 14,
                          height: 16,
                          colorFilter: const ColorFilter.mode(AppColors.wight, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Submit / translate button
                    InkWell(
                      onTap: onSubmit,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: submitBg,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.arrowForward,
                            width: 14,
                            height: 14,
                            colorFilter: ColorFilter.mode(submitIconColor, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          else
            // Empty: show Paste pill + sound icon on the left, char counter + submit on the right
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Flexible prevents overflow when the pill + sound icon are wide
                Flexible(
                  child: Row(
                    children: [
                      // Paste from clipboard pill
                      InkWell(
                        onTap: onPaste,
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: pasteBg,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                AppAssets.paste,
                                width: 12,
                                height: 14,
                                colorFilter: ColorFilter.mode(pasteTextColor, BlendMode.srcIn),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Paste',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: pasteTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Listen / voice input icon
                      SoundButton(onPressed: onListen),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Character counter (shows 0 while empty)
                    Text(
                      '$charCount / $maxCharacters',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w500,
                        color: hintColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Submit arrow
                    InkWell(
                      onTap: onSubmit,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: submitBg,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.arrowForward,
                            width: 14,
                            height: 14,
                            colorFilter: ColorFilter.mode(submitIconColor, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
