import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../utils/debug_utils.dart';
import '../core/firebase_auth_client.dart';

abstract class AuthenticationRemoteDataSource {

  Future<void> logout();

  Future<User?> googleSignIn();

  Future<User?> phoneNumberSignIn(Map<String,dynamic> params);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final FirebaseAuthClient firebaseAuthClient = Get.find();

  @override
  Future<void> logout() async {
    final response = await firebaseAuthClient.logout();
    return response;
  }

  @override
  Future<User?> googleSignIn() async {
    consoleLog(">>>>>>>>>>>");
    final response = await firebaseAuthClient.signInWithGoogle();
    return response;
  }

  @override
  Future<User?> phoneNumberSignIn(Map<String,dynamic> params) async {
    consoleLog(">>>>>>>>>>>");
    final response = await firebaseAuthClient.phoneNumberSignIn(params);
    return response;
  }
}
