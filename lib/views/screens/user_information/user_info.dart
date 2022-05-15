import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/info_screen_controller.dart';
import 'package:store_app/views/screens/user_information/widgets/custom_floating_action_button.dart';
import 'package:store_app/views/screens/user_information/widgets/flexiable_app_bar.dart';
import 'package:store_app/views/screens/user_information/widgets/info_screen_body.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);
  static const routeName = '/use-info';

  @override
  Widget build(BuildContext context) {
    final InfoScreenController infoScreenController =
        Get.put(InfoScreenController());
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          CustomScrollView(
            controller: infoScreenController.controller,
            slivers: const [
              //AppBar
              FlexiableAppBar(),
              //Body
              InfoScreenBody()
            ],
          ),
          //Custom Floating Action Button
          GetBuilder(
            builder: (InfoScreenController controller) {
              return CustomFloatingActionButton(
                offset: infoScreenController.offset,
                scrollController: infoScreenController.controller,
              );
            },
          ),
        ],
      ),
    );
  }
}
