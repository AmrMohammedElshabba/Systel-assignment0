import 'package:assigment/app/core/storage/auth_local_manager.dart';
import 'package:assigment/app/modules/auth/infrastructure/auth_remote_service.dart';
import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';


class AuthRepository {
  AuthRemoteService _authRemoteService;
  AuthLocalManager _authLocalManager;

  AuthRepository(this._authRemoteService, this._authLocalManager);

  Future<Either<ParseUser, String>> registerOrLogin(
      {userNameOrEmail, password}) async {
    final failureOrSuccess = await _authRemoteService.registerOrLogin(
        userNameOrEmail: userNameOrEmail, password: password);

    return failureOrSuccess.fold(
      (user) {
        _authLocalManager.saveUser(user);
        return Left(user);
      },
      (errorMessage) {
        return Right(errorMessage);
      },
    );
  }
}
