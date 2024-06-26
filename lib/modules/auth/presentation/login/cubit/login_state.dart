part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoading,
  }) = _Initial;
}
