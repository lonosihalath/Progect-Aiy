import 'package:get/get.dart';
import 'package:myapp/controller/page_model.dart';

class PageInttroller extends GetxController {
  Map<int, PageInt> _items = {};

  Map<int, PageInt> get items {
    return {..._items};
  }
  int get itemCount {
    // return  _items?.length?? 0;
    return _items.length;
  }
  //////---------- Add to Cart  ------------/////////////
  void addPageInt(int  id, int pageInt,) {
    clear();
    _items.putIfAbsent(
       id,
        () => PageInt(
            page: pageInt
            ),
         
      );
    update();
  }

void clear() {
    _items = {};
    update();
  }

}