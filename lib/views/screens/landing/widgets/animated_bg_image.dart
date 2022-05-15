import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/landing_controller.dart';

class AnimatedBackgroundImage extends StatelessWidget {
  const AnimatedBackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingScreenController controller = Get.find();
    return AnimatedBuilder(
      animation: controller.animationController,
      builder: (BuildContext context, Widget? child) {
        return Image.asset(
          controller.images.first,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          alignment: FractionalOffset(controller.animation.value, 0),
        );
      },
    );
  }
}
