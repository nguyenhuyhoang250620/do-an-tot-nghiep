import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/controller/home_controller.dart';
import 'package:do_an_tot_nghiep/widgets/custom_drop_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TimeAttendance extends StatelessWidget {
  TimeAttendance({Key? key, required this.controller}) : super(key: key);
  HomeController controller;
  @override
  Widget build(BuildContext context) {
    getDateTime() {
      final int diff = controller.endDate.value.difference(controller.startDate.value).inDays;
      print(diff);
      final items = List<DateTime>.generate(diff + 1, (index) {
        final item = controller.startDate.value.add(Duration(days: index));
        return item;
      });
      items.map((e) => print(e.toString())).toList();
      return diff;
    }

    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            flex: 1,
            child: Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  'Nhân viên',
                  style: AppStyle.txtInterRegular14,
                ),
                Obx(
                  () => CustomDropDown(
                    width: 200,
                    variant: DropDownVariant.FillWhiteA700,
                    focusNode: FocusNode(),
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    hintText: "",
                    padding: DropDownPadding.PaddingAll2,
                    fontStyle: DropDownFontStyle.InterRegular18,
                    items: controller.timeAttendanceModel.value.dropdownHome.value,
                    onChanged: (value) {
                      controller.onSelectedHome(value);
                    },
                  ),
                ),
                Text(
                  'Thời gian',
                  style: AppStyle.txtInterRegular14,
                ),
                Obx(
                  () => CustomDropDown(
                    width: 200,
                    variant: DropDownVariant.FillWhiteA700,
                    focusNode: FocusNode(),
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    hintText: "",
                    padding: DropDownPadding.PaddingAll2,
                    fontStyle: DropDownFontStyle.InterRegular18,
                    items: controller.timeAttendanceModel.value.dropdownItemListTime.value,
                    onChanged: (value) {
                      controller.onSelectedTime(value);
                    },
                  ),
                )
                // Text(
                //   'Chức vụ',
                //   style: AppStyle.txtInterRegular10,
                // ),
                // CustomDropDown(
                //   width: 30,
                //   variant: DropDownVariant.FillWhiteA700,
                //   focusNode: FocusNode(),
                //   icon: Icon(Icons.arrow_drop_down_sharp),
                //   hintText: "",
                //   padding: DropDownPadding.PaddingAll1,
                //   fontStyle: DropDownFontStyle.InterRegular18,
                //   items: controller.timeAttendanceModel.value.dropdownItemList.value,
                //   onChanged: (value) {
                //     controller.onSelected(value);
                //   },
                // )
              ]),
            )),
        Expanded(
            flex: 5,
            child: Container(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: getPadding(all: 5),
                  child: Text('Tổng số nhân viên: ', style: AppStyle.txtInterMedium12),
                ),
                Padding(
                  padding: getPadding(all: 5),
                  child: Text('Số lượng nhân viên vắng mặt: ', style: AppStyle.txtInterMedium12),
                ),
                Padding(
                  padding: getPadding(all: 5),
                  child: Text('Số lượng nhân viên nghỉ phép: ', style: AppStyle.txtInterMedium12),
                ),
                ElevatedButton(
                    onPressed: () {
                      getDateTime();
                    },
                    child: Text('ahihi'))
              ]),
            ))
      ]),
    );
  }
}
