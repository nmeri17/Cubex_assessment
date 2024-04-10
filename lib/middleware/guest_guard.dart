import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes.dart';

class GuestGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    GetStorage box = GetStorage();

    return box.hasData('token') ? RouteSettings(name: Routes.profile) : null;
  }
}
