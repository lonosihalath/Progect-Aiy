import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/cart/getx/controller.dart';
import 'package:myapp/src/cart/getx/model.dart';
import 'package:myapp/src/lap_room/getx/controller.dart';
import 'package:myapp/src/lap_room/getx/model.dart';
import 'package:myapp/src/materail_product/getx/controller.dart';
import 'package:myapp/src/order/page/chekout.dart';



class CartScreen extends StatefulWidget {
   CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  CartController cartController = Get.put(CartController());
ProductController productController = Get.put(ProductController());
LabController labController = Get.put(LabController());
  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.grey)),
        elevation: 0,
        title: Text('Borrow Cart',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade900)),
        centerTitle: true,
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        init: CartController(),
        builder: (context)=>cartController.itemCount.toString() == '0'? SizedBox(): Container(
        height: 50,
        child: Row(
          children: [
            Container(
              color: Colors.white,
                  width: screen * 0.68,
                     padding: EdgeInsets.only(right: 15),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                      
                      SizedBox(width: 10),
                      Text('Total: ${cartController.items.length}',
                          style: const TextStyle(
                              fontFamily: 'noto_me',
                              fontSize: 12,
                              color: Colors.red))
                    ],
                  ),
                ),
            InkWell(
              onTap: () {
                 Get.to(CheckOutScreen(productbuynowl: [],));
              },
              child: Ink(
                color: Colors.orange,
                child: Container(
                    alignment: Alignment.center,
                    width: screen * 0.32,
                    height: 50,
                    child: const Text('Check Out',
                        style: TextStyle(
                            fontFamily: 'noto_regular',
                            fontSize: 12,
                            color: Colors.white))),
              ),
            ),
          ],
        ),
      ),),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Column(
          children: [
            GetBuilder<CartController>(
              init: CartController(),
              builder: (context)=>cartController.items.length.toInt()==0?SizedBox(): Container(
              alignment: Alignment.center,
              width: screen,
              height: 30,
              color: Colors.white,
              child: Text('ALL (${cartController.items.length})',style: TextStyle(fontSize: 12,color: Colors.red)),
            )),
            const SizedBox(height: 5),
            GetBuilder<CartController>(
              init: CartController(),
              builder: (context)=>cartController.itemCount.toString() == '0'? Padding(
           padding: const EdgeInsets.only(top: 150),
           child: Center(
            child: Column(
              children: [
                Image.asset('icons/nodata.png',width: 90,color: Colors.grey,),
                Text('No data',
                                          overflow: TextOverflow.ellipsis,
                                            style: name),
              ],
            ),
           ),
         ): Column(
                children: List.generate(cartController.itemslab.length, (index) =>  Stack(
                  children: [Container(
              padding: const EdgeInsets.all(15),
              width: screen,
             
              color: Colors.white,
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 25,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 15, 94, 159),
                              borderRadius:
                                  BorderRadius.circular(5)),
                          child: const Text(
                            'LAB',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'noto_ragular',
                                fontSize: 8),
                          )),
                          const SizedBox(width: 10),
                      lab(labController.statetList.where((p0) => p0.id!.toInt()== cartController.itemslab.values.toList()[index].lab).first),
                    ],
                  ),
                   const SizedBox(height: 10),
                   const Divider(
                              height: 1,
                              color: Colors.grey
                            ),
                             const SizedBox(height: 10),
                  GetBuilder<CartController>(
              init: CartController(),
              builder: (context)=> Column(
              children: List.generate(
                  cartController.items.values.where((element) => element.lab == cartController.itemslab.values.toList()[index].lab).length,
                  (index1) => Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        width: screen,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              child: Image.network(image(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1)),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 3),
                                Container(
                                  width:  screen*0.50,
                                  child: Text(names(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1),
                                    style: const TextStyle(fontSize: 12,overflow: TextOverflow.ellipsis),
                                  )
                                ),
                                     const SizedBox(height: 2),
                                // ignore: prefer_interpolation_to_compose_strings
                                Text('Stock Onhand: ' + stock(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1) + ' Unit',
                                      style: const TextStyle(fontSize: 10)),
                                   const SizedBox(height: 3),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                              
                                  children: [
                                    IconButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          if(int.parse(cartController.items.values
                                            .toList()[index]
                                            .quantity.toString())>1){
                                                 cartController.delete(int.parse(id(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1)),
                                            id(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1),
                                            int.parse(id(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1)),
                                             int.parse(lap(labController.statetList.where((p0) => p0.id!.toInt()== cartController.itemslab.values.toList()[index].lab).first).toString()),
                                             int.parse(qty(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1).toString()),
                                             image(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1),
                                             stock(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1),
                                             names(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1));
                                            }
                                           
                                            
                                        },
                                        icon: Image.asset(
                                          'icons/remove.png',
                                          width: 25,
                                        )),
                                    Container(
                                        alignment: Alignment.center,
                                        child: Text(qty(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1).toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                            ))),
                                    IconButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          cartController.addItem(
                                            int.parse(id(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1)),
                                            id(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1),
                                            int.parse(id(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1)),
                                             int.parse(lap(labController.statetList.where((p0) => p0.id!.toInt()== cartController.itemslab.values.toList()[index].lab).first).toString()),
                                             int.parse(qty(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1).toString()),
                                             image(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1),
                                             stock(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1),
                                             names(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1));
                                        },
                                        icon: Image.asset(
                                          'icons/add2.png',
                                          width: 23,
                                        )),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 20,
                        child: IconButton(onPressed: (){
                          if(cartController.items.values.where((element) => element.lab == cartController.itemslab.values.toList()[index].lab).length==1){
                            cartController.removeitem(int.parse(idItem(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).first)));
                            cartController.removeitemlab(cartController.itemslab.values.toList()[index].lab);
                          }else{
                             cartController.removeitem(int.parse(id(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1)));
                          }
                        
                        }, icon: Image.asset(
                                          'icons/datete.png',
                                          width: 28,
                                        )))
                    ],
                  )),
            ),),
                ],
              ),
            ),
             Positioned(
                right: 5,
                child: IconButton(onPressed: (){
                  
                  List.generate(cartController.items.values.where((element) => element.lab == cartController.itemslab.values.toList()[index].lab).length, (index2) => {
                      cartController.removeitem(int.parse(idItem(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).first))),
                      
                  });
                  cartController.removeitemlab(cartController.itemslab.values.toList()[index].lab);
                  
                  }, icon: Icon(Icons.close,size: 25,color: Colors.red,)))
            ],
                )),
              )),
            const SizedBox(height: 5),
            
          ],
        )
      )),
    );
  }

  ////////////////////////////////////////////////////
  Text lab(Lab lab) => Text(
        lab.name.toString(),
        style: const TextStyle(fontSize: 12,overflow: TextOverflow.ellipsis),
      );

     String image(List<CartItem >cartItem ,int index)=>  cartItem[index].image;

     String names(List<CartItem >cartItem ,int index)=>  cartItem[index].name;

     String stock(List<CartItem >cartItem ,int index)=>  cartItem[index].stock;

     int qty(List<CartItem >cartItem ,int index)=>  cartItem[index].quantity;

     String id(List<CartItem >cartItem ,int index)=>  cartItem[index].id;

     String idItem(CartItem cartItem)=>  cartItem.id;

     int lap(Lab lab)=>  lab.id!.toInt();
}
