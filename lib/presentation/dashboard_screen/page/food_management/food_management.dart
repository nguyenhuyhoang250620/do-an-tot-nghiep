import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../widgets/custom_alert.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_button_alert.dart';
import '../../../../widgets/custom_dropdow_button.dart';
import '../../../../widgets/custom_loading.dart';
import '../../../../widgets/custom_textfiled.dart';
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
final controller = Get.find<FoodManagementController>();
  @override
  Widget build(BuildContext context) {
    return Container(
          height: Get.height,
          width: Get.width,
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
                                child: Dish(controller),
                              ),
                              // nội dung của tab 2
                              Container(
                                height: Get.height,
                                width: Get.width,
                                child: Drink(controller),
                              ),
                              // nội dung của tab 3
                              Container(
                                height: Get.height,
                                width: Get.width,
                                child: Dessert(controller),
                              ),
                            ],
                          ),
                        floatingActionButton: FloatingActionButton(
                          
                          onPressed: () {
                          controller.ma_mon.text ="";
                          controller.ten_mon_an.text ="";
                          controller.calo.text ="";
                          controller.khoi_luong.text ="";
                          controller.chi_tiet.text="";
                          controller.hinh_anh.value ='';
                          controller.type.value='';
                          controller.pathImageAfterPickfileFromComputer.value="";
                            Get.dialog((addItem(controller)));},
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

}
Widget addItem(
  FoodManagementController controller
){
  final _formKey = GlobalKey<FormState>();
  return Form(
    key: _formKey,
    child: CustomAlertAvt(
      title: Center(
          child: Text(
        "Thêm món mới",
        style: AppStyle.txtRobotoRegular20,
      )),
      listTextFiled: ListView(
        children: [
          SizedBox(height: 40,),
          CustomTextForm(
            suffixIcon: Icon(Icons.food_bank),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập tên món ăn';
              }
            },
            controller: controller.ten_mon_an,
            label: 'Tên món ăn',
            obscureText: false,
            onChanged: (p0) {},
          ),
          SizedBox(height: 10,),
          CustomTextForm(
            suffixIcon: Icon(Icons.qr_code),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập mã món';
              }
            },
            controller: controller.ma_mon,
            label: 'Mã món',
            obscureText: false,
            onChanged: (p0) {},
          ),
          SizedBox(height: 10,),
          CustomTextForm(
            suffixIcon: Icon(Icons.scale),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập khối lượng';
              }
            },
            controller: controller.khoi_luong,
            label: 'Khối lượng',
            obscureText: false,
            onChanged: (p0) {},
          ),
          SizedBox(height: 10,),
          CustomTextForm(
            suffixIcon: Icon(Icons.bar_chart),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập calo';
              }
            },
            controller: controller.calo,
            label: 'Caloris',
            obscureText: false,
            onChanged: (p0) {},
          ),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: darkTextColor.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(4.0)
            ),
            child: CustomDropDownButton(   
              icon: Icon(Icons.person),             
              hintText: 'Lựa chọn kiểu món',
              items:controller.type_food.map((e) => _childDropDownItem(e['type'])).toList(),
              onChangedlistSelect: (p0) {
                controller.type.value = p0 as String;
              },
            ),
          ),
          SizedBox(height: 10,),
          CustomTextForm(
            suffixIcon: Icon(Icons.book_outlined),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập chi tiết';
              }
            },
            controller: controller.chi_tiet,
            label: 'Chi tiết thực phẩm',
            obscureText: false,
            onChanged: (p0) {},
          ),
        ],
      ),
      onPressedDisable: () {
        Get.back();
      },
      onPressedEisable: () {
        if (_formKey.currentState!.validate()) {
          controller.createFood(
            controller.ma_mon.text, 
            controller.ten_mon_an.text, 
            controller.calo.text, 
            controller.khoi_luong.text, 
            controller.chi_tiet.text, 
            controller.hinh_anh.value, 
            controller.type.value,
            );
          Get.back();
        }
      },
    ),
  );
}


