import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class HistorySearchField extends StatelessWidget {
  const HistorySearchField({super.key, required this.controller, this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 13, color: AppColors.black),
      decoration: InputDecoration(
        hintText: 'Search translations...',
        hintStyle: const TextStyle(fontSize: 13, color: AppColors.darkGrey),
        prefixIcon: const Icon(Icons.search, size: 19, color: AppColors.darkGrey),
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                tooltip: 'Clear search',
                onPressed: () {
                  controller.clear();
                  onChanged?.call('');
                },
                icon: const Icon(Icons.close, size: 18),
              ),
        filled: true,
        fillColor: AppColors.wight,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.paleLavender),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.paleLavender),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.electricBlue),
        ),
      ),
    );
  }
}
