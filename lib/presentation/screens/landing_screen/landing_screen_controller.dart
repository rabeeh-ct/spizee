import 'package:get/get.dart';
import 'package:spizee/domain/usecases/google_sign_in_usecase.dart';

import '../../../domain/params/no_params.dart';
import '../../../domain/usecases/logout_usecase.dart';
import '../../../utils/debug_utils.dart';
import '../../routes/route_constants.dart';

class LandingScreenController extends GetxController {

  final GoogleSignInUseCase _googleSignInUseCase =Get.put(GoogleSignInUseCase());

  googleSignIn() async {
    // await logOut();
    NoParams noParams = const NoParams();
    final response = await _googleSignInUseCase(noParams);
    response.fold((l) => l.handleError(), (r) async {
      if (r != null) {
        consoleLog(r);
        Get.offAllNamed(RouteList.homeScreen);
      } else {}
    });
  }

  final LogOutUseCase _logOutUseCase =Get.put(LogOutUseCase());

  logOut({bool isNavigate=false}) async {
    NoParams noParams = const NoParams();
    final response = await _logOutUseCase(noParams);
    response.fold((l) => l.handleError(), (r) async {
      if(isNavigate){
        Get.offAllNamed(RouteList.initial);
      }
    });
  }

}