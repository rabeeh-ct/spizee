import 'package:get/get.dart';

import '../data/core/api_client.dart';
import '../data/data_sources/auth_local_data_source.dart';
import '../data/data_sources/auth_remote_data_source.dart';
import '../data/data_sources/remote_data_source.dart';
import '../data/repository/auth_repository_impl.dart';
import '../data/repository/data_repository_impl.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/repository/data_repository.dart';
import '../presentation/screens/home_screen/home_screen_controller.dart';

class DependencyInjection {
  static init() {
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => ApiClient(), fenix: true);
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepositoryImpl(), fenix: true);
    Get.lazyPut<AuthenticationRemoteDataSource>(() => AuthenticationRemoteDataSourceImpl(),
        fenix: true);
    Get.lazyPut<AuthenticationLocalDataSource>(() => AuthenticationLocalDataSourceImpl(),
        fenix: true);
    Get.lazyPut<DataRepository>(() => DataRepositoryImpl(), fenix: true);
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(), fenix: true);

  }
}
