import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/style/colors.dart';
import 'package:store_app/controller/info_screen_controller.dart';

class FlexiableAppBar extends StatelessWidget {
  const FlexiableAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InfoScreenController infoScreenController = Get.find();
    double top;
    return SliverAppBar(
      expandedHeight: 200.0,
      pinned: true,
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ConstColors.starterColor,
                  ConstColors.endColor,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  centerTitle: true,
                  title: Row(
                    children: [
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: top <= 110.0 ? 1.0 : 0,
                        child: Row(
                          children: [
                            const SizedBox(width: 12),
                            Container(
                              height: kToolbarHeight / 1.8,
                              width: kToolbarHeight / 1.8,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 1.0,
                                  ),
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    infoScreenController.isLoading
                                        ? 'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'
                                        : infoScreenController.imageUrl
                                            .toString(),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            GetBuilder(
                              builder: (InfoScreenController controller) {
                                return Text(
                                  controller.isLoading
                                      ? 'Guest'
                                      : infoScreenController.userName,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  background: GetBuilder(
                    builder: (InfoScreenController controller) {
                      return CachedNetworkImage(
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
                          return Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(
                            Icons.error,
                            color: Colors.blue,
                          );
                        },
                        imageUrl: infoScreenController.isLoading
                            ? 'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'
                            : infoScreenController.imageUrl.toString(),
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
/*
Image(
                        image: NetworkImage(controller.isLoading
                            ? 'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'
                            : infoScreenController.imageUrl.toString()),
                        fit: BoxFit.fill,
                      )*/