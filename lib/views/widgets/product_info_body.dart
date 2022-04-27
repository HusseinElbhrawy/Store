import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/views/widgets/details_item_widget.dart';
import 'package:store_app/views/widgets/feed_screen_item_widget.dart';

class ProductInfoBody extends StatelessWidget {
  const ProductInfoBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 250),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.purple.shade200,
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.save,
                      size: 23,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.purple.shade200,
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.share,
                      size: 23,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          //padding: const EdgeInsets.all(16.0),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const Text(
                        'title',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'US \$ 15',
                      style: TextStyle(
                          color: ConstColors.subTitle,
                          fontWeight: FontWeight.bold,
                          fontSize: 21.0),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                  height: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 21.0,
                    color: ConstColors.subTitle,
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                  height: 1,
                ),
              ),
              const DetailsItemWidget(
                title1: 'Brand',
                title2: 'BrandName',
              ),
              const DetailsItemWidget(
                title1: 'Quantity',
                title2: '12 Left',
              ),
              const DetailsItemWidget(
                title1: 'Catefory',
                title2: 'Category Name',
              ),
              const DetailsItemWidget(
                title1: 'Popularity',
                title2: 'Popular',
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
                height: 1,
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10.0),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'No reviews yet',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 21.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Be the first review!',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                      height: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: const Text(
            'Suggested products:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 250,
          child: ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext ctx, int index) {
              return const SizedBox(
                child: FeedScreenItem(),
                width: 200,
              );
            },
          ),
        ),
      ],
    );
  }
}
