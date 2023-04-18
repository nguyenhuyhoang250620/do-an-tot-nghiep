import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/referal_info_detail.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TopReferals extends StatelessWidget {
  TopReferals({Key? key}) : super(key: key);
  final controller = Get.find<DashBoardController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      padding: EdgeInsets.all(appPadding),
      margin: EdgeInsets.symmetric(horizontal: appPadding*2,vertical: appPadding),
      decoration: BoxDecoration(
        color: colorItem,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  child: Text(
                    'Danh sách giảng viên',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Text(
                    'Phòng ban',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Text(
                    'Chi tiết',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: appPadding,
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.getTeacherList.length,
              itemBuilder: (context, index) => ReferalInfoDetail(
                info: controller.getTeacherList.value[index],
              ),
            ),)
          )
        ],
      ),
    );
  }
}
