import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('REGISTER')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.registerFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: controller.validator,
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: controller.validator,
                obscureText: true,
              ),

              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: controller.validator,
              ),
              TextFormField(
                controller: controller.phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: controller.validator,
              ),
              TextFormField(
                controller: controller.addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: controller.validator,
              ),
              /*TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(labelText: 'Image'),
                validator: controller.validator,
              ),*/
              RaisedButton(
                child: Text('Register'),
                onPressed: controller.register,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}

class RegisterController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  //final passwordController = TextEditingController();
  
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  void register() {
    if (registerFormKey.currentState.validate()) {

      Api api = Get.put(Api());
      
      api.register(emailController.text, passwordController.text).then((auth) {
        if (auth) {
          Get.snackbar('Register', 'Register successfully');
        } else {
          Get.snackbar('Register', 'Invalid registration data');
        }
        passwordController.clear();
      });
    }
  }
}
