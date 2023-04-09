import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/profile_info.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/search_field.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/changeNotifier/changeNotifier.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';


class CustomAppbar extends StatelessWidget {
  CustomAppbar({Key? key}) : super(key: key);
  final controller = Get.find<DashBoardController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     cardD!,
          //     cardD!.withOpacity(0.8),
          //   ],
          // )
        ),
        child: Row(
          children: [
            if (!Responsive.isDesktop(context))
              IconButton(
                onPressed:() {
                  controller.controlMenu();
                },
                icon: Icon(Icons.menu,color: textColor.withOpacity(0.5),),
              ),
            Expanded(
    
            child: Center(
              child: Text("PHẦN MỀM QUẢN LÝ NHÂN SỰ VÀ CẤU HÌNH ĐIỂM DANH HỌC VIỆN QUẢN LÝ GIÁO DỤC",
              style: TextStyle(
                fontSize: 18,
                color: darkTextColor,
                fontWeight: FontWeight.bold,
              ),
              ),
            )),
            Container(
              padding: EdgeInsets.all(appPadding),
              decoration: BoxDecoration(
                // border: Border.all(color: darkTextColor.withOpacity(0.5)),
                // borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today,color: darkTextColor,),
                  SizedBox(width: 10,),
                  Text('${DateFormat('EEEE', 'vi_VN').format(DateTime.now())}, ${DateTime.now().toString().substring(0,10)},',style: AppStyle.txtInterRegular18.copyWith(color: darkTextColor),),
                  DigitalClock(
                    colon: Text(":",style: AppStyle.txtInterMedium12.copyWith(color: darkTextColor),),
                    colonDecoration:  BoxDecoration(color: transparent),
                    minuteDigitDecoration:BoxDecoration(color: transparent),
                    areaDecoration: const BoxDecoration(color: transparent),
                    areaAligment: AlignmentDirectional.center,
                    hourMinuteDigitTextStyle: AppStyle.txtInterMedium12.copyWith(
                      color: darkTextColor,
                      fontSize: 18
                    ),
                    secondDigitTextStyle: AppStyle.txtInterMedium12.copyWith(
                        color: darkTextColor,
                        fontSize: 12
                    ),
                    hourDigitDecoration: BoxDecoration(color: transparent),
                    amPmDigitTextStyle: TextStyle(color: darkTextColor),
                    showSecondsDigit: true,
                    is24HourTimeFormat: true,
                    digitAnimationStyle: Curves.fastOutSlowIn,
                  ),
                ],
              )
            ),
            ProfileInfo()
          ],
        ),
      ),
    );
  }
}
