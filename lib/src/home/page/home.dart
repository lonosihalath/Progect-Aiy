
// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/page_controller.dart';
import 'package:myapp/src/home/page/home_page.dart';
import 'package:myapp/src/lap_room/page/lab_room.dart';
import 'package:myapp/src/notification/page/notification.dart';
import 'package:myapp/src/profile/page/profile.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {

  PageInttroller pageInttroller = Get.put(PageInttroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar:GetBuilder< PageInttroller>(
        init:  PageInttroller(),
        builder: (context)=> BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: pageInttroller.items.values.toList()[0].page, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            pageInttroller.addPageInt(1, index);
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: pageInttroller.items.values.toList()[0].page==0? const Icon(Icons.home):const Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Lab Room',
            icon:pageInttroller.items.values.toList()[0].page==1? const Icon(Icons.shop_sharp):const Icon(Icons.shop_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Notification',
            icon:pageInttroller.items.values.toList()[0].page==2? const Icon(Icons.notifications):const Icon(Icons.notifications_none_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon:pageInttroller.items.values.toList()[0].page==3? const Icon(Icons.person):const Icon(Icons.person_outline),
          ),
        ],
      )),
      body: GetBuilder<PageInttroller>(
        init: PageInttroller(),
        builder: (context)=>Center(
        child: _widgetOptions.elementAt(pageInttroller.items.values.toList()[0].page),
      ),)
    );
  }

  List _widgetOptions = [
    const HomeScreen(),
    const LabRoomScreen(),
    const NotifacationScreen(),
    const ProfileScreen()
  ];
  }
