import 'package:flutter/material.dart';

class ProfileController extends GetxController{ // this isn't the page itself but serves as a container for the page's state. The page itself can be stateless
  var count = 0.obs;
  increment() => count++;
}

class Profile extends StatelessWidget {

  @override
  Widget build(context) {

    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final ProfileController c = Get.put(ProfileController());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      // appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
      appBar: AppBar(title: "${user["name"]}'s Profile"),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(child: ElevatedButton(
              child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
      /*floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));*/
  }
}