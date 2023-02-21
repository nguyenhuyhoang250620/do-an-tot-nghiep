import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PresentWidget extends StatelessWidget {
  const PresentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Expanded(
            flex: 1,
            child: Center(
                child: Text(
              'Thông tin nhân viên có mặt',
              style: AppStyle.txtInterMedium20,
            ))),
        Expanded(
          flex: 5,
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
