import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/views/screens/cart/cart.dart';
import 'package:store_app/views/screens/feeds/feeds.dart';
import 'package:store_app/views/screens/home/home.dart';
import 'package:store_app/views/screens/inner_brand/brand_inner_screen.dart';
import 'package:store_app/views/screens/category/category_screen.dart';
import 'package:store_app/views/screens/product_details/product_details.dart';
import 'package:store_app/views/screens/search/search.dart';
import 'package:store_app/views/screens/user_information/user_info.dart';
import 'package:store_app/views/screens/wishlist/wishlist.dart';
import 'package:store_app/views/widgets/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ConstColors.backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      getPages: [
        GetPage(
          name: BottomNavigationBarWidget.routeName,
          page: () => const BottomNavigationBarWidget(),
        ),
        GetPage(
          name: Wishlist.routeName,
          page: () => const Wishlist(),
        ),
        GetPage(
          name: CartScreen.routeName,
          page: () => const CartScreen(),
        ),
        GetPage(
          name: ProductDetailsScreen.routeName,
          page: () => const ProductDetailsScreen(),
        ),
        GetPage(
          name: BrandInnerScreen.routeName,
          page: () => const BrandInnerScreen(),
        ),
        GetPage(
          name: FeedsScreen.routeName,
          page: () => const FeedsScreen(),
        ),
        GetPage(
          name: HomeScreen.routeName,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: SearchScreen.routeName,
          page: () => const SearchScreen(),
        ),
        GetPage(
          name: UserInfoScreen.routeName,
          page: () => const UserInfoScreen(),
        ),
        GetPage(
          name: CategoryScreen.routeName,
          page: () => const CategoryScreen(),
        ),
      ],

      title: 'Store',
      initialRoute: '/',
      // home: const ProductDetailsScreen(),
    );
  }
}
