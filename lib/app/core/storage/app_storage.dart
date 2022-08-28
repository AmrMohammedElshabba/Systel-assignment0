import 'dart:convert';
import 'package:assigment/app/modules/main/domain/activity.dart';
import 'package:assigment/app/modules/main/domain/wallet.dart';
import 'package:get_storage/get_storage.dart';
import '../../modules/main/domain/slave_user.dart';
import 'keys.dart';

class AppStorage {
  final GetStorage _storage;

  AppStorage(this._storage);

  final List<SlaveUsers> slaveUserList = [
    SlaveUsers(name: 'Amr', amount: '185.0', lastTransactionDate: '20/9'),
    SlaveUsers(name: 'Mohamed', amount: '320.0', lastTransactionDate: '4/9'),
    SlaveUsers(name: 'Ahmed', amount: '215.0', lastTransactionDate: '14/7'),
  ];

  final Wallet wallet = Wallet(amount: '920.0', lastTransactionDate: '24/6');
  final Activity activity =
      Activity(amount: '245.0', lastTransactionDate: '10/5');

  Future<void> storeSlaveUser() async {
    /*
    convert object to string to store it in get storage
     */
    List<String> slaveUser = [];
    slaveUserList.forEach((element) {
      return slaveUser.add(jsonEncode(element));
    });
    await _storage.write(Keys.slaveUsers, slaveUser);
  }

  Future<void> storeWalletAndActivity() async {
    /*
    convert object to string to store it in get storage
     */
    await _storage.write(Keys.wallet, jsonEncode(wallet));
    await _storage.write(Keys.activity, jsonEncode(activity));
  }

  List<SlaveUsers> getSlaveUsers() {
    List<String> slaveUsers = [];
    slaveUsers = _storage.read(Keys.slaveUsers)!;

    List<SlaveUsers> slaveUsersList = [];

    slaveUsers.forEach((element) {
      slaveUsersList.add(SlaveUsers.fromJson(jsonDecode(element)));
    });

    return slaveUsersList;
  }

  Wallet getWallet() {
    String walletString = _storage.read(Keys.wallet)!;
    Wallet wallet = Wallet.fromJson(jsonDecode(walletString));
    return wallet;
  }

  Activity getActivity() {
    String activityString = _storage.read(Keys.activity)!;
    Activity activity = Activity.fromJson(jsonDecode(activityString));
    return activity;
  }
}
