import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/constant.dart';
import 'package:store_app/controller/home_controller.dart';
import 'package:store_app/views/screens/feeds/feeds.dart';
import 'package:store_app/views/screens/inner_brand/brand_inner_screen.dart';
import 'package:store_app/views/screens/category/category_screen.dart';
import 'package:store_app/views/screens/category/widgets/category_item_widget.dart';
import 'package:store_app/views/screens/home/widgets/popular_product_item_widget.dart';
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
              return InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Get.toNamed(
                    CategoryScreen.routeName,
                    arguments: kCategoriesImages[index]['categoryName'],
                  );
                },
                child: CategoryItemWidget(
                  categoriesImages: kCategoriesImages[index]
                      ['categoryImagePath'],
                  name: kCategoriesImages[index]['categoryName'],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TitleWithViewAllWidget(
            title: 'Popular Brands',
            onTap: () {},
          ),
        ),
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
                            Get.toNamed(
                              BrandInnerScreen.routeName,
                              arguments: {
                                'index': index,
                                'brandName': kBrands[index],
                              },
                            );
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
        TitleWithViewAllWidget(
          title: 'Popular Products',
          isPopularBrand: false,
          onTap: () {
            Get.toNamed(FeedsScreen.routeName, arguments: 'true');
          },
        ),
        GetX(
          init: HomeController(),
          builder: (HomeController controller) {
            return SizedBox(
              height: 300,
              child: ListView.builder(
                // itemCount: kPopularProducts.length,
                itemCount: controller.isLoading.value
                    ? 0
                    : controller.kProducts
                        .where((element) => element.isPopular)
                        .toList()
                        .length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PopularProductsItemWidget(
                    product: controller.isLoading.value
                        ? kPopularProducts[index]
                        : controller.kProducts
                            .where((element) => element.isPopular)
                            .toList()[index],
                    // product: kPopularProducts[index],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
