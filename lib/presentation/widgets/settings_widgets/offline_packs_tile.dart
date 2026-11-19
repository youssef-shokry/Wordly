import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/settings_group.dart';
import 'package:depi_final_project/presentation/widgets/settings_widgets/settings_tile.dart';
import 'package:flutter/material.dart';

class OfflinePacksTile extends StatelessWidget {
  final List<String> packs;
  final int sizeInMb;
  final VoidCallback? onManage;

  const OfflinePacksTile({
    super.key,
    required this.packs,
    required this.sizeInMb,
    this.onManage,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsGroup(
      filled: true,
      children: [
        SettingsTile(
          icon: Icons.download_for_offline_outlined,
          title: 'Downloaded Offline Packs',
          subtitle: '${packs.join(', ')} • $sizeInMb MB',
          onTap: onManage,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Manage', style: AppStyles.blackInterSemiBoldDarkBlue12),
              const Icon(Icons.chevron_right, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}
