import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/src/home/page/home_page.dart';
import 'package:myapp/src/lap_room/getx/controller.dart';
import 'package:myapp/src/lap_room/page/lab_detail.dart';

LabController labController = Get.put(LabController());

class LabRoomScreen extends StatelessWidget {
  const LabRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Lab room',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade900)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    labController.statetList.length,
                    (index) => InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> LabDetails(lab: labController.statetList[index],product: productController.statetList.where((p0) => p0.rabId!.id==labController.statetList[index].id).toList(),)));
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            color: Colors.grey.shade50.withOpacity(0),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 15, 94, 159),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Text(
                                    'LAB',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'noto_ragular',
                                        fontSize: 12),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(labController.statetList[index].name.toString(),style: TextStyle(color: Colors.grey.shade800,fontFamily: 'noto_ragular',fontSize: 14),)

                              ],
                            ),
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
