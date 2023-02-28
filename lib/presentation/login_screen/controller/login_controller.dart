
import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/presentation/login_screen/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '/core/app_export.dart';

class LoginController extends GetxController {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController emailControllerForgot = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final apiClient = ApiClient();
  final dio = Dio();
  var obscureText = true.obs;
  Rx<LoginScreenModel> appNavigationModelObj = LoginScreenModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void onLogin(String email,String password) {
    apiClient.login(email, password);
  }

  void forgetPassword(String email){
    apiClient.forgetPassword(email);
  }

}
