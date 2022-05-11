import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WaveBackground extends StatelessWidget {
  const WaveBackground({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [ConstColors.gradiendFStart, ConstColors.gradiendFStart],
            [ConstColors.gradiendFEnd, ConstColors.gradiendFEnd],
          ],
          durations: [
            19440,
            10800,
          ],
          heightPercentages: [0.22, 0.25, 0.28, 0.31],
          blur: const MaskFilter.blur(BlurStyle.solid, 0),
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
        ),
        waveAmplitude: 10,
        size: Size(
          size.width,
          size.height / 1.15,
        ),
      ),
    );
  }
}
