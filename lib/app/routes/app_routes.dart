part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const Auth = _Paths.Auth;
  static const MAIN = _Paths.MAIN;
}

abstract class _Paths {
  static const Auth = '/auth';
  static const MAIN = '/main';
}
