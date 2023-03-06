import 'package:do_an_tot_nghiep/presentation/login_screen/widget/login_content.dart';
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
      body: LoginContent(loginController: controller,)
    ));
  }
}
