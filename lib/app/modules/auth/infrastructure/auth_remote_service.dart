import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class AuthRemoteService {
  Future<Either<ParseUser, String>> registerOrLogin(
      {userNameOrEmail, password}) async {
    final user =
        ParseUser.createUser(userNameOrEmail, password, userNameOrEmail);
    final loginResponse = await user.login();
    if (loginResponse.success) {
      return Left(loginResponse.result);
    } else if (loginResponse.statusCode == 101) {
      final user =
          ParseUser.createUser(userNameOrEmail, password, userNameOrEmail);
      final registerResponse = await user.signUp();
      if (registerResponse.success) {
        return Left(registerResponse.result);
      } else {
        return Right(loginResponse.error!.message.toString());
      }
    } else {
      return Right("No internet connection");
    }
  }
}
