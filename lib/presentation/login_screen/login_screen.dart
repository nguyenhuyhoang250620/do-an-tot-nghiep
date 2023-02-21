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
      //back button
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //title
        title: Text("Đăng nhập", style: AppStyle.txtInterRegular18.copyWith(color: ColorConstant.gray900, fontSize: getSize(22), fontWeight: FontWeight.w400)),
      ),
      backgroundColor: ColorConstant.whiteA700,
      body: LayoutBuilder(
        builder: (p0, p1) {
          return Stack(
            alignment: Alignment.center,
            children: [
              CommonImageView(
                width: p1.maxWidth,
                height: p1.maxHeight,
                fit: BoxFit.cover,
                imagePath: ImageConstant.background,
              ),
              PlayContainer(
                height: p1.maxHeight,
                width: p1.maxWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: PlayContainer(
                        height: 50,
                        width: 350,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Tài khoản',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          controller: controller.usernameController,
                          focusNode: controller.usernameFocusNode,
                          onSubmitted: (value) {
                            controller.usernameFocusNode.unfocus();
                            FocusScope.of(context).requestFocus(controller.passwordFocusNode);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: PlayContainer(
                        height: 50,
                        width: 350,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Mật khẩu',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          onSubmitted: (value) {
                            controller.passwordFocusNode.unfocus();
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: PlayContainer(
                        height: 50,
                        width: 350,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.onLogin(controller.usernameController.text,controller.passwordController.text);
                          },
                          child: Text("Đăng nhập", style: AppStyle.txtInterRegular18.copyWith(color: ColorConstant.gray900, fontSize: getSize(22), fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}
