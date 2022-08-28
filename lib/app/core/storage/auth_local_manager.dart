import 'package:get_storage/get_storage.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'keys.dart';


class AuthLocalManager {
  final GetStorage _storage;

  AuthLocalManager(this._storage);



  void saveUser(ParseUser user) {
    _storage.write(
        Keys.user, user);
  }

  ParseUser? getUser() => _storage.read<ParseUser>(Keys.user);

}


