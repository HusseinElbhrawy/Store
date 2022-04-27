import 'package:flutter/material.dart';
import 'package:store_app/constants/icons.dart';
import 'package:store_app/views/widgets/product_info_body.dart';
import 'package:store_app/views/widgets/product_info_bottm_nav_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/productDetails';
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              MyIcons.emptyHeart,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              MyIcons.shopCart,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(color: Colors.black12),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('assets/images/CatShoes.jpg'),
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.2,
            alignment: AlignmentDirectional.bottomEnd,
          ),
          const SingleChildScrollView(
            padding: EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: ProductInfoBody(),
          ),
        ],
      ),
      bottomNavigationBar: const ProductInfoBottomNavBarWidget(),
    );
  }
}
