import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }
}