Widget update(
    String ma_mon,
    String ten_mon_an,
    String calo,
    String khoi_luong,
    String chi_tiet,
    String type,
    FoodManagementController controller
){
  final _formKey = GlobalKey<FormState>();
  controller.ma_mon.text =ma_mon;
  controller.ten_mon_an.text =ten_mon_an;
  controller.calo.text = calo;
  controller.khoi_luong.text = khoi_luong;
  controller.chi_tiet.text = chi_tiet;
  controller.type.value = type;
  return Form(
    key: _formKey,
    child: CustomAlertAvt(
      title: Center(
          child: Text(
        "Thêm món mới",
        style: AppStyle.txtRobotoRegular20,
      )),
      listTextFiled: ListView(
        children: [
          SizedBox(height: 40,),
          CustomTextForm(
            suffixIcon: Icon(Icons.qr_code),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập mã món';
              }
            },
            controller: controller.ma_mon,
            label: 'Mã món',
            enabled: false,
            obscureText: false,
            onChanged: (p0) {},
          ),
          SizedBox(height: 10,),
          CustomTextForm(
            suffixIcon: Icon(Icons.food_bank),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập tên món ăn';
              }
            },
            controller: controller.ten_mon_an,
            label: 'Tên món ăn',
            obscureText: false,
            onChanged: (p0) {},
          ),
          SizedBox(height: 10,),
          CustomTextForm(
            suffixIcon: Icon(Icons.scale),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập khối lượng';
              }
            },
            controller: controller.khoi_luong,
            label: 'Khối lượng',
            obscureText: false,
            onChanged: (p0) {},
          ),
          SizedBox(height: 10,),
          CustomTextForm(
            suffixIcon: Icon(Icons.bar_chart),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập calo';
              }
            },
            controller: controller.calo,
            label: 'Caloris',
            obscureText: false,
            onChanged: (p0) {},
          ),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: darkTextColor.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(4.0)
            ),
            child: CustomDropDownButton(   
              icon: Icon(Icons.person),        
              hintText: 'Lựa chọn kiểu món',
              items:controller.type_food.map((e) => _childDropDownItem(e['type'])).toList(),
              onChangedlistSelect: (p0) {
                controller.type.value = p0 as String;
              },
            ),
          ),
          SizedBox(height: 10,),
          CustomTextForm(
            suffixIcon: Icon(Icons.book_outlined),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập chi tiết';
              }
            },
            controller: controller.chi_tiet,
            label: 'Chi tiết thực phẩm',
            obscureText: false,
            onChanged: (p0) {},
          ),
        ],
      ),
      onPressedDisable: () {
        Get.back();
      },
      onPressedEisable: () {
        if (_formKey.currentState!.validate()) {
          controller.updateFood(
            controller.ma_mon.text, 
            controller.ten_mon_an.text, 
            controller.calo.text, 
            controller.khoi_luong.text, 
            controller.chi_tiet.text, 
            controller.type.value,
            );
          Get.back();
        }
      },
    ),
  );
}
Widget Dish(
  FoodManagementController controller
) {
  final dashboardController = Get.find<DashBoardController>();
  return  Obx(() => Container(
    height: Get.height,
    width: Get.width,
    child: GridView.builder(
        itemCount: dashboardController.getDishList.length,
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
                            child:Container(
                              height: Get.height,
                              width: Get.width,
                              child: InkWell(
                                onTap: () {
                                  controller.updateImage('${dashboardController.getDishList.value[index].maMon}');
                                },
                                child: Obx(() => dashboardController.getDishList.value[index].url==null?
                                Container(
                                  height: Get.height,
                                  width: Get.width,
                                  child: Image.asset('assets/images/image_not_found.png'),
                                ):
                                Container(
                                  height: Get.height,
                                  width: Get.width,
                                  child:Image.network('${dashboardController.getDishList.value[index].url}',height: 150,fit: BoxFit.cover,))
                                ),
                              ),
                            )
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10.0),
                                Text('${dashboardController.getDishList.value[index].tenMonAn}',style: AppStyle.txtInterMedium24,),
                                SizedBox(height: 10.0),
                                CustomWidgetRow(
                                  left: Text('Calories/Năng lượng: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                  right: Text('${dashboardController.getDishList.value[index].calo}'),
                                  paddingLeft: appPadding*4,
                                ),
                                SizedBox(height: 10.0),
                                CustomWidgetRow(
                                  left: Text('Khối lượng : ',style: TextStyle(fontWeight: FontWeight.bold)),
                                  right: Text('${dashboardController.getDishList.value[index].khoiLuong}'),
                                  paddingLeft: appPadding*4,
                                ),
                                SizedBox(height: 10.0),
                                CustomWidgetRow(
                                  left: Text('Chi tiết : ',style: TextStyle(fontWeight: FontWeight.bold)),
                                  right: Text('${dashboardController.getDishList.value[index].chiTiet}'),
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
                                  icon: Icon(Icons.add_box_outlined,color: cardA,size: 35,),
                                  tooltip: 'Thêm vào menu',
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.dialog(update(
                                      dashboardController.getDishList.value[index].maMon,
                                      dashboardController.getDishList.value[index].tenMonAn,
                                      dashboardController.getDishList.value[index].calo,
                                      dashboardController.getDishList.value[index].khoiLuong,
                                      dashboardController.getDishList.value[index].chiTiet,
                                      dashboardController.getDishList.value[index].type,
                                      controller
                                    ));
                                  },
                                  icon: Icon(Icons.border_color_outlined,color: orange,size: 35),
                                  tooltip: 'Chỉnh sửa',
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.dialog(
                                      AlertDialog(
                                        content: Container(
                                          height: 100,
                                          width: 100,
                                          alignment: Alignment.center,
                                          child: Text('Bạn có chắc muốn xoá không?')
                                          ),
                                        actions: [
                                          CustomButtonAlert(
                                            titileDisable: 'Huỷ',
                                            titileEnable: 'Đồng ý',
                                            onPressedDisable: () => Get.back(),
                                            onPressedEnable: () {
                                              Get.back();
                                              Get.dialog(Dialog(
                                                child: CustomLoading(),
                                              ));
                                              controller.deleteFood(dashboardController.getDishList.value[index].maMon);
                                              Future.delayed(Duration(seconds: 2),() {
                                                Get.back();
                                              },);
                                            },
                                          )
                                        ],
                                      )
                                    );},
                                  icon: Icon(Icons.delete,color: cardC,size: 35),
                                  tooltip: 'Xoá',
                                ),
                                
                              ],
                            )
                          ),
                      ],),
              );
        },
      ),
  ),);

}




