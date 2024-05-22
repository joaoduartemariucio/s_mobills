part of 'create_account_cubit.dart';

@freezed
class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState.initial({
    @Default('') String name,
    @Default(0) double balance,
    @Default(false) bool isLoading,
  }) = _Initial;
}
