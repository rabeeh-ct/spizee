import 'package:get/get.dart';

import '../data/core/api_client.dart';
import '../data/core/firebase_auth_client.dart';
import '../data/data_sources/auth_remote_data_source.dart';
import '../data/data_sources/remote_data_source.dart';
import '../data/repository/auth_repository_impl.dart';
import '../data/repository/data_repository_impl.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/repository/data_repository.dart';

class DependencyInjection {
  static init() {
    Get.lazyPut(() => ApiClient(), fenix: true);
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepositoryImpl(), fenix: true);
    Get.lazyPut<AuthenticationRemoteDataSource>(() => AuthenticationRemoteDataSourceImpl(),
        fenix: true);
    Get.lazyPut<DataRepository>(() => DataRepositoryImpl(), fenix: true);
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(), fenix: true);
    Get.lazyPut(() => FirebaseAuthClient(), fenix: true);

  }
}
