import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/constants/constant.dart';

class BrandsSlideWidget extends StatelessWidget {
  const BrandsSlideWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: constraints.maxWidth),
            child: IntrinsicHeight(
              child: NavigationRail(
                trailing:
                    SizedBox(height: MediaQuery.of(context).size.height / 5),
                leading: Container(
                  margin: const EdgeInsets.only(top: 40),
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg',
                      ),
                    ),
                  ),
                ),
                extended: false,
                selectedIndex: 0,
                groupAlignment: 1,
                labelType: NavigationRailLabelType.all,
                useIndicator: false,
                onDestinationSelected: (index) {
                  log(index.toString());
                },
                selectedLabelTextStyle: const TextStyle(
                  color: Color(0xffe6bc97),
                  fontSize: 20,
                  letterSpacing: 1,
                  decorationThickness: 2.5,
                ),
                unselectedLabelTextStyle: const TextStyle(
                  fontSize: 15,
                  letterSpacing: .8,
                ),
                destinations: [
                  ...List.generate(
                    kBrands.length,
                    (index) {
                      return NavigationRailDestination(
                        icon: const SizedBox.shrink(),
                        label: RotatedBox(
                          quarterTurns: 3,
                          child: Text(kBrands[index]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
