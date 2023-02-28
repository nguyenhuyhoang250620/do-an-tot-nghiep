import 'package:play_kit/play_kit.dart';

import 'controller/login_controller.dart';
import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:flutter/material.dart';

class LoginScreen extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorConstant.whiteA700,
      body: LayoutBuilder(
        builder: (p0, p1) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: p1.maxHeight,
                width: p1.maxWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.white,
                      Colors.white,
                      Colors.black,
                    ],
                    stops: [0.0, 0.5, 0.5, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Container(
                height: p1.maxHeight*0.9,
                width: p1.maxWidth*0.9,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.white,
                      Colors.white,
                      Colors.black,
                    ],
                    stops: [0.0, 0.5, 0.5, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
                Container(
                height: p1.maxHeight*0.8,
                width: p1.maxWidth*0.8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.white,
                      Colors.white,
                      Colors.black,
                    ],
                    stops: [0.0, 0.5, 0.5, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
                Container(
                height: p1.maxHeight*0.7,
                width: p1.maxWidth*0.7,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.white,
                      Colors.white,
                      Colors.black,
                    ],
                    stops: [0.0, 0.5, 0.5, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
                Container(
                height: p1.maxHeight*0.6,
                width: p1.maxWidth*0.6,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.white,
                      Colors.white,
                      Colors.black,
                    ],
                    stops: [0.0, 0.5, 0.5, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
                Container(
                height: p1.maxHeight*0.5,
                width: p1.maxWidth*0.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.white,
                      Colors.white,
                      Colors.black,
                    ],
                    stops: [0.0, 0.5, 0.5, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
                Container(
                height: p1.maxHeight*0.4,
                width: p1.maxWidth*0.4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.white,
                      Colors.white,
                      Colors.black,
                    ],
                    stops: [0.0, 0.5, 0.5, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                  height: p1.maxHeight*0.5,
                  width: p1.maxWidth*0.3,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.8),
                          spreadRadius: 10,
                          blurRadius: 4,
                          offset: Offset(0, 3), // Đặt khoảng cách đổ bóng theo chiều dọc
                        ),
                      ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Center(child:Text(
                          "Đăng nhập",
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontFamily: "Roboto",
                            // Thêm các thuộc tính khác tùy theo nhu cầu
                          ),
                        )),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                          ),
                          // Các thuộc tính khác của TextField
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Obx(() => TextField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon:  IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                controller.obscureText.value = !controller.obscureText.value;
                              },
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                          ),
                          obscureText: controller.obscureText.value,
                          // Các thuộc tính khác của TextField
                        ),)
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              Get.dialog(
                                Dialog(child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                                  height: p1.maxHeight*0.3,
                                  width: p1.maxWidth*0.3,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Center(
                                          child: Text("Nhập lại email"),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: TextField(
                                        controller: controller.emailControllerForgot,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                            borderSide: BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                            borderSide: BorderSide(color: Colors.blue),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Email',
                                          prefixIcon: Icon(Icons.email),
                                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                                        ),
                                        // Các thuộc tính khác của TextField
                                                                          ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blueAccent.withOpacity(0.5),
                                          onPrimary: Colors.white,
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          elevation: 5.0,
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10.0,
                                            horizontal: 20.0,
                                          ),
                                          // Các thuộc tính khác của ElevatedButton.styleFrom
                                        ),
                                        child: Text('Gửi mã'),
                                        onPressed: () {
                                          Get.back();
                                          controller.forgetPassword(controller.emailControllerForgot.value.text);
                                                                    
                                          // Xử lý khi nhấn nút
                                        },
                                       ),
                                      ),
                                    ],
                                  ),
                                ),)
                              );
                            },
                            child: Text("Quên mật khẩu?",style: AppStyle.txtInterRegular14.copyWith(fontStyle: FontStyle.italic),)
                            ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent.withOpacity(0.5),
                            onPrimary: Colors.white,
                            textStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            elevation: 5.0,
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
                            // Các thuộc tính khác của ElevatedButton.styleFrom
                          ),
                          child: Text('Đăng nhập'),
                          onPressed: () {
                            controller.onLogin(controller.emailController.value.text, controller.passwordController.value.text);
                            // Xử lý khi nhấn nút
                          },
                        ),
                      )
                    ],
                  ),
                              ),
                )
            ],
          );
        },
      ),
    ));
  }
}
