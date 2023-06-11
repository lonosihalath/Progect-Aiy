import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/bill/getx/controller.dart';
import 'package:myapp/src/bill/page/bill_screen.dart';
import 'package:myapp/src/login/call_api.dart';
import 'package:myapp/src/transactions/getx/controller.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class NotifacationScreen extends StatefulWidget {
  const NotifacationScreen({Key? key}) : super(key: key);

  @override
  State<NotifacationScreen> createState() => _NotifacationScreenState();
}

class _NotifacationScreenState extends State<NotifacationScreen> {
   BillController billController = Get.put(BillController());
  TransactionsController transactionsController = Get.put(TransactionsController());

  updateNoti(String id)async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
     var data = {
      "status": "readed"
    };
    var response = await http.put(
        Uri.parse('http://10.150.246.12:8000/materail_borrow/bills/$id/status/'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
     if(response.statusCode==200){
      billController.onInit();
     }
    
  }
  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Notifacation',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade900)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: 
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            GetBuilder<BillController>( 
              init: BillController(),
              builder: (context)=> billController.statetList.isEmpty?Padding(
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
         ):  Column(
              children: [
                Column(children: [
                          Row(
                            children: [
                              Text('Borrow order',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'noto_regular',
                                      color: Colors.grey.shade700)),
                            ],
                          )
                        ]),
                        const SizedBox(height: 15),
             Obx((){
              if(billController.isLoading.value|| transactionsController.isLoading.value){
                return Column(
                children: List.generate(billController.statetList.length, (index) => 
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: InkWell(
                        onTap: (){
                          if(billController.statetList[index].status.toString()=='waiting'){
                                 updateNoti(billController.statetList[index].id.toString());
                          }
                          Get.to(BillScreen(billsModel: billController.statetList[index],transactions: transactionsController.statetList.where((p0) => p0.bill!.toInt()==billController.statetList[index].id!.toInt()).toList(),));
                        },
                        child: Ink(
                          color: Colors.white,
                          child: Container(
                  padding:const EdgeInsets.all(8),
                  width: screen,
                  height: 70,
                  
                  child: Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(23),border: Border.all(width: 0.5,color: Colors.grey.shade300)),
                          child: const Icon(Icons.list_alt_outlined,size: 30,color: Color.fromARGB(255, 13, 208, 188)),
                        ),
                       const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text('Bill-${billController.statetList[index].borrowDate}-${billController.statetList[index].id}',style: TextStyle(fontSize: 12,fontFamily: 'noto_regular'),),
                            //const SizedBox(height: 5),
                            Text(billController.statetList[index].transactionType.toString(),style: TextStyle(color:billController.statetList[index].transactionType!.toLowerCase().toString()=='pending' || billController.statetList[index].transactionType!.toLowerCase().toString()=='cancel'? Colors.red:Color.fromARGB(255, 13, 208, 188),fontSize: 12,fontFamily: 'noto_regular')),
                          ],
                        )
                        
                      ],
                  ),
                ),
                        ),
                      ),
                    ),
                Positioned(
                  right: 0,
                  top:10,
                  child: IconButton(onPressed: (){}, icon: Image.asset('icons/right.png',width: 20,color: Colors.grey,))),
                 billController.statetList[index].status.toString()=='waiting'? Positioned(
                    right: 50,
                      top: 25,
                    child: Text('New',style: TextStyle(fontFamily: 'noto_regular',color: Color.fromARGB(255, 255, 128, 0),fontSize: 12),)): Text('')
                  ],
                )
                ),
              );
              }else{
                return  Column(
                children: List.generate(billController.statetList.length, (index) => 
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: InkWell(
                        onTap: (){
                             if(billController.statetList[index].status.toString()=='waiting'){
                                 updateNoti(billController.statetList[index].id.toString());
                          }
                          Get.to(BillScreen(billsModel: billController.statetList[index],transactions: transactionsController.statetList.where((p0) => p0.bill!.toInt()==billController.statetList[index].id!.toInt()).toList(),));
                        },
                        child: Ink(
                          color: Colors.white,
                          child: Container(
                  padding:const EdgeInsets.all(8),
                  width: screen,
                  height: 70,
                  
                  child: Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(23),border: Border.all(width: 0.5,color: Colors.grey.shade300)),
                          child: const Icon(Icons.list_alt_outlined,size: 30,color: Color.fromARGB(255, 13, 208, 188)),
                        ),
                       const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text('Bill-${billController.statetList[index].borrowDate}-${billController.statetList[index].id}',style: TextStyle(fontSize: 12,fontFamily: 'noto_regular'),),
                            //const SizedBox(height: 5),
                            Text(billController.statetList[index].transactionType.toString(),style: TextStyle(color:billController.statetList[index].transactionType.toString()=='pending' || billController.statetList[index].transactionType.toString()=='Pending'? Colors.red:Color.fromARGB(255, 13, 208, 188),fontSize: 12,fontFamily: 'noto_regular')),
                          ],
                        )
                        
                      ],
                  ),
                ),
                        ),
                      ),
                    ),
                    billController.statetList[index].status.toString()=='waiting'? Positioned(
                    right: 50,
                      top: 25,
                    child: Text('New',style: TextStyle(fontFamily: 'noto_regular',color: Color.fromARGB(255, 255, 128, 0),fontSize: 12),)): Text(''),
                Positioned(
                  right: 0,
                  top:10,
                  child: IconButton(onPressed: (){}, icon: Image.asset('icons/right.png',width: 20,color: Colors.grey,)))
                  ],
                )
                ),
              );
              }
             })
              ],
            ))

          ],
        ),
      )),
    );
  }
}