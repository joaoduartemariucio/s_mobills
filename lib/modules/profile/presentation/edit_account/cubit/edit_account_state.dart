part of 'edit_account_cubit.dart';

@freezed
class EditAccountState with _$EditAccountState {
  const factory EditAccountState.initial({
    @Default(false) bool isSaveLoading,
    @Default(false) bool isDeleteLoading,
    @Default(-1) int id,
    @Default('') String name,
    @Default(0) double balance,
  }) = _Initial;
}
