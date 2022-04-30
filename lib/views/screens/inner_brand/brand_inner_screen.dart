import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/brand_inner_screen_controller.dart';
import 'package:store_app/views/screens/inner_brand/widgets/brand_screen_item_widget.dart';
import 'package:store_app/views/screens/inner_brand/widgets/brand_slide_widget.dart';

class BrandInnerScreen extends StatelessWidget {
  const BrandInnerScreen({Key? key}) : super(key: key);
  static const routeName = '/brandInnerScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: GetBuilder(
        init: BrandInnerScreenController(),
        builder: (BrandInnerScreenController controller) {
          return Row(
            children: [
              const BrandsSlideWidget(),
              const VerticalDivider(),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 1.3,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return BrandInnerScreenItemWidget(
                      productModel: controller.list[index],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
