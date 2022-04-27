import 'package:flutter/material.dart';
import 'package:store_app/views/widgets/brand_screen_item_widget.dart';
import 'package:store_app/views/widgets/brand_slide_widget.dart';

class BrandInnerScreen extends StatelessWidget {
  const BrandInnerScreen({Key? key}) : super(key: key);
  static const routeName = '/brandInnner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Row(
        children: [
          const BrandsSlideWidget(),
          const VerticalDivider(),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 1.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const BrandInnerScreenItemWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
