import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/controller/page_controller.dart';
import 'package:myapp/src/bill/getx/model.dart';
import 'package:myapp/src/lap_room/getx/controller.dart';
import 'package:myapp/src/lap_room/getx/model.dart';
import 'package:myapp/src/materail_product/getx/controller.dart';
import 'package:myapp/src/materail_product/getx/model.dart';
import 'package:myapp/src/transactions/getx/model.dart';

class BillScreen extends StatefulWidget {
  final BillsModel billsModel;
  final List<Transactions> transactions;
  const BillScreen({Key? key, required this.billsModel, required this.transactions}) : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {

ProductController productController = Get.put(ProductController());
LabController labController = Get.put(LabController());
PageInttroller pageInttroller = Get.put(PageInttroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
         backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              pageInttroller.addPageInt(1, 1);
              pageInttroller.addPageInt(1, 2);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.grey)),
        elevation: 0,
        title: Text('Borrow Detail',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade900)),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: widget.billsModel.transactionType!.toLowerCase().toString()=='pending'||widget.billsModel.transactionType!.toLowerCase().toString()=='cancel'? Colors.red: Color.fromARGB(255, 13, 208, 188),
        child: Text(widget.billsModel.transactionType.toString(),style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: 'noto_me'),),
      ),
      body: SingleChildScrollView(child: Column(
        children: [
         const SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: 70,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),border: Border.all(width: 0.5,color: Colors.grey.shade300)),
                          child: const Icon(Icons.list_alt_outlined,size: 20,color: Color.fromARGB(255, 13, 208, 188)),
                        ),
                        const SizedBox(width: 10),
                            Text('Bill-${widget.billsModel.borrowDate}-${widget.billsModel.id}',style: TextStyle(fontSize: 12,fontFamily: 'noto_me'),),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Container(
                      width: 25,
                      child: const Icon(Icons.location_on_outlined,size: 20,color: Colors.orange)),
                  const SizedBox(width: 10),
                lab(labController.statetList.where((p0) => p0.id==widget.billsModel.lab).first)
                  ],
                ),
                

              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: 40,
            color: Colors.white,
            child:Text(
                  'Materail Order',
                  style: stock,
                ) ,
          ),
          const SizedBox(height: 5),
          Column(
            children: List.generate(widget.transactions.where((element) => element.bill == widget.billsModel.id).length, (index) => Stack(
              children: [
                Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
            height: 80,
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Image.network(image(productController.statetList.where((p0) => p0.id==widget.transactions[index].material).first, index)),
                ),
                SizedBox(width: 15),
                Container(
                  width: MediaQuery.of(context).size.width *0.60,
                  child: Text(nameproduct(productController.statetList.where((p0) => p0.id==widget.transactions[index].material).first, index),
                                          overflow: TextOverflow.ellipsis,
                                            style: name),
                ),
              ],
            ),
            ),
              Positioned(
                              right: 20,

                              bottom: 20,
                              // ignore: prefer_interpolation_to_compose_strings
                              child: Text('x '+widget.transactions[index].qty.toString(),
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'noto_regular'
                                                )))
              ],
            )
            ),
          )
        ],
      )),
    );
  }

  Text lab(Lab lab) => Text(
        lab.name.toString(),
        style: const TextStyle(fontSize: 12,fontFamily: 'noto_me'),
      );

      String image(Product product ,int index)=>  product.image.toString();

      String nameproduct(Product product ,int index)=>  product.name.toString();
}