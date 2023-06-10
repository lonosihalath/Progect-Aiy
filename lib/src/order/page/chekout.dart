import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/src/cart/getx/controller.dart';
import 'package:myapp/src/cart/getx/model.dart';
import 'package:myapp/src/home/page/home.dart';
import 'package:myapp/src/lap_room/getx/controller.dart';
import 'package:myapp/src/lap_room/getx/model.dart';
import 'package:myapp/src/order/getx/order_call_api.dart';
import 'package:shared_preferences/shared_preferences.dart';




class CheckOutScreen extends StatefulWidget {
  final List<BuynowItem> productbuynowl;
  const CheckOutScreen({Key? key, required this.productbuynowl}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
CartController cartController = Get.put(CartController());
LabController labController = Get.put(LabController());

  insertOrderBuynow() async {
    var date = DateTime.now();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    String? id = preferences.getString('id');
   // print('null!!!!');
    var data = {
          
      "bill": {
        "borrow_date": "${date.year}-${date.month}-${date.day}",
        "user": int.parse(id.toString()),
        "department": department(labController.statetList.where((p0) => p0.id==widget.productbuynowl[0].lab).first),
        "lab": widget.productbuynowl[0].lab,
        "transaction_type": "pending"
      },
      "transactions": [
        {
          "material": widget.productbuynowl[0].material,
          "lab": widget.productbuynowl[0].lab,
          "transaction_date": "${date.year}-${date.month}-${date.day}",
          "qty": widget.productbuynowl[0].quantity
        },
      ]
    
    };
    var res = await OrderCallApi().postDataOrder(data, token);
    if(res.statusCode == 201){
      showLog(context);
    }
    print('statusCode====>' + res.statusCode.toString());
     print('statusCode====>' + res.body.toString());
    //var body = json.decode(res.body);
  }

  int loop =0;
  ///////////////////////////////////////////////////
  insertOrdercart() async {
    var date = DateTime.now();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    String? id = preferences.getString('id');
   // print('null!!!!');
    List.generate(cartController.itemslab.length, (index)async{
      var data ={
  "bill": {
    "borrow_date": "${date.year}-${date.month}-${date.day}",
    "user": int.parse(id.toString()),
    "department": department(labController.statetList.where((p0) => p0.id==cartController.itemslab.values.toList()[index].lab).first),
    "lab": cartController.itemslab.values.toList()[index].lab,
    "transaction_type": "pending"
  },
  "transactions": List.generate(cartController.items.values.where((element) => element.lab == cartController.itemslab.values.toList()[index].lab).length, (index1) => {
      "material": int.parse(idMaterail(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1)),
      "lab": int.parse(lap(labController.statetList.where((p0) => p0.id!.toInt()== cartController.itemslab.values.toList()[index].lab).first).toString()),
      "transaction_date": "${date.year}-${date.month}-${date.day}",
      "qty": int.parse(qty(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1).toString())
    },)
};
    var res = await OrderCallApi().postDataOrder(data, token);
    if(res.statusCode == 201){
      setState(() {
        loop++;
      });
      if(cartController.itemslab.length.toInt()==loop){
        showLog(context);
      }
    }
    print('statusCode====>' + res.statusCode.toString());
    print('statusCode====>' + res.body.toString());
    });
    //var body = json.decode(res.body);
  }
  @override
  Widget build(BuildContext context) {
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
        title: Text('Checkout',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade900)),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          children: [
           Container(
            color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.68,
                     padding: EdgeInsets.only(right: 15),
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      SizedBox(height: 3),
                      SizedBox(width: 10),
                      Text('Total Borrow',
                          style: const TextStyle(
                              fontFamily: 'noto_me',
                              fontSize: 12)),
                      Text('${widget.productbuynowl.isEmpty? cartController.items.length :widget.productbuynowl.length} Item',
                          style: const TextStyle(
                              fontFamily: 'noto_me',
                              fontSize: 12,
                              color: Colors.red))
                    ],
                  ),
                ),
            InkWell(
              onTap: () {
                 dialog();
                  widget.productbuynowl.isEmpty
                                    ? insertOrdercart()
                                    : insertOrderBuynow();
              },
              child: Ink(
                color: Colors.orange,
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.32,
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
      ),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
           widget.productbuynowl.isEmpty ? Stack(
              children: [
                Column(children: List.generate(cartController.itemslab.length, (index) => Container(
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 10),
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
                    builder: (context1)=> Column(
                    children: List.generate(
                        cartController.items.values.where((element) => element.lab == cartController.itemslab.values.toList()[index].lab).length,
                        (index1) => Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    child: Image.network(image(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1)),
                                  ),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 3),
                                      Container(
                                        width:  MediaQuery.of(context).size.width*0.50,
                                        child: Text(names(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1),
                                          style: const TextStyle(fontSize: 12,overflow: TextOverflow.ellipsis),
                                        )
                                      ),
                                           const SizedBox(height: 2),
                                      // ignore: prefer_interpolation_to_compose_strings
                                      // Text('Stock Onhand: ' + stock(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1) + ' Unit',
                                      //       style: const TextStyle(fontSize: 10)),
                                      //    const SizedBox(height: 3),
                                      
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,

                              bottom: 5,
                              // ignore: prefer_interpolation_to_compose_strings
                              child: Text('x '+qty(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1).toString(),
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                )))
                          ],
                        )),
                  ),),
                      ],
                    ),
                  ),),),
                  
              ],
            )
            ///////////////////////////////////////////////////////////////////////////////////////////
            :Stack(
              children: [
                Container(
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 10),
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
                            lab(labController.statetList.where((p0) => p0.id!.toInt()== widget.productbuynowl[0].lab).first),
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
                    builder: (context1)=> Column(
                    children: List.generate(
                        widget.productbuynowl.length,
                        (index1) => Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    child: Image.network(widget.productbuynowl[0].image),
                                  ),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 3),
                                      Container(
                                        width:  MediaQuery.of(context).size.width*0.50,
                                        child: Text(widget.productbuynowl[0].name,
                                          style: const TextStyle(fontSize: 12,overflow: TextOverflow.ellipsis),
                                        )
                                      ),
                                           const SizedBox(height: 2),
                                      // ignore: prefer_interpolation_to_compose_strings
                                      // Text('Stock Onhand: ' + stock(cartController.items.values.where((element) => element.lab==cartController.itemslab.values.toList()[index].lab).toList().toList(),index1) + ' Unit',
                                      //       style: const TextStyle(fontSize: 10)),
                                      //    const SizedBox(height: 3),
                                      
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,

                              bottom: 5,
                              // ignore: prefer_interpolation_to_compose_strings
                              child: Text('x '+widget.productbuynowl[0].quantity.toString(),
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                )))
                          ],
                        )),
                  ),),
                      ],
                    ),
                  ),
                  
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              height: 35,
              color: Colors.white,
              child: Text('Order Total (${widget.productbuynowl.isEmpty? cartController.items.length :widget.productbuynowl.length} item):',style: TextStyle(fontSize: 12,)),
            )
          ],
        ),
      )),
    );
  }

  Text lab(Lab lab) => Text(
        lab.name.toString(),
        style: const TextStyle(fontSize: 12,overflow: TextOverflow.ellipsis),
      );
  int department(Lab lab)=> int.parse(lab.department.toString());


     String image(List<CartItem >cartItem ,int index)=>  cartItem[index].image;

     String names(List<CartItem >cartItem ,int index)=>  cartItem[index].name;

     String stock(List<CartItem >cartItem ,int index)=>  cartItem[index].stock;

     int qty(List<CartItem >cartItem ,int index)=>  cartItem[index].quantity;

     String idMaterail(List<CartItem >cartItem ,int index)=>  cartItem[index].id;

     String idItem(CartItem cartItem)=>  cartItem.id;

     int lap(Lab lab)=>  lab.id!.toInt();

  Future showLog(BuildContext context) {
    return Future.delayed(Duration(seconds: 1), () {
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeMain()));
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              content: Container(
                alignment: Alignment.center,
                width: 201,
                height: 96,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'icons/check.png',
                      width: 40,
                    ),
                    SizedBox(height: 10),
                     const Text('Order Successfully',
                      style: TextStyle(
                        fontFamily: 'noto_regular',
                        fontSize: 15,
                          color: Color(0xFF4D4D4F)),
                    )
                  ],
                ),
              ),
            );
          });
      cartController.clear();
      cartController.clearlab();
    });
  }

  dialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              content: Container(
                alignment: Alignment.center,
                width: 201,
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(child: CircularProgressIndicator()),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                          child: Text('Please wait',
                        style: TextStyle(fontFamily: 'noto_regular',fontSize: 15,color: Color(0xFF4D4D4F)),
                      )),
                    ),
                  ],
                ),
              ),
            ));
  }

}