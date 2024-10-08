import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: appPadding),
          padding: EdgeInsets.symmetric(
            horizontal: appPadding,
            vertical: appPadding / 2,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
                child: Text('👋, Xin chào',style: TextStyle(
                  color: darkTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),),
              ),
              ClipRRect(
                child: Container(
                  height: 30,
                  width: 30,
                  child: Icon(Icons.person,color: darkTextColor)),
                borderRadius: BorderRadius.circular(30),
              ),
            ],
          ),
        )
      ],
    );
  }
}
