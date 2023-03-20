import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../widgets/custom_button_alert.dart';
import '../../../../widgets/custom_widget_action.dart';
import '../../../../widgets/custom_widget_row.dart';
import '../../components/custom_appbar.dart';
import '../../constants/constants.dart';
import '../../controller/dashboard_controller.dart';
import 'food_management_controller/food_management_controller.dart';

class FoodManagement extends StatefulWidget{
  FoodManagement({this.dashboardController});
  DashBoardController? dashboardController;
  @override
  State<StatefulWidget> createState() =>FoodManagementState();

}
class FoodManagementState extends State<FoodManagement>{
  final List<Tab> myTabs = [
  Tab(text: 'Món ăn'),
  Tab(text: 'Nước uống'),
  Tab(text: 'Tráng miệng'),
];

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
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(vertical:appPadding*2,horizontal: appPadding*3),
                    child:DefaultTabController(
                        length: myTabs.length,
                        child: Scaffold(
                          appBar: AppBar(
                            backgroundColor: bgColor,
                            elevation: 3.0,
                            toolbarHeight: 0,
                            bottom: TabBar(
                              labelStyle: AppStyle.txtInterMedium12.copyWith(fontSize: 16),
                              tabs: myTabs,
                              labelColor: darkTextColor,
                            ),
                          ),
                          body: TabBarView(
                            children: [
                              // nội dung của tab 1
                              Container(
                                height: Get.height,
                                width: Get.width,
                                child: Dish(),
                              ),
                              // nội dung của tab 2
                              Container(
                                child: Text('This is tab 2'),
                              ),
                              // nội dung của tab 3
                              Container(
                                child: Text('This is tab 3'),
                              ),
                            ],
                          ),
                        floatingActionButton: FloatingActionButton(
                          onPressed: () => Get.dialog((addItem())),
                          child: Icon(Icons.add),
                          tooltip: 'Thêm cấu hình mới',
                        ),
                        ),
                      ),
                  ),
                )
              ]
            )
          );
      }
    );
  }

}
Widget addItem(){
  return AlertDialog(
    title: Center(child: Text("Thêm món mới")),
    content: Container(
      height: Get.height*0.7,
      width: Get.width*0.5,
    ),
    actions: [
        CustomButtonAlert(
          titileDisable: 'Huỷ',
          titileEnable: 'Lưu',
          onPressedDisable: () => Get.back(),
          onPressedEnable: () =>Get.back(),
        )
    ],
  );
}
Widget Dish() {
  return  GridView.builder(
      itemCount: 2,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: 450,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1
          ),
          itemBuilder: (context, index) {
              // final item = items[index];
              return Container(
                margin: EdgeInsets.all(appPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: bgColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            height: Get.height,
                            width: Get.width,
                            child: Image.network('https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063__340.jpg',fit: BoxFit.cover,),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.0),
                              Text('Rau muống sào',style: AppStyle.txtInterMedium24,),
                              SizedBox(height: 10.0),
                              CustomWidgetRow(
                                left: Text('Calories/Năng lượng: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                right: Text('415 Kcal'),
                                paddingLeft: appPadding*4,
                              ),
                              SizedBox(height: 10.0),
                              CustomWidgetRow(
                                left: Text('Khối lượng : ',style: TextStyle(fontWeight: FontWeight.bold)),
                                right: Text('420g'),
                                paddingLeft: appPadding*4,
                              ),
                              SizedBox(height: 10.0),
                              CustomWidgetRow(
                                left: Text('Chi tiết : '),
                                right: Text('Gà, mắm, muối, mì chính,..',style: TextStyle(fontWeight: FontWeight.bold)),
                                paddingLeft: appPadding*4,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: (){
                                  // controller.getConfigList.map((element){
                                  //   if(element.maGV == controller.getConfigList.value[index].maGV){
                                        
                                  //   }
                                  // }).toList();
                                  // Get.dialog(viewBuild(controller.getConfigList,index)); 
                                },
                                icon: Icon(Icons.account_box,color: cardA,size: 35,),
                                tooltip: 'Chi tiết',
                              ),
                              IconButton(
                                onPressed: () =>Get.back(),
                                icon: Icon(Icons.delete,color: cardC,size: 35),
                                tooltip: 'Xoá',
                              ),
                              IconButton(
                                onPressed: () {
                            
                                },
                                icon: Icon(Icons.check_box,color: orange,size: 35),
                                tooltip: 'Cấp quyền',
                              ),
                            ],
                          )
                        ),
                    ],),
            );
      },
    );
}