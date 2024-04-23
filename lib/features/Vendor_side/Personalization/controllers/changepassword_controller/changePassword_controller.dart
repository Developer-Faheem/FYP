import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChangePasswordControllerVendor extends GetxController {
  static ChangePasswordControllerVendor get instance => Get.find();

  ///variables
  final hidePasword = true.obs;
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  GlobalKey<FormState> changePasswordFormKeyVendor = GlobalKey<FormState>();
}
