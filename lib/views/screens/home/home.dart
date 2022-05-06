import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/views/screens/home/widgets/back_layer_menu.dart';
import 'package:store_app/views/screens/home/widgets/front_layer_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      frontLayerBackgroundColor: ConstColors.backgroundColor,
      appBar: BackdropAppBar(
        elevation: 0.0,
        title: const Text('Home'),
        leading: const BackdropToggleButton(
          icon: AnimatedIcons.home_menu,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg',
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
    );
  }
}
