import 'package:get/get.dart';
import 'package:store_app/model/cart.dart';

class WishController extends GetxController {
  final Map<String, CartModel> _wishList = {};

  Map<String, CartModel> get wishList => _wishList;
  bool isAddedToWishList({required String id}) {
    if (_wishList.containsKey(id)) return true;
    return false;
  }

  void addToWishList({required CartModel product}) {
    wishList.putIfAbsent(
      product.id,
      () {
        return CartModel(
          id: product.id,
          title: product.title,
          price: product.price,
          quantity: product.quantity,
          imageUrl: product.imageUrl,
        );
      },
    );
    update();
  }

  void removeFromWishList({required String id}) {
    _wishList.remove(id);
    update();
  }

  void removeAllWishlistItems() {
    _wishList.clear();
    update();
  }
}
