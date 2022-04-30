import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/views/widgets/cartlist_icon_button_with_badge.dart';
import 'package:store_app/views/widgets/wishlist_icon_button_with_bage.dart';

class HeaderSearchWidget extends SliverPersistentHeaderDelegate {
  final double flexibleSpace;
  final double backGroundHeight;
  final double stackPaddingTop;
  final double titlePaddingTop;
  final Widget title;
  final Widget? subTitle;
  final Widget? leading;
  final Widget? action;
  final Widget stackChild;
  final ScrollController? scrollController;

  HeaderSearchWidget({
    this.flexibleSpace = 250,
    this.scrollController,
    this.backGroundHeight = 200,
    required this.stackPaddingTop,
    this.titlePaddingTop = 35,
    required this.title,
    this.subTitle,
    this.leading,
    this.action,
    required this.stackChild,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var percent = shrinkOffset / (maxExtent - minExtent);
    double calculate = 1 - percent < 0 ? 0 : (1 - percent);
    return SizedBox(
      height: maxExtent,
      child: Stack(
        children: [
          Container(
            height: minExtent + ((backGroundHeight - minExtent) * calculate),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ConstColors.starterColor,
                  ConstColors.endColor,
                ],
                begin: const FractionalOffset(0.0, 1.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                WishlistIconButtonWithBadge(),
                CartListIconButtonWithBage(),
              ],
            ),
          ),
          Positioned(
            top: 32,
            left: 10,
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.shade300,
              child: InkWell(
                borderRadius: BorderRadius.circular(10.0),
                splashColor: Colors.grey,
                child: Container(
                  height: 40,
                  width: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg',
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.35,
            top: titlePaddingTop * calculate + 27,
            bottom: 0.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  leading ?? const SizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.scale(
                        alignment: Alignment.centerLeft,
                        scale: 1 + (calculate * .5),
                        child: Padding(
                          padding: EdgeInsets.only(top: 14 * (1 - calculate)),
                          child: title,
                        ),
                      ),
                      if (calculate > .5) ...[
                        const SizedBox(height: 10),
                        Opacity(
                          opacity: calculate,
                          child: subTitle ?? const SizedBox(),
                        ),
                      ]
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.only(top: 14 * calculate),
                    child: action ?? const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: minExtent + ((stackPaddingTop - minExtent) * calculate),
            child: Opacity(
              opacity: calculate,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: stackChild,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => flexibleSpace;

  @override
  double get minExtent => kToolbarHeight + 25;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
