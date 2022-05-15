import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:store_app/utils/style/colors.dart';
import 'package:store_app/controller/home_controller.dart';
import 'package:store_app/controller/info_screen_controller.dart';
import 'package:store_app/views/screens/home/widgets/back_layer_menu.dart';
import 'package:store_app/views/screens/home/widgets/front_layer_menu.dart';
import 'package:store_app/views/widgets/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final InfoScreenController infoScreenController =
        Get.put(InfoScreenController());

    return GetBuilder(
      autoRemove: false,
      init: HomeController(),
      builder: (HomeController controller) {
        return ShowCaseWidget(
          autoPlay: true,
          onFinish: () => controller.onFinish(),
          builder: Builder(
            builder: (context) {
              controller.initShowCase(context: context);
              return Stack(
                children: [
                  BackdropScaffold(
                    frontLayerBackgroundColor: ConstColors.backgroundColor,
                    appBar: BackdropAppBar(
                      elevation: 0.0,
                      title: const Text('Home'),
                      leading: Showcase(
                        title: 'Toggle',
                        description: 'Tap here to See More Buttons here',
                        key: controller.ids['toggle']!,
                        child: const BackdropToggleButton(
                          icon: AnimatedIcons.home_menu,
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              infoScreenController.isLoading
                                  ? 'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'
                                  : infoScreenController.imageUrl,
                            ),
                          ),
                        ),
                      ],
                      flexibleSpace: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              ConstColors.starterColor,
                              ConstColors.endColor,
                            ],
                          ),
                        ),
                      ),
                    ),
                    headerHeight: MediaQuery.of(context).size.height / 1.5,
                    backLayerBackgroundColor: ConstColors.starterColor,
                    backLayer: const BackLayerMenu(),
                    frontLayer: const SingleChildScrollView(
                      child: FrontLayerMenu(),
                    ),
                  ),
                  Visibility(
                    visible: controller.firstTime,
                    child: PositionedDirectional(
                      top: size.height / 1.65,
                      start: size.width - 200,
                      end: 0.0,
                      child: Showcase(
                        description: 'slide to change view',
                        key: controller.ids['slide']!,
                        child: Container(
                          height: 0,
                          width: double.infinity,
                          color: Colors.red,
                          alignment: AlignmentDirectional.center,
                        ),
                      ),
                    ),
                  ),
                  GetX(
                    builder: (HomeController controller) {
                      return LoadingWidget(
                        size: size,
                        visible: controller.isLoading.value,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
