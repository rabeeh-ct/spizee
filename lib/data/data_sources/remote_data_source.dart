import 'package:get/get.dart';

import '../core/api_client.dart';

abstract class RemoteDataSource {

  // Future<Model> fn(Map<String, dynamic> params);


}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient _apiClient = Get.find();

  // @override
  // Future<Model> fn(Map<String, dynamic> params) async {
  //   final response =
  //       await _apiClient.post(ApiConstants.appUrl, params: params);
  //   return Model.fromJson(response);
  // }
}
