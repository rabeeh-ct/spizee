import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/debug_utils.dart';
import '../models/firebase_response_data.dart';

class FirebaseClient{

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  dynamic post({Map<dynamic, dynamic>? params,required DocumentReference docRef}) async {
    consoleLog(jsonEncode(params));
    final response = await docRef.set(params);
    return ;
  }

  Future<FirebaseResponseData> get({Map<dynamic, dynamic>? params,required DocumentReference docRef}) async {
    consoleLog(jsonEncode(params));
    final response = await docRef.get();
    return FirebaseResponseData(data: response.data() as Map<String,dynamic>, id: response.id);
  }

  Future<FirebaseResponseData> update({required Map<Object, Object?> params,required DocumentReference docRef}) async {
    consoleLog("${jsonEncode(params)} :::::");

    final response = await docRef.update(params);
    return FirebaseResponseData(data: null,);
  }

  Future<FirebaseResponseData> set({required Map<String, dynamic> params,required DocumentReference docRef}) async {
    consoleLog("${jsonEncode(params)} :::::");

    final response = await docRef.set(params,SetOptions(merge: true));
    return FirebaseResponseData(data: null,);
  }

  Future<List<FirebaseResponseData>> getList({Map<dynamic, dynamic>? params,required CollectionReference collRef}) async {
    consoleLog(jsonEncode(params));
    final response = await collRef.get();
    return response.docs.map((e) => FirebaseResponseData(data: e.data() as Map<String,dynamic>, id: e.id)).toList();
  }
}