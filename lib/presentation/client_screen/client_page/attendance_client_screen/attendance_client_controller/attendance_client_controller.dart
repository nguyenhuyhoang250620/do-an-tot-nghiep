import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/attendance_client_screen/model/attendance_client_model.dart';

import '../../../../../data/apiClient/api_client.dart';
import '../../../../../data/models/selectionPopupModel/attendance_model.dart';

class AttendanceClientController extends GetxController{


  RxList<Attendance> getAttendanceList = <Attendance>[].obs;
  RxList<TimeCheck> getAttendanceListDetail = <TimeCheck>[].obs;

  final apiClient = ApiClient();
  var isLoading = false.obs;

  Future<void> getAttendance(String MaGV,String MaHocPhan,String MaSV,String thoigian) async {
    print(MaGV);
    print(MaHocPhan);
    print(MaSV);
    isLoading.value =false;
    getAttendanceListDetail.clear();
    List<Attendance> dataGet = [];
    List<String> listTime = [];
    await apiClient.getAttendance(MaGV,MaHocPhan,thoigian).then((value) {
      dataGet = value;
    }).whenComplete(() {
      isLoading.value =true;
      getAttendanceList.value = dataGet;
      getAttendanceList.forEach((element) {
        element.diemDanh.forEach((doc) {
          if (doc.maSV == MaSV) {
            print('HoangNH: ${doc.thoiGian!}');
            listTime.add(doc.thoiGian!);
          }
        });
      });
      if(listTime.length>1){
        TimeCheck model = TimeCheck(
          checkIn: listTime[0].substring(10,19),
          checkOut: listTime[listTime.length-1].substring(10,19),
        );
        getAttendanceListDetail.add(model); 
      }
      else{
        TimeCheck model = TimeCheck(
          checkIn: listTime[0].substring(10,19),
          checkOut: '-',
        );
        getAttendanceListDetail.add(model);
      }
    });
  }
}