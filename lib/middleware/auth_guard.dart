import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthGuard extends GetMiddleware {
	@override
	RouteSettings redirect (String route) {

		GetStorage box = GetStorage();

		return !box.hasData('token') ? RouteSettings(name: Routes.login): null;
	}
}
