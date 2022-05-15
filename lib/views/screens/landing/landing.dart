import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:store_app/controller/landing_controller.dart';
import 'package:store_app/views/screens/landing/widgets/animated_bg_image.dart';
import 'package:store_app/views/screens/landing/widgets/auth_button.dart';
import 'package:store_app/views/screens/login/login.dart';
import 'package:store_app/views/screens/signup/signup.dart';
import 'package:store_app/views/widgets/custom_outlined_button_with_icon.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = '/landingScreen';

  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder(
      init: LandingScreenController(),
      builder: (LandingScreenController landingScreenController) {
        return ShowCaseWidget(
          autoPlay: true,
          onFinish: () => landingScreenController.onFinish(),
          builder: Builder(
            builder: (context) {
              landingScreenController.initShowCase(context: context);
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.grey.shade700,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.mediaQuery.orientation ==
                                      Orientation.landscape
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
                                          horizontal:
                                              Get.mediaQuery.orientation ==
                                                      Orientation.landscape
                                                  ? 32
                                                  : 8,
                                        ),
                                        child: Showcase(
                                          title: 'Login With Email',
                                          description:
                                              'Click here to go to Login page to sign in',
                                          radius: BorderRadius.circular(16),
                                          showArrow: true,
                                          disableAnimation: false,
                                          key: landingScreenController
                                              .ids['landingLogin']!,
                                          child: AuthButton(
                                            onTap: () {
                                              Get.offAllNamed(
                                                  LoginScreen.routeName);
                                            },
                                            title: 'Login',
                                            bgColor:
                                                Colors.yellowAccent.shade700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              Get.mediaQuery.orientation ==
                                                      Orientation.landscape
                                                  ? 32
                                                  : 8,
                                        ),
                                        child: Showcase(
                                          description:
                                              'Click here to go to Sign up page to create new account',
                                          title: 'Sign Up',
                                          key: landingScreenController
                                              .ids['landingSignup']!,
                                          child: AuthButton(
                                            onTap: () {
                                              Get.offAllNamed(
                                                  SignUpScreen.routeName);
                                            },
                                            title: 'Signup',
                                            bgColor: Colors.grey.shade100,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Showcase(
                                  radius: BorderRadius.circular(16),
                                  description:
                                      'Or you can sign in with other wayes',
                                  key: landingScreenController
                                      .ids['landingorConnectWith']!,
                                  child: Column(
                                    children: [
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
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 32),
                                        child: Row(
                                          children: [
                                            const VerticalDivider(),
                                            Expanded(
                                              child: CustomOutlinedButton(
                                                borderColor: Colors.deepOrange,
                                                iconData:
                                                    FontAwesome5.google_plus_g,
                                                onTap: () {
                                                  landingScreenController
                                                      .signInWithGoogle();
                                                },
                                                title: 'Google',
                                                fontColor: Colors.deepOrange,
                                              ),
                                            ),
                                            const VerticalDivider(),
                                            Expanded(
                                              child: CustomOutlinedButton(
                                                borderColor: Colors.blue,
                                                iconData:
                                                    FontAwesome5.facebook_f,
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
                                        onTap: () {
                                          landingScreenController
                                              .signInAsAGuest();
                                        },
                                        title: 'Continous as a guest',
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
    // return ShowCaseWidget(
    //   onComplete: (p0, p1) {
    //     log('The single Widget is complete');
    //   },
    //   onFinish: () {
    //     log('All is Finished');
    //   },
    //   builder: Builder(
    //     builder: (context) {
    //       WidgetsBinding.instance!.addPostFrameCallback(
    //         (_) => ShowCaseWidget.of(context)!.startShowCase(
    //           [_one, _two, _three],
    //         ),
    //       );
    //       return ;
    //     },
    //   ),
    // );
  }
}
