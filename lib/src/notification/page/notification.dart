import 'package:flutter/material.dart';

class NotifacationScreen extends StatelessWidget {
  const NotifacationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Notifacation',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade900)),
        centerTitle: true,
      ),
    );
  }
}