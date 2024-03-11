import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/features/Shop/screens/SaloonProfile/widget/service_selection_dropdown.dart';

class ServicesTab extends StatelessWidget {
  ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final DropDownController controller = Get.put(DropDownController());

    print(controller.selectedItems1);
    print(controller.selectedItems2);
    return Column(
      children: [
        ServiceSelectionDropdown(
          serviceName: "Hair services",
          selectedItems: controller.selectedItems1,
          items: const [
            {'id': 'Cutting', 'label': 'Hair Cutting'},
            {'id': 'Colouring', 'label': 'Hair Colouring'},
            {'id': 'Perming', 'label': 'Hair Perming'},
            {'id': 'Keritin Treatment', 'label': 'Keritin Treatment'},
            {'id': 'Spa Treatment', 'label': 'Spa Treatment'},
            {'id': 'Perms and Relaxers', 'label': 'Perms and Relaxers'},
          ],
        ),
        ServiceSelectionDropdown(
          selectedItems: controller.selectedItems2,
          serviceName: "Nail services",
          items: const [
            {'id': 'Cutting', 'label': 'Hair Cutting'},
            {'id': 'Colouring', 'label': 'Hair Colouring'},
            {'id': 'Perming', 'label': 'Hair Perming'},
            {'id': 'Keritin Treatment', 'label': 'Keritin Treatment'},
            {'id': 'Spa Treatment', 'label': 'Spa Treatment'},
            {'id': 'Perms and Relaxers', 'label': 'Perms and Relaxers'},
          ],
        ),
      ],
    );
  }
}
