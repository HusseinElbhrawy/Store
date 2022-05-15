import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/constant.dart';
import 'package:store_app/controller/brand_inner_screen_controller.dart';
import 'package:store_app/controller/info_screen_controller.dart';

class BrandsSlideWidget extends StatelessWidget {
  const BrandsSlideWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InfoScreenController infoScreenController = Get.find();

    return GetBuilder(
      init: BrandInnerScreenController(),
      builder: (BrandInnerScreenController controller) {
        return SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: constraints.maxWidth),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      trailing: SizedBox(
                          height: MediaQuery.of(context).size.height / 5),
                      leading: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  infoScreenController.isLoading
                                      ? 'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'
                                      : infoScreenController.imageUrl,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                      extended: false,
                      selectedIndex: controller.currentIndex,
                      groupAlignment: 1,
                      labelType: NavigationRailLabelType.all,
                      useIndicator: false,
                      onDestinationSelected: (index) {
                        controller.updateIndex(newIndex: index);
                        String? value = controller.getBrandName();
                        controller.filterData(value: value!);
                      },
                      selectedLabelTextStyle: const TextStyle(
                        color: Color(0xffe6bc97),
                        fontSize: 20,
                        letterSpacing: 1,
                        decorationThickness: 2.5,
                      ),
                      unselectedLabelTextStyle: const TextStyle(
                        fontSize: 15,
                        letterSpacing: .8,
                      ),
                      destinations: [
                        ...List.generate(
                          kBrands.length,
                          (index) {
                            return NavigationRailDestination(
                              icon: const SizedBox.shrink(),
                              label: RotatedBox(
                                quarterTurns: 3,
                                child: Text(kBrands[index]),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
