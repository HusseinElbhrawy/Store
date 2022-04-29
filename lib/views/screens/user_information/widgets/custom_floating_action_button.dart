// ignore: must_be_immutable
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton({
    Key? key,
    required this.offset,
    required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;

  final double offset;
  //starting fab position
  static const double defaultTopMargin = 200.0 - 4.0;
  //pixels from top where scaling should start
  static const double scaleStart = 160.0;
  //pixels from top where scaling should end
  static const double scaleEnd = scaleStart / 2;

  double top = defaultTopMargin;
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }
    return PositionedDirectional(
      top: top,
      end: 16.0,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(scale),
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          heroTag: "btn1",
          onPressed: () {},
          child: const Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }
}
