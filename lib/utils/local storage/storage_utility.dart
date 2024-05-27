import 'package:get_storage/get_storage.dart';

class SlocalStorage {
  late final GetStorage _storage;

//singleton Instance
  static SlocalStorage? _instance;

  // Private constructor
  SlocalStorage._internal();

  // Factory method to get the instance
  factory SlocalStorage.instance() {
    _instance ??= SlocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = SlocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  //generic method to save the data
  Future<void> savedata<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  //generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // //generic method to remove data
  Future<void> removeData<T>(String key) async {
    await _storage.remove(key);
  }

  //clear all data in storage
  Future<void> claerAll<T>() async {
    await _storage.erase();
  }
}
