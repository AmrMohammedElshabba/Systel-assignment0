import 'package:assigment/app/core/storage/app_storage.dart';
import 'package:assigment/app/core/storage/auth_local_manager.dart';
import 'package:assigment/app/modules/main/domain/activity.dart';
import 'package:assigment/app/modules/main/domain/slave_user.dart';
import 'package:assigment/app/modules/main/domain/wallet.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class MainRepository {
  AppStorage _appStorage;
  AuthLocalManager _authLocalManager;

  MainRepository(this._appStorage,this._authLocalManager);




  ParseUser getMainUser(){
    return _authLocalManager.getUser()!;
  }


  List<SlaveUsers> getSlaveUsers() {
    return _appStorage.getSlaveUsers();
  }

  Wallet getWallet() {
    return _appStorage.getWallet();
  }

  Activity getActivity() {
    return _appStorage.getActivity();
  }
}
