import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../api/api.dart';
import 'dart:io';

class Register extends GetView<RegisterController> {
  final ImagePicker _picker = ImagePicker();
  // final XFile _image.obs;
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('REGISTER')),
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
              TextButton(onPressed: () async {
                _image = await _picker.pickImage(source: ImageSource.gallery);
                controller.setImageController(_image!);
              }, child: Obx(() {
                return _image == null
                    ? const Text('No image selected.')
                    : Image.file(
                        File(_image!.path),
                      );
              })),
              TextButton(
                child: const Text('Register'),
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
  XFile? imageController = null;

  void setImageController(XFile image) {
    imageController = image;
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  void register() {
    if (registerFormKey.currentState!.validate()) {
      Api api = Get.put(Api());

      api.registerUser({
        "email": emailController.text,
        "password": passwordController.text,
        "username": usernameController.text,
        "phone": phoneController.text,
        "address": addressController.text
      }, imageController as MultipartFile).then((response) {
        if (response.body["username"] != null) {
          GetStorage box = GetStorage();
          box.write('user_token', response.body["token"]);
          Get.snackbar('Register', 'Register successfully');
        } else {
          Get.snackbar('Register', 'Invalid registration data');
        }
        passwordController.clear();
      });
    }
  }
}
