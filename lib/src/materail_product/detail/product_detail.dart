import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/cart/getx/controller.dart';
import 'package:myapp/src/cart/page/cart_screen.dart';
import 'package:myapp/src/materail_product/getx/model.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>{


  @override
  initState() {
    super.initState();
   
  }

  int qtyAddtocard = 1;
  int qtyBorrow = 1;
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.only(left: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade400,
          ),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        ),
        actions: [
          Stack(children: [
            Container(
            width: 40,
            height: 50,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.only(left: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey.shade400,
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                },
                icon: const Icon(Icons.shopping_cart, color: Colors.white)),
          ),
          GetBuilder<CartController>(
            init: CartController(),
            builder: (context)=>cartController.itemCount.toInt()!=0 ? Positioned(
            top: 5,
            right: 6,
            child: Container(
              alignment: Alignment.center,
            width: 15,
            height: 15,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.red),
            child: Text(cartController.itemCount.toString(),style: const TextStyle(
                              fontFamily: 'noto_regular',
                              fontSize: 10,
                              color: Colors.white)),
          )): SizedBox())

          
          ],)
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                addtocard(context);
              },
              child: Ink(
                color: const Color.fromARGB(255, 15, 94, 159),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add_shopping_cart,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text('Add to Card',
                          style: TextStyle(
                              fontFamily: 'noto_regular',
                              fontSize: 12,
                              color: Colors.white))
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                 borrow(context);
              },
              child: Ink(
                color: Colors.orange,
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.50,
                    height: 50,
                    child: const Text('BORROW',
                        style: TextStyle(
                            fontFamily: 'noto_regular',
                            fontSize: 12,
                            color: Colors.white))),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              color: Colors.grey.shade200,
              child: Image.network(widget.product.image.toString()),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.name.toString(),
                      style:
                          const TextStyle(fontFamily: 'noto_me', fontSize: 15)),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Colors.black,
                    height: 1,
                  ),
                  const SizedBox(height: 5),
                  // ignore: prefer_interpolation_to_compose_strings
                  Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'Stock Onhand: ' +
                          widget.product.qtyOnhand.toString() +
                          ' Unit',
                      style: stock),
                  const SizedBox(height: 15),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 15, 94, 159),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Text(
                                'LAB',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'noto_ragular',
                                    fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              widget.product.rabId!.name.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'noto_ragular',
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Container(
                          width: 90,
                          height: 35,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.red)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.all(0)),
                            child: const Text(
                              'View LAB',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description',
                            style: TextStyle(color: Colors.grey.shade900)),
                        const SizedBox(height: 10),
                        Text(widget.product.description.toString(),
                            style: TextStyle(color: Colors.grey.shade900)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Future<dynamic> addtocard(BuildContext context) {

  
    return showMaterialModalBottomSheet(
      isDismissible: false,
      duration: const Duration(seconds: 0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  context: context,
                  builder: (context) => Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        height: 270,
                        child: Column(
                          children: [
                            Container(
                              height: 130,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      width: 120,
                                      child: Image.network(
                                        widget.product.image.toString(),
                                      )),
                                  // const SizedBox(width: 10),
                                  Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'Stock Onhand: ' +
                                          widget.product.qtyOnhand
                                              .toString() +
                                          ' Unit',
                                      style: stock),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Divider(
                              height: 1,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Quantity',
                                        style: stock,
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                                padding: EdgeInsets.all(0),
                                                onPressed: () {
                                                  if(qtyAddtocard>1){
                                                    setState(() {
                                                    qtyAddtocard--;
                                                  });
                                                  Navigator.pop(context);
                                                  addtocard(context);
                                                  }
                                                },
                                                icon:  Image.asset(
                                  'icons/remove.png',width: 30,
                                )),
                                          
                                          const SizedBox(width: 5),
                                          Container(
                                         
                                              alignment: Alignment.center,
                                              
                                              child:  Text(qtyAddtocard.toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      ))),
                                          const SizedBox(width: 5),
                                          IconButton(
                                                padding: EdgeInsets.all(0),
                                                onPressed: () {
                                                   setState(() {
                                                    qtyAddtocard++;
                                                  });
                                                  Navigator.pop(context);
                                                  addtocard(context);
                                                },
                                                icon:  Image.asset(
                                  'icons/add2.png',width: 28,
                                )),
                                          
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  InkWell(
                                    onTap: () {
                                      cartController.addItem(int.parse(widget.product.id.toString()), int.parse(widget.product.id.toString()), int.parse(widget.product.id.toString()), int.parse(widget.product.rabId!.id.toString()), qtyAddtocard,widget.product.image.toString(),widget.product.qtyOnhand.toString(),widget.product.name.toString());
                                      cartController.addItemLab(int.parse(widget.product.rabId!.id.toString()),int.parse(widget.product.rabId!.id.toString()),int.parse(widget.product.rabId!.id.toString()));
                                      setState(() {
                                        qtyAddtocard =1;
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                        color: Color.fromARGB(
                                          255, 15, 94, 159),
                                        width:500,
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.add_shopping_cart,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 10),
                                            Text('Add to Card',
                                                style: TextStyle(
                                                    fontFamily:
                                                        'noto_regular',
                                                    fontSize: 12,
                                                    color: Colors.white))
                                          ],
                                        ),
                                      ),
                                    ),
                                  
                                  
                                ],
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Positioned(
                        right: 3,top: 3,
                        child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close,size: 30,color: Colors.grey,)))
                    ],
                  ));
  }

  Future<dynamic> borrow(BuildContext context) {
    return showMaterialModalBottomSheet(
      isDismissible: false,
       duration: const Duration(seconds: 0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  context: context,
                  builder: (context) => Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        height: 270,
                        child: Column(
                          children: [
                            Container(
                              height: 130,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      width: 120,
                                      child: Image.network(
                                        widget.product.image.toString(),
                                      )),
                                  // const SizedBox(width: 10),
                                  Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'Stock Onhand: ' +
                                          widget.product.qtyOnhand
                                              .toString() +
                                          ' Unit',
                                      style: stock),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Divider(
                              height: 1,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Quantity',
                                        style: stock,
                                      ),
                                       Row(
                                        children: [
                                          IconButton(
                                                padding: EdgeInsets.all(0),
                                                onPressed: () {
                                                 if(qtyBorrow>1){
                                                   setState(() {
                                                    qtyBorrow--;
                                                  });
                                                  Navigator.pop(context);
                                                  borrow(context);
                                                 }
                                                },
                                                icon: Image.asset(
                                  'icons/remove.png',width: 30,
                                )),
                                          
                                          const SizedBox(width: 5),
                                          Container(
                                         
                                              alignment: Alignment.center,
                                              
                                              child:  Text(qtyBorrow.toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      ))),
                                          const SizedBox(width: 5),
                                          IconButton(
                                                padding: EdgeInsets.all(0),
                                                onPressed: () {
                                                   setState(() {
                                                    qtyBorrow++;
                                                  });
                                                  Navigator.pop(context);
                                                 borrow(context);
                                                },
                                                icon: Image.asset(
                                  'icons/add2.png',
                                  width: 28,
                                )),
                                          
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        color: Colors.orange,
                                        width:500,
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.add_shopping_cart,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 10),
                                            Text('BORROW',
                                                style: TextStyle(
                                                    fontFamily:
                                                        'noto_regular',
                                                    fontSize: 12,
                                                    color: Colors.white))
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                       Positioned(
                        right: 3,top: 3,
                        child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close,size: 30,color: Colors.grey,)))
                    ],
                  ));
  }
}
