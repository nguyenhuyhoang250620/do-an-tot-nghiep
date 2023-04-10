import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/data/models/selectionPopupModel/attendance_model.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/config_models.dart';
import '../../../data/models/food_model.dart';
import '../../../data/models/note_client_model.dart';
import '../../dashboard_screen/page/food_management/env/env.dart';
import '../../dashboard_screen/page/student_management/widget/env_student.dart';
import '../client_model/client_model.dart';

class ClientController extends GetxController {
  var name_menu = trang_chu.obs;
  final apiClient = ApiClient();
  var so_luong = 0.obs;
  var selectMaHocPhan = "".obs;
  var selectTenHocPhan = "".obs;

  var isLoadingConfig = false.obs;
  RxList<ConfigModel> getConfigList = <ConfigModel>[].obs;
  RxList<Map<String, dynamic>> getConfigListMap = <Map<String, dynamic>>[].obs;

  RxList<Attendance> getAttendanceList = <Attendance>[].obs;
  RxList<Map<String, dynamic>> getAttendanceListMap =
      <Map<String, dynamic>>[].obs;

  RxList<FoodModel> getDishList = <FoodModel>[].obs;

  RxList<FoodModel> getDrinksList = <FoodModel>[].obs;

  RxList<FoodModel> getDessertList = <FoodModel>[].obs;

  RxList<NoteRequestModel> listNoteRequest = <NoteRequestModel>[].obs;

  var MaGV = "".obs;
<<<<<<< Updated upstream
  RxList<ClientModel> listMaHocPhan = <ClientModel>[].obs;
=======
  var ma_hoc_phan = "".obs;
  RxList<ClientModel>listMaHocPhan = <ClientModel>[].obs;


>>>>>>> Stashed changes

  @override
  void onInit() {
    getMaGV();
    getFood();
    super.onInit();
  }

  Future<void> getMaGV() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    MaGV.value = prefs.getString('MaGV')!;
    getConfigClient(MaGV.value);
    getNoteRequest(MaGV.value);
  }

  Future<void> getConfigClient(String MaGV) async {
    List<ConfigModel> dataGet = [];
    await apiClient.getConfigClient(MaGV).then((value) {
      dataGet = value;
    }).whenComplete(() {
      dataGet.map((element) {
        ClientModel model = ClientModel(
            MaHocPhan: element.mahocphan.MaHocPhan,
            TenHocPhan: element.mahocphan.TenHocPhan);
        listMaHocPhan.add(model);
      }).toList();
      selectTenHocPhan.value = listMaHocPhan.value[0].TenHocPhan!;
<<<<<<< Updated upstream
      getConfigMaHocPhanClient(MaGV, listMaHocPhan.value[0].MaHocPhan!);
      getAttendance(MaGV, listMaHocPhan.value[0].MaHocPhan!);
=======
      getConfigMaHocPhanClient(MaGV,listMaHocPhan.value[0].MaHocPhan!);
      ma_hoc_phan.value = listMaHocPhan.value[0].MaHocPhan!;
      // getAttendance(MaGV,listMaHocPhan.value[0].MaHocPhan!);
>>>>>>> Stashed changes
    });
  }

  Future<void> getConfigMaHocPhanClient(String MaGV, String MaHocPhan) async {
    List<ConfigModel> dataGet = [];
    await apiClient.getConfigMaHocPhanClient(MaGV, MaHocPhan).then((value) {
      dataGet = value;
    }).whenComplete(() {
      isLoadingConfig.value = true;
      getConfigList.value = dataGet;
      getConfigList.map((element) {
        selectTenHocPhan.value = element.mahocphan.TenHocPhan!;
<<<<<<< Updated upstream
        getConfigListMap.value =
            element.danhsach.map((person) => person.toJson()).toList();
=======
        getConfigListMap.value =element.danhsach.map((person) => person.toJson()).toList();
        getConfigListMap.map((element) {
        }).toList();
>>>>>>> Stashed changes
      }).toList();
      getConfigList.refresh();
    });
  }

<<<<<<< Updated upstream
  Future<void> getAttendance(String MaGV, String MaHocPhan) async {
    print('HoangNH: $MaGV');
    print('HoangNH: $MaHocPhan');
=======
  Future<void> getAttendance(String MaGV,String MaHocPhan) async {
>>>>>>> Stashed changes
    List<Attendance> dataGet = [];
    await apiClient.getAttendance(MaGV, MaHocPhan).then((value) {
      dataGet = value;
    }).whenComplete(() {
      isLoadingConfig.value = true;
      getAttendanceList.value = dataGet;
      getAttendanceList.map((element) {
        getAttendanceListMap.value =
            element.diemDanh.map((person) => person.toJson()).toList();
      }).toList();
      getConfigList.refresh();
    });
  }

  void search(String query, String options) {
    getConfigList.map((element) {
      if (options == TenSV.value) {
        var result = element.danhsach
            .where((product) => product.TenSV!.contains(query))
            .toList();
        getConfigListMap.value =
            result.map((person) => person.toJson()).toList();
        getConfigListMap.refresh();
      } else if (options == MaSV.value) {
        var result = element.danhsach
            .where((product) => product.MaSV!.contains(query))
            .toList();
        getConfigListMap.value =
            result.map((person) => person.toJson()).toList();
        getConfigListMap.refresh();
      }
    }).toList();
  }

  Future<void> logout() async {
    await apiClient.logout();
  }

  Future<void> getFood() async {
    getDishList.clear();
    getDrinksList.clear();
    getDessertList.clear();
    List<FoodModel> dataGet = [];
    await apiClient.getFood().then((value) {
      dataGet = value;
    }).whenComplete(() {
      dataGet.forEach((e) {
        if (e.type == mon_ans.value) {
          FoodModel model = FoodModel(
              id: e.id,
              maMon: e.maMon,
              khoiLuong: e.khoiLuong,
              chiTiet: e.chiTiet,
              tenMonAn: e.tenMonAn,
              type: e.type,
              calo: e.calo,
              url: e.url,
              so_luong: 0.obs);
          getDishList.add(model);
        } else if (e.type == nuoc_uong.value) {
          FoodModel model = FoodModel(
              id: e.id,
              maMon: e.maMon,
              khoiLuong: e.khoiLuong,
              chiTiet: e.chiTiet,
              tenMonAn: e.tenMonAn,
              type: e.type,
              calo: e.calo,
              url: e.url,
              so_luong: 0.obs);
          getDrinksList.add(model);
        } else {
          FoodModel model = FoodModel(
              id: e.id,
              maMon: e.maMon,
              khoiLuong: e.khoiLuong,
              chiTiet: e.chiTiet,
              tenMonAn: e.tenMonAn,
              type: e.type,
              calo: e.calo,
              url: e.url,
              so_luong: 0.obs);
          getDessertList.add(model);
        }
      });
    });
  }

  Future<void> getNoteRequest(String MaGV) async {
    listNoteRequest.clear();
    List<NoteRequestModel> data = [];
    await apiClient.getNote(MaGV).then((value) {
      data = value;
    }).whenComplete(() {
      data.map((e) {
        NoteRequestModel model = NoteRequestModel(
            id: e.id,
            description: e.description,
            status: e.status,
            teacherCode: e.teacherCode,
            teacherName: e.teacherName,
            time: e.time,
            type: e.type);
        listNoteRequest.add(model);
      }).toList();
    });
  }
}
