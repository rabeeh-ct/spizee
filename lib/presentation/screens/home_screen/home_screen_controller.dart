import 'package:get/get.dart';
import 'package:spizee/domain/params/no_params.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/home_screen_entity.dart';
import '../../../domain/usecases/get_home_screen_data_usecase.dart';
import '../../../utils/snackbar_utils.dart';

class HomeScreenController extends GetxController {

  final _getHomeScreenDataUseCase= Get.put(GetHomeScreenDataUseCase());

  Rxn<HomeScreenEntity> homeScreenEntity=Rxn<HomeScreenEntity>();

  AppError? appError;
    RxBool pageLoading = false.obs;

    Future<void> pullRefresh() async {
      return await getData(isPull: true);
    }

    getData({bool isPull = false}) async {
      if (!isPull) {
        pageLoading(true);
      }
      appError = null;
      final response = await _getHomeScreenDataUseCase(const NoParams());
      response.fold((l) {
        appError = l;
        return l.handleError();
      }, (r) async {
        if (r.isNotEmpty) {
          homeScreenEntity.value=r.first;
        } else {
          showMessage("No Data found",isError: true);
        }
      });
      pageLoading(false);
    }

    RxInt cartCount=0.obs;
    changeCartCount({required bool isAdd}){
      if(isAdd){
        cartCount.value+=1;
      }else{
        cartCount.value-=1;
      }
    }

}