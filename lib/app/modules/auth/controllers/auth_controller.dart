import 'package:assigment/app/modules/auth/controllers/auth_state.dart';
import 'package:assigment/app/modules/auth/infrastructure/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';


class AuthController extends GetxController {
  AuthRepository _authRepository;

  AuthController(this._authRepository);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxBool showErrorMessageText = false.obs;
  RxString errorMessageText = ''.obs;

  void showErrorMessage(String message){
    showErrorMessageText.value =true;
    errorMessageText.value =message;
  }

  String? passwordValidate(String value) {
    if (value.isEmpty) {
      return "This is a required field";
    } else if (value.length < 8) {
      return "Weak password";
    }
    return null;
  }

  String? emailValidate(String value) {
    if (value.isEmpty) {
      return "This is a required field";
    } else if (value.length < 4) {
      return "Weak email/user name";
    }
    return null;
  }

  Rx<AuthState> _authState = const AuthState.init().obs;

  Rx<AuthState> get authState => _authState;

  Future<AuthState> registerOrLogin() async {
    final userNameOrEmail = emailController.text.trim();
    final password = passwordController.text.trim();

    if (formKey.currentState!.validate()) {
      final failureOrSuccess = await _authRepository.registerOrLogin(
          userNameOrEmail: userNameOrEmail, password: password);

      return failureOrSuccess.fold(
        (success) => _authState.value = AuthState.success(),
        (errorMessage) {
          errorMessageText.value = errorMessage;
          return _authState.value = AuthState.failure(errorMessage);
        },
      );
    }
    return _authState.value = AuthState.failure('Credentials are incorrect');
  }
}
