import 'dart:async';
import 'package:flash/flash.dart';
import 'package:assigment/app/core/widget/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import '../../../core/conts_txt.dart';
import '../../../core/data/presentation/loading_dialog.dart';
import '../../../core/images.dart';
import '../../../core/widget/custom_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';
import 'error_message.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Images.registrationBackground),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 37),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///error Message show when user enter wrong email or pass
                      ///
                      Obx(() {
                        return controller.showErrorMessageText.value
                            ? ErrorMessage()
                            : Container();
                      }),

                      ///
                      ///
                      SizedBox(
                        height: 19,
                      ),
                      CustomTextFormField(
                        hitText: "Username or Email",
                        keybordType: TextInputType.emailAddress,
                        validator: (value) => controller.emailValidate(value!),
                        controller: controller.emailController,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      CustomTextFormField(
                        hitText: "Password",
                        keybordType: TextInputType.visiblePassword,
                        validator: (value) =>
                            controller.passwordValidate(value!),
                        controller: controller.passwordController,
                        obsecureText: true,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 63,
                  left: 37,
                  right: 37,
                  child: CustomButton(
                    onTap: () async {
                      final loadingCompleter = Completer<bool>();
                      context.showBlockDialog(
                        transitionDuration: Duration.zero,
                        dismissCompleter: loadingCompleter,
                        child: const LoadingDialog(),
                      );
                      final state = await controller.registerOrLogin();

                      loadingCompleter.complete(true);

                      state.maybeWhen(
                        orElse: () {},
                        success: () {
                          Get.offNamed(
                            Routes.MAIN,
                          );
                        },
                        failure: (errorMessage) {
                          controller.showErrorMessage(errorMessage);
                        },
                      );
                    },
                    title: 'Register/Log in',
                    fontFamily: compactBold,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
