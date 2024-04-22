import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stylesage/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:stylesage/features/Onboarding/screens/splash/splash_screen.dart';
import 'package:stylesage/firebase_options.dart';
import 'package:stylesage/utils/theme/theme.dart';

void main() async {
  //Todo: Add Widget binding
  WidgetsFlutterBinding.ensureInitialized();

  //Todo: init local storage
  await GetStorage.init();

  //Todo: await native splash

  //Todo: initilize the firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  //Todo: initilize the Authentication
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SAppTheme.lightTheme,
      // darkTheme: SAppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
