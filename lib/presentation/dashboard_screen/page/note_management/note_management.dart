import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/note/env_client_note.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button.dart';
import 'package:do_an_tot_nghiep/widgets/custom_loading.dart';
import 'package:do_an_tot_nghiep/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../widgets/custom_widget_action.dart';
import '../../components/custom_appbar.dart';
import '../../constants/constants.dart';
import '../../controller/dashboard_controller.dart';
import 'note_management_controller/note_management_controller.dart';

class NoteManagementScreen extends StatefulWidget {
  NoteManagementScreen({this.dashboardController});
  DashBoardController? dashboardController;
  @override
  State<StatefulWidget> createState() {
    return NoteManagementState();
  }
}

class NoteManagementState extends State<NoteManagementScreen> {
  final controller = Get.find<NoteManagementController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        return Container(
          height: p1.maxHeight,
          width: p1.maxWidth,
          padding: EdgeInsets.all(appPadding * 2),
          child: Column(
            children: [
              CustomAppbar(),
              Divider(),
              Expanded(
                  flex: 2,
                  child: CustomWidgetAction()),
              Expanded(
                flex: 8,
                child: Obx(() =>widget.dashboardController!.isLoadingNote.value
                    ? ListView.builder(
                      itemCount: widget.dashboardController!.listNoteRequestAdmin.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: Get.width,
                          margin: EdgeInsets.symmetric(horizontal: appPadding,vertical: appPadding*2),
                          padding: EdgeInsets.all(appPadding),
                          decoration: BoxDecoration(
                            border: Border.all(color: darkTextColor),
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Container(
                                  width: Get.width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomRichText(
                                        textLeft: 'Người gửi : ',
                                        textRight: '${widget.dashboardController!.listNoteRequestAdmin[index].teacherCode}',
                                      ),
                                      CustomRichText(
                                        textLeft: 'Loại phiếu : ',
                                        textRight: '${widget.dashboardController!.listNoteRequestAdmin[index].type}',
                                      ),
                                      CustomRichText(
                                        textLeft: 'Ngày nghỉ : ',
                                        textRight: '${widget.dashboardController!.listNoteRequestAdmin[index].time}',
                                      ),
                                      CustomRichText(
                                        textLeft: 'Nội dung : ',
                                        textRight: '${widget.dashboardController!.listNoteRequestAdmin[index].description}',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Obx(() => widget.dashboardController!.listNoteRequestAdmin[index].status == cho_duyet.value?TextButton(
                                onPressed: () {
                                  controller.noteReview(
                                    da_duyet.value,
                                    '${widget.dashboardController!.listNoteRequestAdmin[index].type}',
                                    '${widget.dashboardController!.listNoteRequestAdmin[index].time}',
                                    '${widget.dashboardController!.listNoteRequestAdmin[index].teacherCode}',
                                    '${widget.dashboardController!.listNoteRequestAdmin[index].description}',
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 100,
                                  padding: EdgeInsets.all(appPadding),
                                  decoration: BoxDecoration(
                                    color: cardA,
                                    borderRadius: BorderRadius.circular(8.0)
                                  ),
                                  child: Text("Duyệt",style: AppStyle.txtInterRegular16.copyWith(color: bgColor,fontWeight: FontWeight.bold)))
                                ):Container(),),
                              
                              SizedBox(width: 10,),
                              Obx(() => widget.dashboardController!.listNoteRequestAdmin[index].status == cho_duyet.value?TextButton(
                                onPressed: () {
                                  controller.noteReview(
                                    tu_choi.value,
                                    '${widget.dashboardController!.listNoteRequestAdmin[index].type}',
                                    '${widget.dashboardController!.listNoteRequestAdmin[index].time}',
                                    '${widget.dashboardController!.listNoteRequestAdmin[index].teacherCode}',
                                    '${widget.dashboardController!.listNoteRequestAdmin[index].description}',
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 100,
                                  padding: EdgeInsets.all(appPadding),
                                  decoration: BoxDecoration(
                                    color: cardC,
                                    borderRadius: BorderRadius.circular(8.0)
                                  ),
                                  child: Text("Từ chối",style: AppStyle.txtInterRegular16.copyWith(color: bgColor,fontWeight: FontWeight.bold)))
                                ):Container(),),
                            ],
                          ),
                        );
                      },
                    )
                      :Center(
                      child: CustomLoading(),
                    ),),
              )
            ],
          ),
        );
      },
    );
  }
}


