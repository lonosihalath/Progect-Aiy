import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/page_controller.dart';
import 'package:myapp/controller_binding/controller_binding.dart';
import 'package:myapp/src/home/page/home.dart';
import 'package:myapp/src/login/login.dart';

PageInttroller pageInttroller = Get.put(PageInttroller());

void main() {
  addPageInt();
  runApp(const MyApp());
}

addPageInt(){
  pageInttroller.addPageInt(1, 0);
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'myapp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: ControllerBindings(),
      home: const LoginScreen(),
    );
  }
}

