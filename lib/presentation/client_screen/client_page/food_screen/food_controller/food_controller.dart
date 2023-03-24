import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/food_management/env/env.dart';



class FoodController extends GetxController{
  var name_tab = mon_ans.obs;
  final apiClient = ApiClient();
  Future<void> orderFood(
    String MaGV,
    String maMon,
    String tenMonAn,
    int so_luong,
    String url,
    String thoiGian
  ) async{
    await apiClient.createOrderFood(MaGV, maMon, tenMonAn, so_luong, url, thoiGian);
  }

}