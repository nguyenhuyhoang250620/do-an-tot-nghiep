import 'package:do_an_tot_nghiep/core/utils/image_constant.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/controller/home_controller.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/models/item_widgets.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/widgets/absent_widget.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/widgets/onduty_widget.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/widgets/paidleave_widget.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/widgets/time_attendance_widget.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/widgets/unpaidleave_widget.dart';
import 'package:do_an_tot_nghiep/widgets/common_image_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:play_kit/play_kit.dart';

import '../widgets/present_widget.dart';

class AdminScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>adminState();
}
class adminState extends State<AdminScreen>{
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
        builder: (p0, p1) {
          return Stack(
            alignment: Alignment.center,
            children: [
              CommonImageView(
                width: p1.maxWidth,
                height: p1.maxHeight,
                fit: BoxFit.cover,
                imagePath: ImageConstant.background,
              ),
              PlayContainer(
                height: p1.maxHeight,
                width: p1.maxWidth,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 1.4,
                  children: [
                    ItemWidgets(
                      title: 'Chấm công cá nhân',
                      content: 'Nội dung',
                      widget: TimeAttendance(
                        controller: controller,
                      ),
                    ),
                    ItemWidgets(
                      title: 'Vắng mặt',
                      content: 'Nội dung',
                      widget: AbsentWidget(),
                    ),
                    ItemWidgets(
                      title: 'Đang đi công tác',
                      content: 'Nội dung',
                      widget: OndutyWidget(),
                    ),
                    ItemWidgets(
                      title: 'Có mặt',
                      content: 'Nội dung',
                      widget: PresentWidget(),
                    ),
                    ItemWidgets(
                      title: 'Nghỉ phép',
                      content: 'Nội dung',
                      widget: PaidLeaveWidget(),
                    ),
                    ItemWidgets(
                      title: 'Nghỉ phép không lương',
                      content: 'Nội dung',
                      widget: UnPaidLeaveWidget(),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      );
  }

}