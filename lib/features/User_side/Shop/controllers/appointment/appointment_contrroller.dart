import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/package_repository/package_repository.dart';
import 'package:stylesage/features/Authentication/controller/user_controller/user_controller.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';
import 'package:stylesage/features/User_side/Shop/controllers/booking_controller/booking_controller.dart';
import 'package:stylesage/features/User_side/Shop/models/appointment.dart';
import 'package:stylesage/features/Vendor_side/Salon/models/package_model/package_model.dart';

class AppointmentController extends GetxController {
  static AppointmentController get instance => Get.find();
  // final VendorModel vendorId;
  // final pacakageRepository = Get.put(PackageRepositories());
  // final RxList<PackageModel> packages = <PackageModel>[].obs;
  final userController = UserController.instance;
  final bookingController = BookingController.instance;

  AppointmentController();

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  ///save user record from any registration provider
  Future<void> saveAppointmentRecord(VendorModel vendor) async {
    //final currentUser = FirebaseAuth.instance.currentUser;
    print('-----------------------------------------------------------');
    print(vendor?.city);
    print(userController.user.value.email);
    print(bookingController.formattedSelectedTime);
    print(bookingController.selectedDate);
    print(bookingController.selectedDate);
    print(bookingController.totalPrice.toString());
    print(bookingController.combinedNamesString.toString());

    //refresh user record
    //  await fetchUserRecord();

    try {
      //   if (user.value.id.isEmpty) {
      // if (currentUser != null) {

      //mapping the data
      //final appointmentData =AppointmentModel(appointmentId: appointmentId, userId: userId, vendorId: vendorId, salonProfileUrl: salonProfileUrl, userProfileUrl: userProfileUrl, services: services, userName: userName, bookingTime: bookingTime, bookingDate: bookingDate, vendorAddress: vendorAddress, vendorTagline: vendorTagline, salonName: salonName, userSideStatus: userSideStatus, vendorSideStatus: vendorSideStatus, totalPrice: totalPrice, rating: rating)

      //save user data
      //  await userRepository.saveUserRecord(user);
      // }
      // }
    } catch (e) {
      SLoaders.warningSnackbar(
          Title: 'Data not saved',
          message: "Something went wrong while saving your appointment info.");
    }
  }
}
