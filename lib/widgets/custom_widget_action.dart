import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/search_field.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:do_an_tot_nghiep/theme/app_style.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomWidgetAction extends StatefulWidget{
  CustomWidgetAction({
    this.title,
    this.onPressedLeft,
    this.onPressedRight,
    this.textSearch,
    this.titleButtonLeft,
    this.titleButtonRight
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
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.only(top: appPadding),
        padding: EdgeInsets.all(appPadding),
        decoration: BoxDecoration(
          color: colorItem,
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child:FittedBox(fit: BoxFit.scaleDown,child: Text(widget.title!,style: AppStyle.txtInterMedium24.copyWith(color: Colors.black,fontWeight: FontWeight.bold))),
            ),
            Expanded(
              flex: 7,
              child: Row(
                children: [
                      if (!Responsive.isMobile(context))
                        Expanded(
                          flex: 4,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomButtonCommon(
                                  icon: Icon(Icons.person_add),
                                  title: widget.titleButtonLeft,
                                  onPressed: widget.onPressedLeft,
                                  color: Colors.blueAccent,
                                  size: 12,
                                ),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: CustomButtonCommon(
                                  icon: Icon(Icons.upload_outlined),
                                  title: widget.titleButtonRight,
                                  onPressed: widget.onPressedRight,
                                  color: Colors.blueAccent,
                                  size: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (Responsive.isMobile(context))
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomButtonCommon(
                                icon: Icon(Icons.people_alt),
                                title: widget.titleButtonLeft,
                                onPressed: widget.onPressedLeft,
                                color: Colors.blueAccent,
                                size: 12,
                              ),
                            ),
                            SizedBox(height: 2,),
                            Expanded(
                              child: CustomButtonCommon(
                                icon: Icon(Icons.upload_outlined),
                                title: widget.titleButtonRight,
                                onPressed: widget.onPressedRight,
                                color: Colors.blueAccent,
                                size: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: SearchField(
                          texthint: widget.textSearch,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
        );
  }

}