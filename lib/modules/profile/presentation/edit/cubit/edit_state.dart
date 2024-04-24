part of 'edit_cubit.dart';

@freezed
class EditState with _$EditState {
  const factory EditState.initial({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String age,
    @Default('') String email,
    @Default(false) bool isLoading,
    @Default(false) bool startDeleteAccount,
  }) = _Initial;
}
