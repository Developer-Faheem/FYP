import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/Loaders/loaders.dart';

class NetworkManger extends GetxController {
  static NetworkManger get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  //initilize the netword manager and stup a stream to continually check the connection status
  @override
  void onInit() {
    super.onInit();
    // _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
    //     _updateConnectionStatus);
  }

  ///update the connection status on the basis of cahnge in connectvity and show the relevent pop for no internet connection
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      SLoaders.warningSnackbar(Title: 'No Internet connection');
    }
  }

  ///checking the internet connected or not
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (exception) {
      return false;
    }
  }

  ///dispose the active connectivity stream
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
