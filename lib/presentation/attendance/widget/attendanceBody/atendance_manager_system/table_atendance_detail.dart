import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TableDetail extends StatelessWidget {
  final HDTRefreshController _hdtRefreshController = HDTRefreshController();


  @override
  Widget build(BuildContext context) {
    return 
      FittedBox(
        child: SizedBox(
            height: 95.h,
            width: 70.w,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false,
              ),
              child: HorizontalDataTable(
                leftHandSideColumnWidth: 3.w,
                rightHandSideColumnWidth: 70.w,
                isFixedHeader: true,
                headerWidgets: _getTitleWidget(),
                leftSideItemBuilder:_generateFirstColumnRow ,
                rightSideItemBuilder: _generateRightHandSideColumnRow,
                // itemCount: data.length,
                rowSeparatorWidget: const Divider(
                  color: Colors.black54,
                  height: 1.0,
                  thickness: 0.0,
                ),
                leftHandSideColBackgroundColor:Colors.transparent,
                rightHandSideColBackgroundColor:Colors.transparent,
                enablePullToRefresh: false,
                refreshIndicator: const ClassicHeader(),
                fixedSidePlaceHolderRefreshIndicator: const PlaceholderHeader(),
                refreshIndicatorHeight: 60,
                onRefresh: () async {
                  debugPrint('onRefresh');
                  //Do sth
                  await Future.delayed(const Duration(milliseconds: 500));
                  _hdtRefreshController.refreshCompleted();
                },
                enablePullToLoadNewData: false,
                loadIndicator: const ClassicFooter(),
                fixedSidePlaceHolderLoadIndicator: const PlaceholderFooter(),
                onLoad: () async {
                  debugPrint('onLoad');
                  //Do sth
                  await Future.delayed(const Duration(milliseconds: 500));
                  _hdtRefreshController.loadComplete();
                },
                htdRefreshController: _hdtRefreshController,
              ),
            ),
          ),
      );
    }
   List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Stt', 3.w),
      _getTitleItemWidget('Danh sách hình ảnh', 18.w),
      _getTitleItemWidget('Thời gian xuất hiện', 18.w),
      _getTitleItemWidget('Cam xuất hiện', 18.w),
    ];
  }
  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 5.h,
      alignment: Alignment.center,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 3.w,
      height: 10.h,
      alignment: Alignment.center,
      child: Text("${index+1}"),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 18.w,
          height: 10.h,
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              Get.dialog(
                Dialog(
                  child: SizedBox(
                    width: 70.w,
                    child:Container()
                    //  Image.asset(data[index].image!)
                    // CommonImageView(
                    //   url: data[index].image,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              );
            },
            child: Container(),
            // child: CommonImageView(
            //     width: 8.w,
            //     height: 8.h,
            //     imagePath: data[index].image,
            // ),
          )
        ),
        Container(
          width: 18.w,
          height: 10.h,
          alignment: Alignment.center,
          child: Text(""),
        ),
        Container(
          width: 18.w,
          height: 10.h,
          alignment: Alignment.center,
          child: Text(""),
        ),
      ],
    );
  }
}


