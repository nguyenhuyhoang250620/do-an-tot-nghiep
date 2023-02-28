import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({Key? key}) : super(key: key);
  final apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Hệ thống quản lý điểm danh'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text('Trang chủ'),
            onTap: () {
              Get.back();
              Get.toNamed(AppRoutes.homeScreen);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            
            title: Text('Thời gian làm việc cá nhân'),
            onTap: () {
              // Update the state of the app.
              // ...
              // Get.back();
            },
          ),
          ListTile(
            title: Text('Thời gian làm việc của nhân viên'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Thêm dữ liệu'),
            onTap: () {
  
            },
          ),
          ListTile(
            title: Text('Cài đặt tài khoản'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Nút đăng xuất trong drawer
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(onPressed: () {
                  apiClient.logout();
                },child: Text('Đăng xuất')),
              ),
            ),
            //Thông tin phiên bản
            Align(
              alignment: Alignment.bottomCenter,
              child: Text('Cerberus Cyber Security © 2022'),
            ),
          ],
        ),
      ),
    ));
  }
}
