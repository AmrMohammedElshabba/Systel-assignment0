import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.init() = _Init;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.success() = _success;
  const factory AuthState.failure(String errorMessage) = _Failure;
}