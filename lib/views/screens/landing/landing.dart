import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:store_app/views/screens/landing/widgets/animated_bg_image.dart';
import 'package:store_app/views/screens/landing/widgets/auth_button.dart';
import 'package:store_app/views/screens/landing/widgets/custom_outlined_button.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = '/landingScreen';

  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const AnimatedBackgroundImage(),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 50),
                      Text(
                        'Welcome',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Welcome to the Biggers\nonline store',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.grey.shade700,
                                ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.mediaQuery.orientation == Orientation.landscape
                        ? 0
                        : size.height / 2.4,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Get.mediaQuery.orientation ==
                                        Orientation.landscape
                                    ? 32
                                    : 8,
                              ),
                              child: AuthButton(
                                onTap: () {},
                                title: 'Login',
                                bgColor: Colors.yellowAccent.shade700,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Get.mediaQuery.orientation ==
                                        Orientation.landscape
                                    ? 32
                                    : 8,
                              ),
                              child: AuthButton(
                                onTap: () {},
                                title: 'Signup',
                                bgColor: Colors.grey.shade100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.white,
                                height: 5,
                                width: Get.height,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text('Or Connect With'),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.white,
                                height: 5,
                                width: Get.height,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Row(
                          children: [
                            const VerticalDivider(),
                            Expanded(
                              child: CustomOutlinedButton(
                                borderColor: Colors.deepOrange,
                                iconData: FontAwesome5.google_plus_g,
                                onTap: () {},
                                title: 'Google',
                                fontColor: Colors.deepOrange,
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                              child: CustomOutlinedButton(
                                borderColor: Colors.blue,
                                iconData: FontAwesome5.facebook_f,
                                onTap: () {},
                                title: 'Facebook',
                              ),
                            ),
                            const VerticalDivider(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      CustomOutlinedButton(
                        borderColor: Colors.orange,
                        iconData: FontAwesome5.lock,
                        fontColor: Colors.white,
                        backgroundColor: Colors.deepOrange,
                        onTap: () {},
                        title: 'Continous as a guest',
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
