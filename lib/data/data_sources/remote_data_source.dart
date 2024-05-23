import 'package:get/get.dart';

import '../../utils/debug_utils.dart';
import '../core/api_client.dart';
import '../core/api_constants.dart';
import '../models/home_screen_model.dart';

abstract class RemoteDataSource {

  Future<List<HomeScreenModel>> getHomeScreenData();

}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient _apiClient = Get.find();

  @override
  Future<List<HomeScreenModel>> getHomeScreenData() async {
    final response =
        await _apiClient.get(ApiConstants.homeScreenData);
    return List<HomeScreenModel>.from(response.map((e)=>HomeScreenModel.fromJson(e)));
  }
}
