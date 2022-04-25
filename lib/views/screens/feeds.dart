import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feeds',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xffE1DFE1),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          children: [
            ...List.generate(
              10,
              (index) {
                return StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: index.isEven ? 3.3 : 2.8,
                  child: const FeedScreenItem(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          children: [
            ...List.generate(
              10,
              (index) {
                return StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: index.isEven ? 3.3 : 2.8,
                  child: const FeedScreenItem(),
                );
              },
            ),
          ],
        ),
      )
*/
class FeedScreenItem extends StatelessWidget {
  const FeedScreenItem({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(8),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/CatLaptops.png',
                fit: BoxFit.fill,
                // height: 150,
              ),
              Text(
                'Product Name',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Product Price',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Quantity 12 left',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const Spacer(),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      splashColor: Colors.red,
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_horiz,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color(0xffAA88E5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text('New'),
        ),
      ],
    );
  }
}
