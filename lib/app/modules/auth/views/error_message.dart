import 'package:assigment/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/conts_txt.dart';
import '../../../core/images.dart';
import '../../../core/app_colors.dart';

class ErrorMessage extends GetWidget<AuthController> {
  const ErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: AppColors.red,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    controller.showErrorMessageText.value = false;
                  },
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: SvgPicture.asset(Images.errorIcon),
                  )),
              SizedBox(
                width: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    controller.errorMessageText.value,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontFamily: tajawal, overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
