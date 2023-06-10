import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/lap_room/getx/model.dart';
import 'package:myapp/src/materail_product/detail/product_detail.dart';
import 'package:myapp/src/materail_product/getx/model.dart';

import '../../materail_product/getx/controller.dart';


class LabDetails extends StatelessWidget {
  final List<Product> product;
  final Lab lab;
  const LabDetails({Key? key, required this.product, required this.lab}) : super(key: key);

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
        title: Text(lab.name.toString(),
            style: TextStyle(fontSize: 18, color: Colors.grey.shade900)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
        child: Column(children: [
         product.length.toInt() ==0 ? 
         Padding(
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
         )
         :Column(
           children: [
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
             Container(
              alignment: Alignment.topLeft,
              width:  MediaQuery.of(context).size.width,
              child: Wrap(
                        runSpacing: 15,
                        spacing: 15,
                        children: List.generate(
                            product.length,
                            (index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                                product: product
                                                    .where((p0) =>
                                                        p0.id.toString() ==
                                                        product[index].id
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
                                              child: Image.network(product[index].image
                                                  .toString())),
                                          const SizedBox(height: 8),
                                          Text(
                                              product[index].name
                                                  .toString(),
                                            overflow: TextOverflow.ellipsis,
                                              style: name),
                                          Text(
                                            product[index].description
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
                                                  product[index].qtyOnhand
                                                      .toString() +
                                                  ' Unit',
                                              style: stock),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      ),
             )
           ],
         )
        ],),
      )),
    );
  }
}