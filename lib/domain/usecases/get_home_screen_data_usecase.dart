import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:spizee/domain/params/no_params.dart';
import 'package:spizee/domain/repository/data_repository.dart';
import 'package:spizee/utils/debug_utils.dart';

import '../entities/app_error.dart';
import '../entities/home_screen_entity.dart';
import 'usecase.dart';

class GetHomeScreenDataUseCase extends UseCase<List<HomeScreenEntity>, NoParams> {
  final DataRepository _dataRepository = Get.find();

  @override
  Future<Either<AppError, List<HomeScreenEntity>>> call(NoParams params,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dataRepository.getHomeScreenData();
  }
}
