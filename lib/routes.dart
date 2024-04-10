import 'package:cubex/screens/Login.dart';
import 'package:cubex/screens/Profile.dart';
import 'package:cubex/screens/Register.dart';
import 'package:get/get.dart';
import 'middleware/auth_guard.dart';
import 'middleware/guest_guard.dart';

class Routes {
  static String login = "/login";

  static String register = "/register";

  static String profile = "/profile";
}

final getPages = [
  GetPage(
      name: Routes.login,
      page: () => Login(),
      middlewares: [GuestGuard()],
      binding: LoginBinding()),
  GetPage(
      name: Routes.register,
      page: () => Register(),
      middlewares: [GuestGuard()],
      binding: RegisterBinding()),
  GetPage(
      name: Routes.profile, page: () => Profile(), middlewares: [AuthGuard()])
];
