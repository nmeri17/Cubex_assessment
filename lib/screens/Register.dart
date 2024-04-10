import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  
  final Api api = Get.put(Api());

  @override
  Widget build(context){
     // store token in storage after login
     return Scaffold(body: Center(child: Text("form fields go here")));
  }
}