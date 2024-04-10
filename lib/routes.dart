import 'package:get/get.dart';

class Routes {
	static String login = "/login";

	static String register = "/register";

	static String profile = "/profile";
}


final getPages = [

	GetPage(
		name: Routes.login
		page: () => const Login()
		middlewares: [GuestGuard()],
        binding: LoginBinding()
	),

	GetPage(
		name: Routes.register
		page: () => const Register()
		middlewares: [GuestGuard()]
	),

	GetPage(
		name: Routes.profile
		page: () => const Profile()
		middlewares: [AuthGuard()]
	)
];