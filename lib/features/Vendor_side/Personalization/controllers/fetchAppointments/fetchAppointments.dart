import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';
import 'package:stylesage/data/repositories/appointment_repository/appoinntment_repository.dart';
import 'package:stylesage/data/repositories/package_repository/package_repository.dart';
import 'package:stylesage/features/Authentication/controller/user_controller/user_controller.dart';
import 'package:stylesage/features/Authentication/models/vendor_model/vendor_model.dart';
import 'package:stylesage/features/User_side/Shop/controllers/booking_controller/booking_controller.dart';
import 'package:stylesage/features/User_side/Shop/models/appointment.dart';
import 'package:stylesage/features/User_side/Shop/screens/success/success_screen.dart';
import 'package:stylesage/features/Vendor_side/Salon/models/package_model/package_model.dart';
import 'package:uuid/uuid.dart';

class AppointmentControllerVendor extends GetxController {
  static AppointmentControllerVendor get instance => Get.find();

  final userController = UserController.instance;
  final bookingController = BookingController.instance;
  final appointmentRepository = Get.put(AppointmentRepositories());
  final profileLoading = false.obs;
  var abc;
  final RxList<AppointmentModel> appointment = <AppointmentModel>[].obs;

  AppointmentControllerVendor();

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchupAllVendor();
  }

  void fetchupAllVendor() async {
    try {
      //start the loader
      isLoading.value = true;

      //fetch the categories
      final appointmentsList = await appointmentRepository.fetchAll();

      //update the category list
      appointment.assignAll(appointmentsList);
    } catch (e) {
      SLoaders.errorSnackbar(
          Title: 'oh Sanp!',
          message: "something went wrong while fetching the salon data");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateAppointmentDataVndor() async {
    try {
      //update user name ,gender,and the phone number
      Map<String, dynamic> data = {
        'userSideStatus': 'completed',
        'vendorSideStatus': 'completed'
      };

      //send eamil to reset the password
      await appointmentRepository.updateSingleField(data);

      // //update the fields in the usercontroller
      // userController.user.value.name = name.text.trim();
      // userController.user.value.gender = gender.text.trim();
      // userController.user.value.phoneNumber = phoneNumber.text.trim();

      fetchupAllVendor();
      // //remove the loader
      // //FullScreenLoader.stopLoading();

      //show the success message
      SLoaders.successSnackbar(
          Title: "Congratulations",
          message: "Your appointment has been cancelled");

      // //redirect to next screen
      // Get.off(() => const ProfileScreen());
    } catch (e) {
      //remove the loader
      //FullScreenLoader.stopLoading();

      //show the success message
      SLoaders.successSnackbar(
          Title: "Appointment not cancelled",
          message: "Your appointment has been cancelled");
    }
  }

  ///save user record from any registration provider
  Future<void> saveAppointmentRecord(VendorModel vendor) async {
    try {
      var uuid = Uuid();
      String randomId = uuid.v4();

      //mapping the data
      final appointmentData = AppointmentModel(
        appointmentId: randomId,
        userId: userController.user.value.id,
        vendorId: vendor.id,
        salonProfileUrl: vendor.profilePicture,
        userProfileUrl: userController.user.value.profilePicture,
        services: bookingController.combinedNamesString.toString(),
        userName: vendor.userName,
        bookingTime: bookingController.formattedSelectedTime.toString(),
        bookingDate: bookingController.selectedDate.toString(),
        vendorAddress: vendor.address,
        vendorTagline: vendor.tagline,
        salonName: vendor.salonName,
        userSideStatus: 'upcoming',
        vendorSideStatus: 'pending',
        totalPrice: bookingController.totalPrice,
        rating: vendor.ratings,
      );

      await appointmentRepository.saveAppointmentRecord(appointmentData);

      Get.off(() => SuccessScreen(vendor: vendor));
    } catch (e) {
      SLoaders.warningSnackbar(
          Title: 'Data not saved',
          message: "Something went wrong while saving your appointment info.");
    }
  }
}
