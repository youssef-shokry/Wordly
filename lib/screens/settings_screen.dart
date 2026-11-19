import 'package:depi_final_project/models/language.dart';
import 'package:depi_final_project/presentation/utils/app_assets.dart';
import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/language_dropdown.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/language_pair_selector.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/offline_packs_tile.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/outlined_action_button.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/settings_group.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/settings_section_card.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/settings_tile.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/user_info_card.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Language _source = Languages.english;
  Language _target = Languages.arabic;
  Language _interfaceLanguage = Languages.english;

  void _swapLanguages() {
    setState(() {
      final temp = _source;
      _source = _target;
      _target = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      body: SingleChildScrollView(
        padding:  EdgeInsets.all(16),
        child: Column(
          children: [
            _buildAccountSection(),
             SizedBox(height: 16),
            _buildTranslationSection(),
             SizedBox(height: 16),
            _buildInterfaceLanguageSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSection() {
    return SettingsSectionCard(
      icon: Icons.person_outline,
      title: 'Account',
      children: [
         UserInfoCard(
          name: 'Elena Vance',
          email: 'elena.vance@example.com',
          assetPath: AppAssets.profile,
        ),
         SizedBox(height: 12),
        SettingsGroup(
          children: [
            SettingsTile(
              icon: Icons.badge_outlined,
              title: 'Edit Profile',
              subtitle: 'Personal details, avatar, display name',
              onTap: () {},
            ),
            SettingsTile(
              icon: Icons.lock_reset,
              title: 'Change Password',
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: 12),
        OutlinedActionButton(
          icon: Icons.logout,
          label: 'Log Out',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTranslationSection() {
    return SettingsSectionCard(
      icon: Icons.translate,
      title: 'Translation Preferences',
      children: [
        Text(
          'Default Language Pair',
          style: AppStyles.blackInterSemiBoldBlack14,
        ),
         SizedBox(height: 8),
        LanguagePairSelector(
          source: _source,
          target: _target,
          onSourceChanged: (language) => setState(() => _source = language),
          onTargetChanged: (language) => setState(() => _target = language),
          onSwap: _swapLanguages,
        ),
         SizedBox(height: 16),
        OfflinePacksTile(
          packs: const ['Arabic', 'Spanish', 'German'],
          sizeInMb: 126,
          onManage: () {},
        ),
      ],
    );
  }

  Widget _buildInterfaceLanguageSection() {
    return SettingsSectionCard(
      icon: Icons.language,
      title: 'Interface Language',
      children: [
        LanguageDropdown(
          value: _interfaceLanguage,
          showBadge: false,
          onChanged: (language) => setState(() => _interfaceLanguage = language),
        ),
      ],
    );
  }
}
