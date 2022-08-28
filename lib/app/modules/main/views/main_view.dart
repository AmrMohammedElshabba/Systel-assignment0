import 'package:assigment/app/core/app_colors.dart';
import 'package:assigment/app/modules/main/views/slave_users.dart';
import 'package:assigment/app/modules/main/views/wallet_and_activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/conts_txt.dart';
import '../../../core/images.dart';
import '../../../core/widget/custom_button.dart';
import '../controllers/main_controller.dart';
import 'main_user_pic_and_name.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            Images.homeBackground,
          ),
        ),
        SingleChildScrollView(
            child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(Images.notification),
                          SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(Images.categoryIcon),
                        ],
                      ),
                      SizedBox(
                        height: 47,
                      ),
                      MainUserPicAndName(),
                      SizedBox(
                        height: 54,
                      ),
                      WalletAndActivity(),
                      SizedBox(
                        height: 42,
                      ),
                      CustomButton(
                        title: 'Test',
                        icon: Icons.arrow_forward_ios_rounded,
                        height: 100,
                        fontSize: 22,
                        fontFamily: compactRegular,
                      ),
                      SizedBox(
                        height: 39,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Users",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: AppColors.black),
                          ),
                          SizedBox(
                              height: 31,
                              width: 31,
                              child: SvgPicture.asset(Images.plusIcon))
                        ],
                      ),

                    ],
                  ),
                ),
                SlaveUsers(),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
