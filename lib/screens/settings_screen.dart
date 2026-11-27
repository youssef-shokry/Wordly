import 'package:depi_final_project/models/language.dart';
import 'package:depi_final_project/presentation/utils/app_assets.dart';
import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_languages.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/full_width_icon_outlined_button.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/language_dropdown.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/language_pair_selector.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/offline_packs_tile.dart';
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
  /// Packs the user can download (every language except English),
  /// and the size of each one (MB).
  static final List<String> _availablePacks = AppLanguages.supportedLanguages
      .where((l) => l.code != AppLanguages.english.code)
      .map((l) => l.name)
      .toList();
  static const int _packSizeMb = 42;

  Language _source = AppLanguages.english;
  Language _target = AppLanguages.arabic;
  Language _interfaceLanguage = AppLanguages.english;

  final Set<String> _downloadedPacks = {'Arabic', 'Spanish', 'German'};


  void _onSourceChanged(Language value) {
    setState(() {
      if (value.code == _target.code) _target = _source;
      _source = value;
    });
  }

  void _onTargetChanged(Language value) {
    setState(() {
      if (value.code == _source.code) _source = _target;
      _target = value;
    });
  }

  void _swapLanguages() {
    setState(() {
      final temp = _source;
      _source = _target;
      _target = temp;
    });
  }

  @override
  Widget build(BuildContext context) {

    final packs = _availablePacks.where(_downloadedPacks.contains).toList();

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SettingsSectionCard(
              icon: Icons.person_outline,
              title: 'Account',
              children: [
                const UserInfoCard(
                  name: 'Elena Vance',
                  email: 'elena.vance@example.com',
                  assetPath: AppAssets.profile,
                ),
                const SizedBox(height: 12),
                SettingsGroup(
                  children: [
                    SettingsTile(
                      icon: Icons.badge_outlined,
                      title: 'Edit Profile',
                      subtitle: 'Personal details, avatar, display name',
                      onTap: () {
                        // TODO: navigate to the Edit Profile screen.
                      },
                    ),
                    SettingsTile(
                      icon: Icons.lock_reset,
                      title: 'Change Password',
                      onTap: () {
                        // TODO: navigate to the Change Password screen.
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                FullWidthIconOutlinedButton(
                  icon: Icons.logout,
                  label: 'Log Out',
                  onPressed: () {
                    // TODO: log out and navigate to the login screen.
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            SettingsSectionCard(
              icon: Icons.translate,
              title: 'Translation Preferences',
              children: [
                Text(
                  'Default Language Pair',
                  style: AppStyles.blackInterSemiBoldBlack14,
                ),
                const SizedBox(height: 8),
                LanguagePairSelector(
                  source: _source,
                  target: _target,
                  languages: AppLanguages.supportedLanguages,
                  onSourceChanged: _onSourceChanged,
                  onTargetChanged: _onTargetChanged,
                  onSwap: _swapLanguages,
                ),
                const SizedBox(height: 16),
                OfflinePacksTile(
                  packs: packs,
                  sizeInMb: packs.length * _packSizeMb,
                  onManage: () {
                    // TODO: navigate to the Offline Packs screen.
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            SettingsSectionCard(
              icon: Icons.language,
              title: 'Interface Language',
              children: [
                LanguageDropdown(
                  language: _interfaceLanguage,
                  languages: AppLanguages.supportedLanguages,
                  showBadge: false,
                  onChanged: (value) =>
                      setState(() => _interfaceLanguage = value),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