Widget Drink(
  FoodManagementController controller
) {
  final dashboardController = Get.find<DashBoardController>();
  return  Obx(() => Container(
    height: Get.height,
    width: Get.width,
    child: GridView.builder(
        itemCount: dashboardController.getDrinksList.length,
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
                            child:Container(
                              height: Get.height,
                              width: Get.width,
                              child: InkWell(
                                onTap: () {
                                  controller.updateImage('${dashboardController.getDrinksList.value[index].maMon}');
                                },
                                child: Obx(() => dashboardController.getDrinksList.value[index].url==null?
                                Container(
                                  height: Get.height,
                                  width: Get.width,
                                  child: Image.asset('assets/images/image_not_found.png'),
                                ):
                                Container(
                                  height: Get.height,
                                  width: Get.width,
                                  child:Image.network('${dashboardController.getDrinksList.value[index].url}',height: 150,fit: BoxFit.cover,))
                                ),
                              ),
                            )
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10.0),
                                Text('${dashboardController.getDrinksList.value[index].tenMonAn}',style: AppStyle.txtInterMedium24,),
                                SizedBox(height: 10.0),
                                CustomWidgetRow(
                                  left: Text('Calories/Năng lượng: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                  right: Text('${dashboardController.getDrinksList.value[index].calo}'),
                                  paddingLeft: appPadding*4,
                                ),
                                SizedBox(height: 10.0),
                                CustomWidgetRow(
                                  left: Text('Khối lượng : ',style: TextStyle(fontWeight: FontWeight.bold)),
                                  right: Text('${dashboardController.getDrinksList.value[index].khoiLuong}'),
                                  paddingLeft: appPadding*4,
                                ),
                                SizedBox(height: 10.0),
                                CustomWidgetRow(
                                  left: Text('Chi tiết : ',style: TextStyle(fontWeight: FontWeight.bold)),
                                  right: Text('${dashboardController.getDrinksList.value[index].chiTiet}'),
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
                                  icon: Icon(Icons.add_box_outlined,color: cardA,size: 35,),
                                  tooltip: 'Thêm vào menu',
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.dialog(update(
                                      dashboardController.getDrinksList.value[index].maMon,
                                      dashboardController.getDrinksList.value[index].tenMonAn,
                                      dashboardController.getDrinksList.value[index].calo,
                                      dashboardController.getDrinksList.value[index].khoiLuong,
                                      dashboardController.getDrinksList.value[index].chiTiet,
                                      dashboardController.getDrinksList.value[index].type,
                                      controller
                                    ));
                              
                                  },
                                  icon: Icon(Icons.border_color_outlined,color: orange,size: 35),
                                  tooltip: 'Chỉnh sửa',
                                ),
                                IconButton(
                                  onPressed: (){
                                    Get.dialog(
                                      AlertDialog(
                                        content: Container(
                                          height: 100,
                                          width: 100,
                                          alignment: Alignment.center,
                                          child: Text('Bạn có chắc muốn xoá không?')
                                          ),
                                        actions: [
                                          CustomButtonAlert(
                                            titileDisable: 'Huỷ',
                                            titileEnable: 'Đồng ý',
                                            onPressedDisable: () => Get.back(),
                                            onPressedEnable: () {
                                              Get.back();
                                              Get.dialog(Dialog(
                                                child: CustomLoading(),
                                              ));
                                              controller.deleteFood(dashboardController.getDrinksList.value[index].maMon);
                                              Future.delayed(Duration(seconds: 2),() {
                                                Get.back();
                                              },);
                                            },
                                          )
                                        ],
                                      )
                                    );
                                  },
                                  icon: Icon(Icons.delete,color: cardC,size: 35),
                                  tooltip: 'Xoá',
                                ),
                                
                              ],
                            )
                          ),
                      ],),
              );
        },
      ),
  ),);

}



