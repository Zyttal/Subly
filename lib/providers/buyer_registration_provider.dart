import 'package:flutter/material.dart';

class BuyerRegistrationProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void disposeControllers() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    passwordController.dispose();
  }
}
