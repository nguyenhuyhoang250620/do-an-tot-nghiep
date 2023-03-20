import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_controller/client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button.dart';
import 'package:flutter/material.dart';
class CustomList extends StatelessWidget{

  CustomList({
    this.title,
    this.clientController
  });
  final String? title;
  final ClientController? clientController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(appPadding),
            padding: EdgeInsets.all(appPadding),
            height: 200,
            width: Get.width,
            decoration: BoxDecoration(
              border: Border.all(color: darkTextColor),
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Image.network('https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063__340.jpg')
              ),
              Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Gà rang muối",style: AppStyle.txtInterRegular16.copyWith(fontWeight: FontWeight.bold),),
                      SizedBox(height: appPadding,),
                      Text("Thành phần:",style: AppStyle.txtInterRegular14,),
                      Expanded(
                        flex: 8,
                        child: Container(
                          padding: EdgeInsets.all(appPadding*2),
                          child: ListView(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Calories/Năng lượng: ',
                                      style: AppStyle.txtInterRegular14
                                    ),
                                    TextSpan(
                                      text: '464 Kcal',
                                      style: AppStyle.txtInterRegular12.copyWith(color: darkTextColor)
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: appPadding,),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Khối lượng : ',
                                      style: AppStyle.txtInterRegular14
                                    ),
                                    TextSpan(
                                      text: '240g',
                                      style: AppStyle.txtInterRegular12.copyWith(color: darkTextColor)
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: appPadding,),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Chi tiết : ',
                                      style: AppStyle.txtInterRegular14
                                    ),
                                    TextSpan(
                                      text: 'Gà, mắm, muối, mì chính,..',
                                      style: AppStyle.txtInterRegular12.copyWith(color: darkTextColor)
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 1,child: Container(),),
                    CustomButtonCommon(
                      color: orange,
                      icon: Icon(Icons.card_travel),
                      title: 'Đặt món',
                      size: 15,
                      onPressed: () {
                        
                      },
                    ),
                    SizedBox(
                      height: appPadding,
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text('Số lượng'),
                          SizedBox(width: 1,),
                          TextButton(
                            onPressed: () {
                              if(index.isEven){
                                if(clientController!.so_luong.value == 0){
                                  clientController!.so_luong.value =0;
                                  }
                                  else{
                                    clientController!.so_luong.value--;
                                  } 
                              }    
                            },
                            child: Text('-')),
                          SizedBox(width: 1,),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Obx(() => Text('${clientController!.so_luong.value}')),
                          ),
                          SizedBox(width: 1,),
                          TextButton(
                            onPressed: () {
                               clientController!.so_luong.value++;
                            },
                            child: Text('+')),
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          );
        },
      )
    );
  }

}