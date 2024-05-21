
import 'package:get/get.dart';
import '../../domain/repository/data_repository.dart';
import '../data_sources/remote_data_source.dart';

class DataRepositoryImpl implements DataRepository {
  RemoteDataSource remoteDataSource = Get.find();


  // @override
  // Future<Either<AppError, Entity>> fn(
  //     Map<String, dynamic> params) async {
  //   try {
  //     final response = await remoteDataSource.fn(params);
  //     return Right(response);
  //   } on UnauthorizedException {
  //     return Left(AppError(AppErrorType.unauthorised));
  //   } on SocketException {
  //     return Left(AppError(AppErrorType.network));
  //   } on Exception {
  //     return Left(AppError(AppErrorType.api));
  //   }
  // }

}
