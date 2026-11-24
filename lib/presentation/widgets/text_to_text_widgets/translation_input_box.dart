import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import 'sound_button.dart';

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
    final cardBg = isDark ? AppColors.navyBlue : AppColors.wight;
    final cardBorder = isDark
        ? AppColors.midnightBlue.withOpacity(0.8)
        : AppColors.paleLavender;
    final textColor = isDark ? AppColors.wight : AppColors.black;
    final hintColor = isDark ? AppColors.coolGray : AppColors.darkGrey;
    final pasteBg = isDark ? AppColors.midnightBlue : AppColors.paleLavender;
    final pasteTextColor = isDark ? AppColors.paleBlue : AppColors.darkGrey;
    final submitBg = isDark ? AppColors.midnightBlue : AppColors.paleLavender;
    final submitIconColor = isDark ? AppColors.lightBlue : AppColors.electricBlue;
    final langColor = isDark ? AppColors.lightBlue : AppColors.electricBlue;

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
          // Header Actions
          if (hasText)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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

          // Text Field
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

          // Bottom Actions
          if (hasText)
            // Filled Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    SoundButton(onPressed: onListen),
                    const SizedBox(width: 10),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: AppColors.electricBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppAssets.mic,
                          width: 14,
                          height: 16,
                          color: AppColors.wight,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          else
            // Empty Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
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
                          children: [
                            Image.asset(
                              AppAssets.paste,
                              width: 12,
                              height: 14,
                              color: pasteTextColor,
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
                    SoundButton(onPressed: onListen),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '$charCount / $maxCharacters',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w500,
                        color: hintColor,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                          child: Image.asset(
                            AppAssets.arrowForward,
                            width: 14,
                            height: 14,
                            color: submitIconColor,
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
