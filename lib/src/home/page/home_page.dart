import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/controller/page_controller.dart';
import 'package:myapp/search/search.dart';
import 'package:myapp/src/cart/getx/controller.dart';
import 'package:myapp/src/cart/page/cart_screen.dart';
import 'package:myapp/src/lap_room/getx/controller.dart';
import 'package:myapp/src/lap_room/page/lab_detail.dart';
import 'package:myapp/src/materail_product/detail/product_detail.dart';
import 'package:myapp/src/materail_product/getx/controller.dart';

ProductController productController = Get.put(ProductController());
LabController labController = Get.put(LabController());
PageInttroller pageInttroller = Get.put(PageInttroller());
CartController cartController = Get.put(CartController());

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
              },
              child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  margin: const EdgeInsets.only(right: 15),
                  height: 35,
                  width: 280,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Text(
                        'Search......',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  )),
            ),
                
          Stack(
            children: [
               Container(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.grey,
                    size: 28,
                  )),
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
            ],
          )
           
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.72,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                            4,
                            (index) => Obx(() {
                                  if (labController.isLoading.value) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '',
                                          style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontFamily: 'noto_ragular',
                                              fontSize: 9),
                                        )
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> LabDetails(lab: labController.statetList[index],product: productController.statetList.where((p0) => p0.rabId!.id==labController.statetList[index].id).toList())));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 15, 94, 159),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Text(
                                              'LAB',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'noto_ragular',
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          labController.statetList[index].name
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontFamily: 'noto_ragular',
                                              fontSize: 9),
                                        )
                                      ],
                                    );
                                  }
                                })),
                      ),
                    ),
                    Obx(() {
                      if (labController.isLoading.value) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  pageInttroller.addPageInt(1, 1);
                                });
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '',
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontFamily: 'noto_ragular',
                                  fontSize: 9),
                            )
                          ],
                        );
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  pageInttroller.addPageInt(1, 1);
                                });
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.orange),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.window,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'More',
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontFamily: 'noto_ragular',
                                  fontSize: 9),
                            )
                          ],
                        );
                      }
                    })
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                height: 40,
                color: Colors.white,
                child: const Text(
                  'Materail Product',
                  style: stock,
                ),
              ),
              const SizedBox(height: 8),
              Obx(() {
                if (productController.isLoading.value) {
                  return Wrap(
                    runSpacing: 15,
                    spacing: 15,
                    children: List.generate(
                        productController.statetList.length,
                        (index) => InkWell(
                              onTap: () {},
                              child: Ink(
                                color: Colors.grey.shade300,
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width *
                                        0.44,
                                    height: 250),
                              ),
                            )),
                  );
                } else {
                  return Wrap(
                    runSpacing: 15,
                    spacing: 15,
                    children: List.generate(
                        productController.statetList.length,
                        (index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            product: productController
                                                .statetList
                                                .where((p0) =>
                                                    p0.id.toString() ==
                                                    productController
                                                        .statetList[index].id
                                                        .toString())
                                                .first)));
                              },
                              child: Ink(
                                color: Colors.white,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  height: 250,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 140,
                                          child: Image.network(productController
                                              .statetList[index].image
                                              .toString())),
                                      const SizedBox(height: 8),
                                      Text(
                                          productController
                                              .statetList[index].name
                                              .toString(),
                                        overflow: TextOverflow.ellipsis,
                                          style: name),
                                      Text(
                                        productController
                                            .statetList[index].description
                                            .toString(),
                                        style: description,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      const Divider(
                                          height: 1, color: Colors.black),
                                      const SizedBox(height: 8),
                                      Text(
                                          'Stock Onhand: ' +
                                              productController
                                                  .statetList[index].qtyOnhand
                                                  .toString() +
                                              ' Unit',
                                          style: stock),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
