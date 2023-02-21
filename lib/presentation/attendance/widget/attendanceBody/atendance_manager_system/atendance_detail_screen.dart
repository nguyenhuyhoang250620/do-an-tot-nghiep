import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:play_kit/play_kit.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import '../../../controller/attendance_controller.dart';



class DetailAttendanceScreen extends GetWidget<AttendanceController> {
  const DetailAttendanceScreen(
      {this.id,
      this.account,
      this.thoigianden,
      this.image,
      this.cameraId,
      this.datenow,
      this.avatar});

  final dynamic id;
  final dynamic account;
  final dynamic thoigianden;
  final dynamic image;
  final dynamic cameraId;
  final dynamic avatar;
  final dynamic datenow;

  @override
  Widget build(BuildContext context) {
    // debugPrint('avatar - $avatar');
    return Scaffold(
        body: _UIAtendanceDetail(
          account: account,
          avatar: avatar,
          datenoew : datenow,
        ));
  }
}

class _UIAtendanceDetail extends StatefulWidget {
  const _UIAtendanceDetail({this.account, this.avatar,this.datenoew});

  final dynamic account;
  final dynamic avatar;
  final dynamic datenoew;

  @override
  State<_UIAtendanceDetail> createState() => __UIAtendanceDetailState();
}

class __UIAtendanceDetailState extends State<_UIAtendanceDetail> {
  final HDTRefreshController _hdtRefreshController = HDTRefreshController();

  @override
  void initState() {
    // filterDetailData();
    super.initState();
  }

  // void filterDetailData() {
  //   facerecognitionController.cctvEventList.map((e) {
  //     if (e.soCmt == widget.account && facerecognitionController.changetodate(e.thoiGianXuatHien!)==widget.datenoew) {
  //       CCTVModel model = CCTVModel(
  //           id: e.id,
  //           image: e.image,
  //           cameraId: e.cameraId,
  //           thoiGianXuatHien: e.thoiGianXuatHien);
  //       _data.add(model);
  //     }
  //   }).toList();
  //   print(_data.map((e) => e.image));
  // }
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  PlayContainer(
                    height:400,
                    width: 200,
                    borderRadius: BorderRadius.circular(50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 5),
                            child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 150,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.asset(
                                        widget.avatar,
                                        height: 300,
                                        width: 300,
                                        fit: BoxFit.cover,
                                      ),
                                  ),
                              ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Tên tài khoản: ${widget.account}",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ]
                    )
                  ),
                  // TableDetail(data:_data,)
              ],
            )
          ],
        ),
      ),
    );  
  }
}


