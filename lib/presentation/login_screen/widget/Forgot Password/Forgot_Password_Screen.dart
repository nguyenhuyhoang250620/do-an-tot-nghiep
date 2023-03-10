import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:flutter/material.dart';
import '../Core/Animation/Fade_Animation.dart';
import '../Core/Colors/Hex_Color.dart';
import '../Pin Code/Pin_Code_Screen.dart';
import '../login_content.dart';

enum FormData { Email }

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;

  FormData? selected;

  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
return Card(
    elevation: 5,
    color: darkTextColor.withOpacity(0.5),
    child: Container(
      width: 400,
      padding: const EdgeInsets.all(40.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeAnimation(
            delay: 0.8,
            child: Image.network(
              "assets/images/logo_drawer_top.png",
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FadeAnimation(
            delay: 1,
            child: Container(
              child: Text(
                "Gửi mail để nhận lại mã",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    letterSpacing: 0.5),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeAnimation(
            delay: 1,
            child: Container(
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: selected == FormData.Email
                    ? enabled
                    : backgroundColor,
              ),
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: emailController,
                onTap: () {
                  setState(() {
                    selected = FormData.Email;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: selected == FormData.Email
                        ? enabledtxt
                        : deaible,
                    size: 20,
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: selected == FormData.Email
                          ? enabledtxt
                          : deaible,
                      fontSize: 12),
                ),
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                    color: selected == FormData.Email
                        ? enabledtxt
                        : deaible,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          FadeAnimation(
            delay: 1,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const PinCodeVerificationScreen(
                      phoneNumber: '0102756960',
                    );
                  }));
                },
                child: Text(
                  "Send",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.5,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF2697FF),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 80),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.0)))),
          ),
          SizedBox(height: 10,),
          FadeAnimation(
          delay: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Thử lại? ",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 0.5,
                  )),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text("Đăng nhập",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        fontSize: 14)),
              ),
            ],
          ),
        ),
        ],
      ),
    ),
  );
  }
}