import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  static ChangePasswordController get instance => Get.find();

  ///variables
  final hidePasword = true.obs;
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
}
