import 'package:get/get.dart';
import 'package:store_app/model/cart.dart';

class CartController extends GetxController {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get cartItems => _cartItems;
  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  bool isAddedToCart({required id}) {
    if (cartItems.containsKey(id)) return true;
    return false;
  }

  void addToCart({required CartModel product}) {
    _cartItems.putIfAbsent(
      product.id,
      () {
        return CartModel(
          id: product.id,
          title: product.title,
          price: product.price,
          quantity: 1,
          imageUrl: product.imageUrl,
        );
      },
    );

    update();
  }

  void increment({required CartModel product}) {
    _cartItems.update(product.id, (value) {
      return CartModel(
        id: value.id,
        title: value.title,
        price: value.price,
        quantity: value.quantity + 1,
        imageUrl: value.imageUrl,
      );
    });
    update();
  }

  void decrement({required CartModel product}) {
    _cartItems.update(product.id, (value) {
      return CartModel(
        id: value.id,
        title: value.title,
        price: value.price,
        quantity: value.quantity > 1 ? value.quantity - 1 : value.quantity,
        imageUrl: value.imageUrl,
      );
    });
    update();
  }

  void deleteItem({required String id}) {
    _cartItems.remove(id);
    update();
  }

  void deletedAllProduct() {
    _cartItems.clear();
    update();
  }
}
