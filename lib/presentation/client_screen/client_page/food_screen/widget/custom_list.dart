import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_controller/client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/food_model.dart';
class CustomList extends StatelessWidget{

  CustomList({
    this.clientController,
    required this.data
  });
  final ClientController? clientController;
  List<FoodModel> data =[];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: bgColor,
      child: ListView.builder(
        itemCount: data.length,
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
                child: data[index].url==null?
                  Container(
                    height: Get.height,
                    width: Get.width,
                    child: Image.asset('assets/images/image_not_found.png'),
                  ):
                  Container(
                    height: Get.height,
                    width: Get.width,
                    child:Image.network('${data[index].url}',height: 150,fit: BoxFit.cover,))
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.all(appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${data[index].tenMonAn}",style: AppStyle.txtInterRegular16.copyWith(fontWeight: FontWeight.bold),),
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
                                      text: '${data[index].calo}',
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
                                      text: '${data[index].khoiLuong}',
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
                                      text: '${data[index].chiTiet}',
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
                              if(data[index].so_luong!.value == 0){
                                  data[index].so_luong!.value =0;
                                  }
                                  else{
                                    data[index].so_luong!.value--;
                                  }    
                            },
                            child: Text('-')),
                          SizedBox(width: 1,),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Obx(() => Text('${data[index].so_luong}')),
                          ),
                          SizedBox(width: 1,),
                          TextButton(
                            onPressed: () {
                               data[index].so_luong!.value++;
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