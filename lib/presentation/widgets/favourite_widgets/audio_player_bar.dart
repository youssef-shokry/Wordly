import 'dart:async';

import 'package:depi_final_project/presentation/utils/app_colors.dart';
import 'package:depi_final_project/presentation/utils/app_styles.dart';
import 'package:flutter/material.dart';

/// Play/pause button + tappable waveform + times + speed chip.
///
/// This is UI-only playback: it simulates progress with a timer so the
/// controls feel real. Replace the timer with your audio player's
/// position stream when you connect real audio.
class AudioPlayerBar extends StatefulWidget {
  final Duration total;
  final Duration initialPosition;

  const AudioPlayerBar({
    super.key,
    required this.total,
    this.initialPosition = Duration.zero,
  });

  @override
  State<AudioPlayerBar> createState() => _AudioPlayerBarState();
}

class _AudioPlayerBarState extends State<AudioPlayerBar> {
  static const _speeds = [1.0, 1.25, 1.5, 2.0];
  static final List<double> _barHeights = List.generate(
    30,
    (i) => 8.0 + ((i * 7) % 5) * 4.5 + (i % 3) * 3,
  );

  late Duration _position;
  bool _playing = false;
  int _speedIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _position = widget.initialPosition;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _togglePlay() {
    if (_playing) {
      _timer?.cancel();
      setState(() => _playing = false);
      return;
    }
    if (_position >= widget.total) _position = Duration.zero;
    setState(() => _playing = true);
    _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      final step = Duration(
        milliseconds: (500 * _speeds[_speedIndex]).round(),
      );
      final next = _position + step;
      if (next >= widget.total) {
        _timer?.cancel();
        setState(() {
          _position = widget.total;
          _playing = false;
        });
      } else {
        setState(() => _position = next);
      }
    });
  }

  void _cycleSpeed() {
    setState(() => _speedIndex = (_speedIndex + 1) % _speeds.length);
  }

  void _seek(double dx, double width) {
    final fraction = (dx / width).clamp(0.0, 1.0);
    setState(() {
      _position = Duration(
        milliseconds: (widget.total.inMilliseconds * fraction).round(),
      );
    });
  }

  String _format(Duration d) {
    final m = d.inMinutes.toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final totalMs = widget.total.inMilliseconds;
    final progress = totalMs == 0 ? 0.0 : _position.inMilliseconds / totalMs;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.paleLavender,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Material(
            color: AppColors.electricBlue,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: _togglePlay,
              child: SizedBox(
                width: 44,
                height: 44,
                child: Icon(
                  _playing ? Icons.pause : Icons.play_arrow,
                  color: AppColors.wight,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 32,
                  child: LayoutBuilder(
                    builder: (context, constraints) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTapDown: (d) =>
                          _seek(d.localPosition.dx, constraints.maxWidth),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (var i = 0; i < _barHeights.length; i++)
                            Container(
                              width: 3,
                              height: _barHeights[i],
                              decoration: BoxDecoration(
                                color: i / _barHeights.length < progress
                                    ? AppColors.electricBlue
                                    : AppColors.lightBlue,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _format(_position),
                      style: AppStyles.blackInterRegularDarkGrey12,
                    ),
                    Text(
                      _format(widget.total),
                      style: AppStyles.blackInterRegularDarkGrey12,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: _cycleSpeed,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.lavenderBg,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${_speeds[_speedIndex]}x',
                style: AppStyles.blackInterSemiBoldBlack14.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
