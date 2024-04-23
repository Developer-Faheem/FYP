import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  ///variables
  final email = TextEditingController();
  //final password = TextEditingController();

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
}
