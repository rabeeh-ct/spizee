import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../utils/debug_utils.dart';
import '../core/api_client.dart';
import '../core/firebase_auth_client.dart';
import '../core/firebase_client.dart';
import '../models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<UserModel> login(Map<String, dynamic> params);

  Future<UserModel> register(Map<String, dynamic> params);

  Future<void> logout();

  Future<User?> googleSignIn();

  Future<User?> phoneNumberSignIn(String params);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final ApiClient _apiClient = Get.find();
  final FirebaseAuthClient firebaseAuthClient = Get.find();
  final FirebaseClient firebaseClient = Get.find();

  @override
  Future<UserModel> login(Map<String, dynamic> params) async {
    final response = await firebaseAuthClient.login(params: params);
    consoleLog(">>>>>>>>>>>>>$response");
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    final response2= await firebaseClient.get(docRef: ref.doc(response?.uid));
    consoleLog(">>>>>>>>>>>>>$response2");
    return UserModel.fromJson(response2.data,id: response2.id);
  }

  @override
  Future<UserModel> register(Map<String, dynamic> params) async {
    final response = await firebaseAuthClient.register(params: params);
    params.remove("password");
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    UserModel userModel = UserModel(userId: response?.uid,
        name: params["name"],
        email: params["email"],
        role: params["role"]);
    await
    firebaseClient.post(
        params: userModel.toJson(), docRef: ref.doc(response?.uid));
    return userModel;
  }

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
  Future<User?> phoneNumberSignIn(String params) async {
    consoleLog(">>>>>>>>>>>");
    final response = await firebaseAuthClient.phoneNumberSignIn(params);
    return response;
  }
}
