import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    required this.size,
    required this.visible,
  }) : super(key: key);

  final Size size;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        color: Colors.white.withOpacity(.5),
        width: size.width,
        height: size.height,
        child: const Center(
          child: SpinKitFadingCube(
            color: Color.fromARGB(255, 158, 158, 158),
          ),
        ),
      ),
    );
  }
}
