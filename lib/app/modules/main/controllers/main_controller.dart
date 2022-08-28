import 'package:assigment/app/core/app_colors.dart';
import 'package:assigment/app/modules/main/domain/activity.dart';
import 'package:assigment/app/modules/main/domain/slave_user.dart';
import 'package:assigment/app/modules/main/domain/wallet.dart';
import 'package:assigment/app/modules/main/infrastructure/main_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class MainController extends GetxController {
  MainRepository _mainRepository;

  MainController(this._mainRepository);

  @override
  void onInit() {
    getAllHomeData();
    super.onInit();
  }

  void getAllHomeData() {
    _isLoading = true;
    getMainUser();
    getSlaveUser();
    getActivity();
    getWallet();
    _isLoading = false;
    update();
  }

  List<Color> slaveUserContainerColor = [
    AppColors.orange,
    AppColors.pastelRed,
    AppColors.perpule
  ];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<SlaveUsers> _slaveUsers = [];

  List<SlaveUsers> get slaveUsers => _slaveUsers;

  Wallet? _wallet;

  Wallet? get wallet => _wallet;

  Activity? _activity;

  Activity? get activity => _activity;

  ParseUser? _mainUser;

  ParseUser? get mainUser => _mainUser;

  void getSlaveUser() {
    _slaveUsers = _mainRepository.getSlaveUsers();
    print(_slaveUsers[0].amount);
    update();
  }

  void getWallet() {
    _wallet = _mainRepository.getWallet();
    update();
  }

  void getActivity() {
    _activity = _mainRepository.getActivity();
    update();
  }

  void getMainUser() {
    _mainUser = _mainRepository.getMainUser();
    update();
  }
}
