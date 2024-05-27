//these repository contains the backend related data like fetch data etc

import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stylesage/data/repositories/user/user_repositories.dart';
import 'package:stylesage/features/Authentication/controller/choice_controller/choice_controller.dart';
import 'package:stylesage/features/Authentication/screens/SignUp/singnup_screen.dart';
import 'package:stylesage/features/Authentication/screens/login/login_screen.dart';
import 'package:stylesage/features/Authentication/screens/verification/verification_screen.dart';
import 'package:stylesage/features/Authentication/screens/Choice/choice.dart';
import 'package:stylesage/features/Onboarding/screens/onboarding/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylesage/user_nav_menu.dart';
import 'package:stylesage/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_exceptions.dart';
import 'package:stylesage/utils/exceptions/firebase_plateform_exceptions.dart';
import 'package:stylesage/utils/local%20storage/storage_utility.dart';
import 'package:stylesage/vendor_nav_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //get the authenticated user data
  User? get authUser => _auth.currentUser;

  ///called from main.dart when the app is launched like init
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  ///function to show the relevand screen after checking the user
  screenRedirect() async {
    final user = _auth.currentUser;
    final roleController = Get.put(RoleController());

    if (user != null) {
      if (user.emailVerified) {
        final roleData = await roleController.retrieveUserRole();

        if (roleData != null && roleData['isChoiceDone'] == true) {
          final role = roleData['role'];

          if (role == 'user') {
            //initilize the user specific local Strorage (foviourite )
            await SlocalStorage.init(user.uid);

            Get.offAll(() => UserNavigationMenu());
          } else {
            Get.offAll(() => VendorNavigationMenu());
          }
        } else {
          Get.offAll(() => const Choice());
        }
      } else {
        Get.offAll(() => VerificationScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const SignUpScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }

//**************************email and password signin********************** */

  //login with email and password
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).meassage;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again!";
    }
  }

  //email authentication - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).meassage;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again!";
    }
  }

  //email verification

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser
          ?.sendEmailVerification(); //the current user is fetched automatically
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).meassage;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again!";
    }
  }

  //email authentication - forgot password

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).meassage;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again!";
    }
  }

  //*****************social  signin****************** */

  Future<UserCredential> signInWithGoogle() async {
    try {
      //trigger the authentication flow - open popup
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      //once signin return the user credentails
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).meassage;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again!";
    }
  }

  //*****************Federated identity****************** */

  //logout user
  Future<void> logout() async {
    try {
      //  await GetStorage().erase();
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() =>
          const LoginScreen()); //the current user is fetched automatically
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).meassage;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again!";
    }
  }

  //delete user account
  Future<void> deleteAccount() async {
    try {
      await UserRepositories.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).meassage;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again!";
    }
  }

  //*******************checking type of user************************/
}
