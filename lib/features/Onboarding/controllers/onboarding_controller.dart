import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///variables
  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;

//update current indes when Page scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

//update current index and jump to next page
  void nextPage() {
    int page = currentPageIndex.value + 1;
    pageController.jumpToPage(page);
  }

//update current index and jump to previous page
  void previousPage() {
    int page = currentPageIndex.value - 1;
    pageController.jumpToPage(page);
  }

//jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
