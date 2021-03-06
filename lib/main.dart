import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:store_app/modules/user_status.dart';
import 'package:store_app/utils/middleware/dio/dio.dart';
import 'package:store_app/utils/style/colors.dart';
import 'package:store_app/views/screens/cart/cart.dart';
import 'package:store_app/views/screens/feeds/feeds.dart';
import 'package:store_app/views/screens/forget_password/forget_password.dart';
import 'package:store_app/views/screens/home/home.dart';
import 'package:store_app/views/screens/inner_brand/brand_inner_screen.dart';
import 'package:store_app/views/screens/category/category_screen.dart';
import 'package:store_app/views/screens/landing/landing.dart';
import 'package:store_app/views/screens/login/login.dart';
import 'package:store_app/views/screens/main_screen.dart';
import 'package:store_app/views/screens/orders/orders.dart';
import 'package:store_app/views/screens/payment/register/check_out.dart';
import 'package:store_app/views/screens/product_details/product_details.dart';
import 'package:store_app/views/screens/search/search.dart';
import 'package:store_app/views/screens/signup/signup.dart';
import 'package:store_app/views/screens/upload_product/upload_product.dart';
import 'package:store_app/views/screens/user_information/user_info.dart';
import 'package:store_app/views/screens/wishlist/wishlist.dart';
import 'package:store_app/views/widgets/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  await DioHelperPayment.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
        GetPage(
          name: LandingScreen.routeName,
          page: () => const LandingScreen(),
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: SignUpScreen.routeName,
          page: () => const SignUpScreen(),
        ),
        GetPage(
          name: UploadProductScreen.routeName,
          page: () => const UploadProductScreen(),
        ),
        GetPage(
          name: MainScreen.routeName,
          page: () => const MainScreen(),
        ),
        GetPage(
          name: ForgetPasswordScreen.routeName,
          page: () => const ForgetPasswordScreen(),
        ),
        GetPage(
          name: OrdersScreen.routeName,
          page: () => const OrdersScreen(),
        ),
        GetPage(
          name: CheckOutScreen.routeName,
          page: () => const CheckOutScreen(),
        ),
      ],
      title: 'Store App',
      home: SplashScreenView(
        navigateRoute: UserStatus.page,
        imageSrc: "assets/images/shopping-cart.png",
        text: "Store App",
        duration: 3000,
        imageSize: 130,
        textStyle: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        textType: TextType.TyperAnimatedText,
      ),
    );
  }
}
//    const HomeScreen(key: PageStorageKey('homeScreen')),
