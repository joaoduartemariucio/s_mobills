part of 'edit_cubit.dart';

@freezed
class EditState with _$EditState {
  const factory EditState.initial({
    @Default('') String name,
    @Default('') String age,
    @Default('') String email,
  }) = _Initial;
}
