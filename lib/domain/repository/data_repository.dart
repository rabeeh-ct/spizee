import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/home_screen_entity.dart';

abstract class DataRepository {

  Future<Either<AppError, List<HomeScreenEntity>>> getHomeScreenData();

}