Widget Dessert(
  FoodManagementController controller
) {
  final dashboardController = Get.find<DashBoardController>();
  return  Obx(() => Container(
    height: Get.height,
    width: Get.width,
    child: GridView.builder(
        itemCount: dashboardController.getDessertList.length,
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
                            child:Container(
                              height: Get.height,
                              width: Get.width,
                              child: InkWell(
                                onTap: () {
                                  controller.updateImage('${dashboardController.getDessertList.value[index].maMon}');
                                },
                                child: Obx(() => dashboardController.getDessertList.value[index].url==null?
                                Container(
                                  height: Get.height,
                                  width: Get.width,
                                  child: Image.asset('assets/images/image_not_found.png'),
                                ):
                                Container(
                                  height: Get.height,
                                  width: Get.width,
                                  child:Image.network('${dashboardController.getDessertList.value[index].url}',height: 150,fit: BoxFit.cover,))
                                ),
                              ),
                            )
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10.0),
                                Text('${dashboardController.getDessertList.value[index].tenMonAn}',style: AppStyle.txtInterMedium24,),
                                SizedBox(height: 10.0),
                                CustomWidgetRow(
                                  left: Text('Calories/Năng lượng: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                  right: Text('${dashboardController.getDessertList.value[index].calo}'),
                                  paddingLeft: appPadding*4,
                                ),
                                SizedBox(height: 10.0),
                                CustomWidgetRow(
                                  left: Text('Khối lượng : ',style: TextStyle(fontWeight: FontWeight.bold)),
                                  right: Text('${dashboardController.getDessertList.value[index].khoiLuong}'),
                                  paddingLeft: appPadding*4,
                                ),
                                SizedBox(height: 10.0),
                                CustomWidgetRow(
                                  left: Text('Chi tiết : ',style: TextStyle(fontWeight: FontWeight.bold)),
                                  right: Text('${dashboardController.getDessertList.value[index].chiTiet}'),
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
                                  icon: Icon(Icons.notification_add,color: cardA,size: 35,),
                                  tooltip: 'Chi tiết đặt',
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.dialog(update(
                                      dashboardController.getDessertList.value[index].maMon,
                                      dashboardController.getDessertList.value[index].tenMonAn,
                                      dashboardController.getDessertList.value[index].calo,
                                      dashboardController.getDessertList.value[index].khoiLuong,
                                      dashboardController.getDessertList.value[index].chiTiet,
                                      dashboardController.getDessertList.value[index].type,
                                      controller
                                    ));
                                  },
                                  icon: Icon(Icons.border_color_outlined,color: orange,size: 35),
                                  tooltip: 'Chỉnh sửa',
                                ),
                                IconButton(
                                  onPressed: (){
                                    Get.dialog(
                                      AlertDialog(
                                        content: Container(
                                          height: 100,
                                          width: 100,
                                          alignment: Alignment.center,
                                          child: Text('Bạn có chắc muốn xoá không?')
                                          ),
                                        actions: [
                                          CustomButtonAlert(
                                            titileDisable: 'Huỷ',
                                            titileEnable: 'Đồng ý',
                                            onPressedDisable: () => Get.back(),
                                            onPressedEnable: () {
                                              Get.back();
                                              Get.dialog(Dialog(
                                                child: CustomLoading(),
                                              ));
                                              controller.deleteFood(dashboardController.getDessertList.value[index].maMon);
                                              Future.delayed(Duration(seconds: 2),() {
                                                Get.back();
                                              },);
                                            },
                                          )
                                        ],
                                      )
                                    );
                                  },
                                  icon: Icon(Icons.delete,color: cardC,size: 35),
                                  tooltip: 'Xoá',
                                ),
                                
                              ],
                            )
                          ),
                      ],),
              );
        },
      ),
  ),);

}
DropdownMenuItem _childDropDownItem(String title) {
  return DropdownMenuItem<String>(
    value: title,
    child: Text(
      title,
      style: AppStyle.textData,
    ),
  );
}

