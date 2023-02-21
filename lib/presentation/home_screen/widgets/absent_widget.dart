import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AbsentWidget extends StatelessWidget {
  const AbsentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Expanded(
            flex: 1,
            child: Center(
                child: Text(
              'Thông tin nhân viên có mặt trong ngày',
              style: AppStyle.txtInterMedium20,
            ))),
        Expanded(
          flex: 5,
          // child: Center(
          //   child: Text(
          //     'ListView hiển thị nhân viên có mặt trong ngày',
          //     style: AppStyle.txtInterMedium12,
          //   ),
          // )
          child: Container(
            margin: getMargin(left: 20),
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => Text(
                'Nhân Viên ${index}',
                style: AppStyle.txtInterMedium12,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
