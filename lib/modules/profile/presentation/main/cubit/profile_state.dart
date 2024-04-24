part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial({
    @Default('') String name,
    @Default('') String email,
    @Default('') String initialLetters,
    @Default(false) bool isLoading,
  }) = _Initial;
}
