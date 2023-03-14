import 'dart:math';

import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SettingsManagement extends StatefulWidget{
  SettingsManagement({required this.texts});
  final List<String> texts;
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<SettingsManagement> with TickerProviderStateMixin {
  Color getRandomColor() {
    Random random = Random();
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
    return Color.fromRGBO(r, g, b, 1.0); // giá trị alpha cố định là 1.0
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(child: Text("Ý tưởng phát triển",style: AppStyle.txtInterMedium32.copyWith(fontWeight: FontWeight.bold),)),
        ),
        Expanded(
          flex: 9,
          child: AnimationLimiter(
            child: ListView.builder(
              itemCount: widget.texts.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 1000),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Container(
                        height: 100,
                        width: Get.width,
                        margin: EdgeInsets.symmetric(vertical: appPadding,horizontal: appPadding*5),
                        padding: EdgeInsets.all(appPadding),
                        decoration: BoxDecoration(
                          border: Border.all(color: darkTextColor),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(widget.texts[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );}
}
