import 'package:flutter/material.dart';
import '../../../presentation/utils/app_colors.dart';

class SwitchDrawerWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final TextStyle? textStyle;

  const SwitchDrawerWidget({super.key, required this.icon, required this.title, this.textStyle});

  @override
  State<SwitchDrawerWidget> createState() => _SwitchDrawerWidgetState();
}

class _SwitchDrawerWidgetState extends State<SwitchDrawerWidget> {

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {

    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        widget.title,
        maxLines: 1,
        softWrap: false,
        style: widget.textStyle,
      ),
      secondary: Icon(widget.icon),
      value: isSwitched,
      activeTrackColor: AppColors.electricBlue,
      inactiveThumbColor: Colors.white,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        }
        );
      },
    );
  }
}
