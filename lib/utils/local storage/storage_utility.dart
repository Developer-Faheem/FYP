// import 'package:get_storage/get_storage.dart';

// class SlocalStorage {
//   static final SlocalStorage _instance = SlocalStorage._internal();

// // Private constructor
//   SlocalStorage._internal();

//   // Factory method to get the instance
//   factory SlocalStorage() {
//     return _instance;
//   }

//   final _storage = GetStorage();

//   //generic method to save the data
//   Future<void> savedata<T>(String key, T value) async {
//     await _storage.write(key, value);
//   }

//   //generic method to read data
//   T? readData<T>(String key) {
//     return _storage.read<T>(key);
//   }

//   // //generic method to remove data
//   Future<void> removeData<T>(String key) async {
//     await _storage.remove(key);
//   }

//   //clear all data in storage
//   Future<void> claerAll<T>() async {
//     await _storage.erase();
//   }
// }
