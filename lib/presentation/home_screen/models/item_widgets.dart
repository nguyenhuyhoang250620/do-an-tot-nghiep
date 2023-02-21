import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:play_kit/play_kit.dart';

class ItemWidgets extends StatelessWidget {
  const ItemWidgets({Key? key, required this.title, required this.content, required this.widget}) : super(key: key);
  final String title;
  final String content;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            flex: 1,
            child: Container(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  '${title}',
                  style: AppStyle.txtInterMedium24,
                ),
                SizedBox(
                  height: 1,
                  child: Container(
                    color: Colors.black,
                  ),
                )
              ]),
            )),
        Expanded(
            flex: 7,
            child: Container(
              child: PlayContainer(
                width: Get.width,
                height: Get.height,
                borderRadius: BorderRadius.circular(16),
                child: widget,
              ),
            ))
      ]),
    );
  }
}
