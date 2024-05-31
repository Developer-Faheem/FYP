import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/Authentication/controller/user_controller/user_controller.dart';
import 'package:stylesage/features/User_side/Shop/controllers/appointment/appointment_contrroller.dart';
import 'package:stylesage/features/User_side/Shop/controllers/booking_controller/booking_controller.dart';
import 'package:stylesage/features/User_side/Shop/screens/appointment/widgets/cancelled.dart';
import 'package:stylesage/features/User_side/Shop/screens/appointment/widgets/completed.dart';
import 'package:stylesage/features/User_side/Shop/screens/appointment/widgets/upcoming.dart';
import 'package:stylesage/user_nav_menu.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    final bookingController = Get.put(BookingController());
    final appointmentController = Get.put(AppointmentController());
    final controller = NavigationController.instance;

    return DefaultTabController(
      length: 3,
      child: Container(
        color: SColors.bgMainScreens,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Appointments",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              leading: GestureDetector(
                onTap: () => controller.updateIndex(0),
                child: Padding(
                  padding: const EdgeInsets.only(left: SSizes.lg),
                  child: SvgPicture.asset(
                    "assets/icons/back_filled.svg",
                  ),
                ),
              ),
              bottom: TabBar(
                dividerColor: SColors.dividersColor,
                indicatorColor: SColors.tertiary,
                tabs: [
                  Tab(
                    child: Text(
                      "Upcoming",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Completed",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Cancelled",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [Upcoming(), Completed(), Cancelled()],
            ),
          ),
        ),
      ),
    );
  }
}
