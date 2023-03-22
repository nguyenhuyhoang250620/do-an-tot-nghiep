import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/search_field.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/theme/app_style.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../presentation/dashboard_screen/components/analytic_info_card.dart';

class CustomWidgetAction extends StatefulWidget{
  CustomWidgetAction({
    this.title,
    this.onPressedLeft,
    this.onPressedRight,
    this.textSearch,
    this.titleButtonLeft,
    this.titleButtonRight,

    });
  final String? title;
  final String? titleButtonLeft;
  final String? titleButtonRight;
  final String? textSearch;
  final VoidCallback? onPressedLeft;
  final VoidCallback? onPressedRight;

  @override
  State<StatefulWidget> createState() => CustomWidgetActionState();

}
class CustomWidgetActionState extends State<CustomWidgetAction>{
  final controller = Get.find<DashBoardController>();
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: appPadding*2),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0)
        ),
        child:Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.all(appPadding),
                child: Obx(() => AnalyticInfoCard(
                  content: controller.sum_student.value,
                  icon:Icon(Icons.people,size: 80,color: white,),
                  title: 'Tổng số sinh viên',
                  colors: cardA,
                ),)
              ),
            ),
             Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.all(appPadding),
                child: Obx(() => AnalyticInfoCard(
                  content: controller.sum_teacher.value,
                  icon:Icon(Icons.person,size: 80,color: white,),
                  title: 'Tổng số giảng viên',
                  colors: cardB,
                ),)
              ),
            ),
             Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.all(appPadding),
                child: Obx(() => AnalyticInfoCard(
                  content: controller.sum_department.value,
                  icon:Icon(Icons.class_,size: 80,color: white,),
                  title: 'Tổng số phòng ban',
                  colors: cardC,
                ),)
              ),
            ),
             Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.all(appPadding),
                child: Obx(() => AnalyticInfoCard(
                  content: controller.sum_class.value,
                  icon:Icon(Icons.door_back_door,size: 80,color: white,),
                  title: 'Tổng số lớp học',
                  colors: cardD,
                )),
              ),
            )
          ],
        ) 
        // AnalyticCards()
        );
  }

}