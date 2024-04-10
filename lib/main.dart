import 'package:cubex/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
    getPages: getPages,
    initialRoute: Routes.profile,
    debugShowCheckedModeBanner: false,
    title: "Cubex nmeri"));
