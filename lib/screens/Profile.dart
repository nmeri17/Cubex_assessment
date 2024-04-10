import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(context) {

    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final ProfileController c = Get.put(ProfileController());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      // appBar: AppBar(title: "${user["username"]}'s Profile"),
      appBar: AppBar(title: "Nmeri's Profile"),

      // user data goes here
      body: Column(),
  }
}