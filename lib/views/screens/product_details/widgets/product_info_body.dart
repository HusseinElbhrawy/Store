import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/constants/constant.dart';
import 'package:store_app/model/product_moel.dart';
import 'package:store_app/views/screens/product_details/widgets/details_item_widget.dart';
import 'package:store_app/views/screens/feeds/widgets/feed_screen_item_widget.dart';

class ProductInfoBody extends StatelessWidget {
  const ProductInfoBody({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    List<ProductModel> suggestedList = kProducts.where((element) {
      return element.productCategoryName
          .toLowerCase()
          .contains(product.productCategoryName.toLowerCase());
    }).toList();
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
                      child: Text(
                        product.title,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'US \$ ${product.price}',
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
                  product.description,
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
              DetailsItemWidget(
                title1: 'Brand',
                title2: product.brand,
              ),
              DetailsItemWidget(
                title1: 'Quantity',
                title2: '${product.quantity} Left',
              ),
              DetailsItemWidget(
                title1: 'Catefory',
                title2: product.productCategoryName,
              ),
              DetailsItemWidget(
                title1: 'Popularity',
                title2: product.isPopular ? 'Popular' : 'Unpopular ',
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
          height: 350,
          child: ListView.builder(
            itemCount: suggestedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext ctx, int index) {
              return SizedBox(
                child: FeedScreenItem(
                  product: suggestedList[index],
                  comeFromFeed: false,
                ),
                width: 220,
              );
            },
          ),
        ),
      ],
    );
  }
}
