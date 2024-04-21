import 'package:cubex/api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    Api api = Get.put(Api());
    Map userDetails = {}.obs;
    api.getUser().then((value) => userDetails = value);

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      // appBar: AppBar(title: "${user["username"]}'s Profile"),
      appBar: AppBar(
        title: Text("${userDetails['username']}'s profile"),
      ),

      // user data goes here
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                child: Image.asset(userDetails['image']),
              ),
              Text(userDetails['username']),
              Text(userDetails['email']),
              Text(userDetails['address']),
              Text(userDetails['phone']),
            ],
          ),
        ),
      ),
    );
  }
}
