import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/constant.dart';
import 'package:store_app/views/screens/inner_screens/brand_inner_screen.dart';
import 'package:store_app/views/screens/product_details.dart';
import 'package:store_app/views/widgets/category_item_widget.dart';
import 'package:store_app/views/widgets/feed_screen_item_widget.dart';
import 'package:store_app/views/widgets/title_view_all_widget.dart';

class FrontLayerMenu extends StatelessWidget {
  const FrontLayerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 220,
          // height: MediaQuery.of(context).size.height / 4,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                kCarousleImages[index],
                fit: BoxFit.fill,
              );
            },
            allowImplicitScrolling: true,

            autoplay: true,

            itemCount: kCarousleImages.length,
            pagination: const SwiperPagination(margin: EdgeInsets.zero),
            // control: const SwiperControl(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            'Categories',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          // height: MediaQuery.of(context).size.height / 6,
          height: 150,
          child: ListView.builder(
            itemCount: kCategoriesImages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryItemWidget(
                categoriesImages: kCategoriesImages[index]['categoryImagePath'],
                name: kCategoriesImages[index]['categoryName'],
              );
            },
          ),
        ),
        const TitleWithViewAllWidget(title: 'Popular Brands'),
        Center(
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? SizedBox(
                  height: 220,
                  // width: 350,
                  // width: double.infinity,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      initialPage: 0,
                      aspectRatio: 220 / 350,
                      height: 220,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Container(
                        // width: double.infinity,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            Get.toNamed(BrandInnerScreen.routeName);
                          },
                          child: Image.asset(
                            kBrandImages[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                    itemCount: kBrandImages.length,
                  ),
                )
              : null,
        ),
        const TitleWithViewAllWidget(title: 'Popular Products'),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                //For Testing
                child: InkWell(
                  child: const FeedScreenItem(),
                  onTap: () {
                    Get.toNamed(ProductDetailsScreen.routeName);
                  },
                ),
                width: 200,
              );
              // return const PopularProductsItemWidget();
            },
          ),
        ),
      ],
    );
  }
}
