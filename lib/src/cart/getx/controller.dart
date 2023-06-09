import 'package:get/get.dart';
import 'package:myapp/src/cart/getx/model.dart';

class CartController extends GetxController {
  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items {
    return {..._items};
  }
  ///////////////////////////////////////////
  Map<int, LabItem> _itemslab = {};

  Map<int, LabItem> get itemslab {
    return {..._itemslab};
  }

  int get itemCount {
    // return  _items?.length?? 0;
    return _items.length;
  }
////////////////////////////////////////
  int get itemCountlab {
    // return  _items?.length?? 0;
    return _itemslab.length;
  }

  // double get totalAmount {
  //   var total = 0.0;
  //   _items.forEach((key, cartItem) {
  //     total += cartItem.price * cartItem.quantity;
  //   });
  //   return total;
  // }

  //////---------- Add to Cart  ------------/////////////
  void addItem(int productId, id, int material, int lab, int quantity, String image, stock, name) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
            image: image,
                material: existingCartItem.material,
                id: existingCartItem.id,
                lab: existingCartItem.lab,
                quantity: existingCartItem.quantity + 1,
                name: existingCartItem.name,
                stock: existingCartItem.stock
              ));
      update();
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          image: image,
          id: id.toString(),
          material: material,
          lab: lab,
          quantity: quantity,
           name: name,
          stock: stock
        ),
      );
    }
    update();
  }
  /////////////////////////////////////////////////////////////
  void addItemLab(int productId,id, int lab, ) {
    if (_itemslab.containsKey(productId)) {
      _itemslab.update(
          productId,
          (existingCartItem) => LabItem(
             
                id: existingCartItem.id,
                lab: existingCartItem.lab,
             
              ));
      update();
    } else {
      _itemslab.putIfAbsent(
        productId,
        () => LabItem(
          id: id.toString(),
          lab: lab,
      
        ),
      );
    }
    update();
  }

  ////---------- Add Address ------------/////////////

  void delete(int productId, id, int material, int lab, int quantity, String image, stock, name) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
            image:existingCartItem.image ,
                material: existingCartItem.material,
                id: existingCartItem.id,
                lab: existingCartItem.lab,
                quantity: existingCartItem.quantity - 1,
                name: existingCartItem.name,
                stock: existingCartItem.stock
              ));
      update();
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: id.toString(),
          material: material,
          lab: lab,
          quantity: quantity,
          image: image,
          name: name,
          stock: stock
        ),
      );
    }
    update();
  }
///////////////////////////////////////////
  void removeitem(int productId) {
    _items.remove(productId);
    update();
  }

  void clear() {
    _items = {};
    update();
  }
  /////////////////////////////////////////
  void removeitemlab(int productId) {
    _itemslab.remove(productId);
    update();
  }

  void clearlab() {
    _itemslab = {};
    update();
  }
}
