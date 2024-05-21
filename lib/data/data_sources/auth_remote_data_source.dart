import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../utils/debug_utils.dart';
import '../core/api_client.dart';
import '../core/firebase_auth_client.dart';
import '../core/firebase_client.dart';
import '../models/user_model.dart';
//
abstract class AuthenticationRemoteDataSource {
  Future<UserModel> login(Map<String, dynamic> params);

  Future<UserModel> register(Map<String, dynamic> params);
//
  Future<void> logout();
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
}
