class CartItem {
  final String id;
  final String image;
  final String name;
  final String stock;
  final int material;
  final int lab;
  final int quantity;

  CartItem(
      {required this.id,
      required this.image,
      required this.name,
      required this.stock,
      required this.lab,
      required this.quantity,
      required this.material
      });
}
////////////////////////////////////////
class LabItem {
  final String id;
  final int lab;
  LabItem(
      {required this.id,
      required this.lab,
      });
}
//////////////////////////
class BuynowItem {
  final String id;
  final String image;
  final String name;
  final String stock;
  final int material;
  final int lab;
  final int quantity;

  BuynowItem(
      {required this.id,
      required this.image,
      required this.name,
      required this.stock,
      required this.lab,
      required this.quantity,
      required this.material
      });
}
