import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/src/profile/getx/controller.dart';

ProfileController profileController = Get.put(ProfileController());

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Profile',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade900)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
           
            children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(profileController.userlist[0].profileImage.toString())),
            ),
           const SizedBox(height: 25),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Name:', style: textStyle()),
                      Text(profileController.userlist[0].name.toString(), style: textStyle()),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Phone:', style: textStyle()),
                      Text(profileController.userlist[0].phoneNumber.toString(), style: textStyle()),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date of birth:', style: textStyle()),
                      Text(profileController.userlist[0].dateOfBirth.toString(), style: textStyle()),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Address:', style: textStyle()),
                      Text(profileController.userlist[0].address.toString(), style: textStyle()),
                    ],
                  ),
                  
                  const SizedBox(height: 15),
                ],
              ),
            )
          ],),
        ),
      )),
    );
  }

  TextStyle textStyle() => TextStyle(fontFamily: 'noto_regular',fontSize: 15,color: Colors.grey.shade800);
}