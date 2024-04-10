import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../api/api.dart';

class Login extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LOGIN')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: controller.validator,
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: controller.validator,
                obscureText: true,
              ),
              TextButton(
                child: const Text('Login'),
                onPressed: controller.login,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    GetStorage box = GetStorage();

    emailController.text = box.read("user_email");
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  void login() {
    if (loginFormKey.currentState!.validate()) {
      Api api = Get.put(Api());

      api.loginUser({
        "email": emailController.text,
        "password": passwordController.text
      }).then((response) {
        if (response.body["token"] != null) {
          GetStorage box = GetStorage();
          box.write('user_token', response.body["token"]);
          Get.snackbar('Login', 'Login successfully');
        } else {
          Get.snackbar('Login', 'Invalid email or password');
        }
        passwordController.clear();
      });
    }
  }
}
